
local QUIViewController = import("..QUIViewController")
local QUIDialog = class("QUIDialog", QUIViewController)

local QNotificationCenter = import("...controllers.QNotificationCenter")
local QNavigationController = import("...controllers.QNavigationController")

QUIDialog.EFFECT_IN_SCALE = "showDialogScale" --缩放进场
QUIDialog.EFFECT_OUT_SCALE = "hideDialogScale" --缩放出场

function QUIDialog:ctor(fguiFile, resName, callbacks, options)
	QUIDialog.super.ctor(self, QUIViewController.TYPE_DIALOG, fguiFile, resName, callbacks, options)
    self:setOptions(options)

    self.___handlers = {}
    self.isAnimation = false --是否动画显示
    self.effectInName = QUIDialog.EFFECT_IN_SCALE --采用的动画名称
    self.effectOutName = QUIDialog.EFFECT_OUT_SCALE --采用的动画名称
    if options ~= nil then
        self.isQuickWay = options.isQuickWay
        if options.effectInName ~= nil then
            self.effectInName = options.effectInName
        end
        if options.effectOutName ~= nil then
            self.effectOutName = options.effectOutName
        end
    end
    self._isLock = false --是否唯一窗口
    self._isTouchSwallow = true
    self._enableDialogEvent = true
    if options ~= nil and options.isChild ~= nil then
        self._isChild = options.isChild
    else
        self._isChild =  false
    end

    self._enable = true
end

function QUIDialog:getOptions()
    if self._options == nil then self._options = {} end
    return self._options
end

function QUIDialog:setOptions(options)
    self._options = options
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
        if self.isQuickWay == true then
            page:setScalingVisible(false)
        end
    end
end

--删除返回按钮
function QUIDialog:removeBackEvent()
    QNotificationCenter.sharedNotificationCenter():removeMainPageEvent(self)
end

function QUIDialog:getView()
    return self._view
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

function QUIDialog:_enableTouchSwallow()
    if(self:getBackRoot() == nil) then return end

    if self._backTouchLayer == nil then
        self._backTouchLayer = cc.LayerColor:create(cc.c4b(0, 0, 0, 128), display.width, display.height)
        self._backTouchLayer:setPosition(0, -display.height)
        self._backTouchLayer:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)
        self._backTouchLayer:addNodeEventListener(cc.NODE_TOUCH_EVENT, handler(self, self._onTouchEnable))
        self._backTouchLayer:setTouchEnabled(true)

        self:getBackRoot():addChild(self._backTouchLayer)
    end
end

function QUIDialog:_disableTouchSwallow()
    if self._backTouchLayer ~= nil then
        self._backTouchLayer:removeFromParent()
        self._backTouchLayer = nil
    end
end

--set back button enable
function QUIDialog:setBackBtnEnable(b )
    local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
    if page ~= nil and page.setBackBtnEnable ~= nil then
        page:setBackBtnEnable(b)
    end
end

--add touch layer at top layer stop touch event
function QUIDialog:enableTouchSwallowTop()
    if(self:getBackRoot() == nil) then return end

    if self._topTouchLayer == nil then
        self._enable = false
        self._topTouchLayer = CCLayerColor:create(ccc4(0, 0, 0, 0), display.width, display.height)
        self._topTouchLayer:setPosition(-display.width/2, -display.height/2)
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

function QUIDialog:popSelf()
    app:getNavigationManager():popViewController(self:getOptions().layerIndex, QNavigationController.POP_TOP_CONTROLLER)
end

function QUIDialog:_onTouchEnable(event)
    if event.name == "began" then
        return true
    elseif event.name == "moved" then
        
    elseif event.name == "ended" then
        if self.isAnimation == true and self._isEffectPlay == true then
            return
        end
        local handler = self:getRoot():performWithDelay(self:safeHandler(function()
            self:_backClickHandler(event)
            end),0)
        table.insert(self.___handlers, handler)
    elseif event.name == "cancelled" then
        
    end
end

function QUIDialog:_topClickHandler()

end

function QUIDialog:_onTouchTopEnable(event)
    if event.name == "began" then
        return true
    elseif event.name == "moved" then
        
    elseif event.name == "ended" then
        if self.isAnimation == true and self._isEffectPlay == true then
            return
        end
        local handler = self:getRoot():performWithDelay(self:safeHandler(function()
            self:_topClickHandler(event)
            end),0)
        table.insert(self.___handlers, handler)
    elseif event.name == "cancelled" then
        
    end
end

return QUIDialog