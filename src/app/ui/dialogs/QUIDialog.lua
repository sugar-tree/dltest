
local QUIViewController = import("..QUIViewController")
local QUIDialog = class("QUIDialog", QUIViewController)

local QNotificationCenter = import("...controllers.QNotificationCenter")
local QNavigationController = import("...controllers.QNavigationController")

QUIDialog.EFFECT_IN_SCALE = "showDialogScale" --缩放进场
QUIDialog.EFFECT_OUT_SCALE = "hideDialogScale" --缩放出场

function QUIDialog:ctor(fguiFile, resName, callbacks, options)
	QUIDialog.super.ctor(self, QUIViewController.TYPE_DIALOG, fguiFile, resName, callbacks)

    self:setOptions(options)

    self.isAnimation = false --是否动画显示
    self.effectInName = options.effectInName or QUIDialog.EFFECT_IN_SCALE
    self.effectOutName = options.effectOutName or QUIDialog.EFFECT_OUT_SCALE 

    self._isChild = options.isChild or false
    self._isTouchSwallow = true
    self._enableDialogEvent = true
    self._isLock = false --是否唯一窗口
    self._enable = true
end

function QUIDialog:getOptions()
    return self._options
end

function QUIDialog:setOptions(options)
    self._options = options or {}
end

function QUIDialog:getEnable()
    return self._enable
end

--添加返回按钮
function QUIDialog:addBackEvent(isShowHome)
    self._isShowHome = isShowHome
    if self._isShowHome == nil then self._isShowHome = true end
    local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
    if page ~= nil and page.setBackBtnVisible ~= nil then
        page:setBackBtnVisible(true)
        page:setHomeBtnVisible(self._isShowHome)
        QNotificationCenter.sharedNotificationCenter():addMainPageEvent(self)
    end
end

--删除返回按钮
function QUIDialog:removeBackEvent()
    QNotificationCenter.sharedNotificationCenter():removeMainPageEvent(self)
end

function QUIDialog:playEffectIn()
    if self._isEffectPlay == true then
        return 
    end
    if self.isAnimation then
        self:createAnimationProxy()
        self._isEffectPlay = true
        self._rootAnimationManager:runAnimationsForSequenceNamed(self.effectInName)
    else
        self:viewAnimationInHandler()
    end
end

function QUIDialog:playEffectOut()
    if self._isEffectPlay == true then
        return 
    end
    if self.isAnimation then
        self._isEffectPlay = true
        self._rootAnimationManager:runAnimationsForSequenceNamed(self.effectOutName)
    else
        self:viewAnimationOutHandler()
    end
end

function QUIDialog:_onTrigger(callback, ...)
    if self.isAnimation and self._isEffectPlay == true then
        return
    end

    callback(...)
end

--[[
    设置dialog是否锁住
    锁住的dialog同时只会存在一个
--]]
function QUIDialog:setLock(b)
    self._isLock = b
end

function QUIDialog:getLock()
    return self._isLock
end

function QUIDialog:viewDidAppear()
    QUIDialog.super.viewDidAppear(self)
    if self._isChild ~= true and self._isTouchSwallow == true then
        self:_enableTouchSwallow()
    end

    if self._enableDialogEvent == true then
        QNotificationCenter.sharedNotificationCenter():dispatchEvent({name = QNotificationCenter.EVENT_DIALOG_DID_APPEAR})
    end
end

function QUIDialog:viewWillDisappear()
    QUIDialog.super.viewWillDisappear(self)
    self:_disableTouchSwallow()

    self:removeAnimationProxy()

    if self._enableDialogEvent == true then
        QNotificationCenter.sharedNotificationCenter():dispatchEvent({name = QNotificationCenter.EVENT_DIALOG_WILL_DISAPPEAR})
    end
end

function QUIDialog:createAnimationProxy()
    self._rootAnimationManager = tolua.cast(self._root:getUserObject(), "CCBAnimationManager")
    self._rootAnimationManager:connectScriptHandler(handler(self, self.rootAnimationEndHandler))
end

function QUIDialog:removeAnimationProxy()
    if self._rootAnimationManager then
        self._rootAnimationManager:disconnectScriptHandler()
    end
end

function QUIDialog:rootAnimationEndHandler(name)
    if name == self.effectInName then
        self._isEffectPlay = false
        self:viewAnimationInHandler()
    elseif name == self.effectOutName then
        self:viewAnimationOutHandler()
    end
end

function QUIDialog:getEffectPlay()
    return self._isEffectPlay or false
end

function QUIDialog:viewAnimationInHandler()

end

function QUIDialog:viewAnimationOutHandler()
    self:popSelf()
end

function QUIDialog:onTriggerBackHandler()
    app:getNavigationManager():popViewController(app.mainUILayer, QNavigationController.POP_TOP_CONTROLLER)
end

function QUIDialog:onTriggerHomeHandler()
    if self._isShowHome then
        app:getNavigationManager():popViewController(app.mainUILayer, QNavigationController.POP_TO_CURRENT_PAGE)
    end
end

--set back button enable
function QUIDialog:setBackBtnEnable(b )
    local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
    if page ~= nil and page.setBackBtnEnable ~= nil then
        page:setBackBtnEnable(b)
    end
end

function QUIDialog:popSelf()
    app:getNavigationManager():popViewController(self:getOptions().layerIndex, QNavigationController.POP_TOP_CONTROLLER)
end

function QUIDialog:_enableTouchSwallow()
    if self:getComponent() == nil then return end

    self._gComponent:setOpaque(true)
    self._gComponent:addEventListener(fairygui.UIEventType.TouchBegin, handler(self, self._onTouchEnable))
    self._gComponent:addEventListener(fairygui.UIEventType.TouchEnd, handler(self, self._onTouchEnable))
end

function QUIDialog:_disableTouchSwallow()
    if self:getComponent() == nil then return end

    self._gComponent:setOpaque(false)
    self._gComponent:removeEventListeners()
end

--add touch layer at top layer stop touch event
function QUIDialog:enableTouchSwallowTop()
    if self:getComponent() == nil then return end

    if self._topTouchLayer == nil then
        self._enable = false
        self._topTouchLayer = cc.LayerColor:create(cc.c4b(255, 0, 0, 0), display.width, display.height)
        self._topTouchLayer:setPosition(0, -display.height)
        self._topTouchLayer:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)
        self._topTouchLayer:addNodeEventListener(cc.NODE_TOUCH_EVENT, handler(self, self._onTouchTopEnable))
        self._topTouchLayer:setTouchEnabled(true)
        self:getRoot():addChild(self._topTouchLayer, 10000)
    end
end

--remove touch layer at top layer stop touch event
function QUIDialog:disableTouchSwallowTop()
    if self._topTouchLayer ~= nil then
        self._enable = true
        self._topTouchLayer:removeFromParent()
        self._topTouchLayer = nil
    end
end

function QUIDialog:_backClickHandler()
    
end

function QUIDialog:_onTouchEnable(event)
    if self.isAnimation == true and self._isEffectPlay == true then
        return
    end
    local input = event:getInput()
    local touchPos = input:getTouch():getLocation()
    -- 屏蔽点击关闭需要在gui里加这个节点
    local touchNode = self._fguiOwner.__touch
    if touchNode and touchNode:displayObject():hitTest(touchPos) then 
        return
    end
    local eventType = event:getType()
    if eventType == fairygui.UIEventType.TouchEnd then
        self:getRoot():performWithDelay(function()
            self:_backClickHandler(event)
        end, 0)
    end
end

function QUIDialog:_topClickHandler()

end

function QUIDialog:_onTouchTopEnable(event)
    if self.isAnimation == true and self._isEffectPlay == true then
        return
    end
    if event.name == "began" then
        return true
    elseif event.name == "ended" then
        self:getRoot():performWithDelay(function()
            self:_topClickHandler(event)
        end, 0)
    end
end

return QUIDialog