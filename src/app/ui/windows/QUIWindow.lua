
local QUIWindow = class("QUIWindow", function()
    return fairygui.Window:create()
end)

function QUIWindow:ctor(fguiFile, resName, callbacks, options)
    self._options = options or {}
    self._fguiOwner = {}
    self._appear = false

    -- guiView
    self._gComponent = nil
    if fguiFile and resName then
        fairygui.UIPackage:addPackage("fairygui/"..fguiFile)
        self._gComponent = fairygui.UIPackage:createObject(fguiFile, resName)
        
        if self._gComponent == nil then
            assert(false, "load fguiFile:" .. fguiFile .. " faild!")
        end

        -- 回调函数
        if callbacks ~= nil then
            self:_setFGUICallbacks(callbacks)
        end
        
        -- 节点
        local childList = self._gComponent:getChildren()
        for i, child in pairs(childList) do
            self._fguiOwner[child.name] = child
        end
    end
    if self._options.isPopTop then
        app:popTopWindew()
    end

    self:setContentPane(self._gComponent)
    self:setModal(true)
    self:show()

    self._parentViewController = nil
    self._subViewControllers = {}
end

function QUIWindow:getOptions()
    return self._options
end

function QUIWindow:setOptions(options)
    self._options = options or {}
end

function QUIWindow:getEnable()
    return self._enable
end

--添加返回按钮
function QUIWindow:addBackEvent(isShowHome)
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
function QUIWindow:removeBackEvent()
    QNotificationCenter.sharedNotificationCenter():removeMainPageEvent(self)
end

function QUIWindow:playEffectIn()
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

function QUIWindow:playEffectOut()
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

function QUIWindow:_onTrigger(callback, ...)
    if self.isAnimation and self._isEffectPlay == true then
        return
    end

    callback(...)
end

--[[
    设置dialog是否锁住
    锁住的dialog同时只会存在一个
--]]
function QUIWindow:setLock(b)
    self._isLock = b
end

function QUIWindow:getLock()
    return self._isLock
end

function QUIWindow:viewDidAppear()
    QUIWindow.super.viewDidAppear(self)
    if self._isChild ~= true and self._isTouchSwallow == true then
        self:_enableTouchSwallow()
    end

    if self._enableDialogEvent == true then
        QNotificationCenter.sharedNotificationCenter():dispatchEvent({name = QNotificationCenter.EVENT_DIALOG_DID_APPEAR})
    end
end

function QUIWindow:viewWillDisappear()
    QUIWindow.super.viewWillDisappear(self)
    self:_disableTouchSwallow()

    self:removeAnimationProxy()

    if self._enableDialogEvent == true then
        QNotificationCenter.sharedNotificationCenter():dispatchEvent({name = QNotificationCenter.EVENT_DIALOG_WILL_DISAPPEAR})
    end
end

function QUIWindow:createAnimationProxy()
    self._rootAnimationManager = tolua.cast(self._root:getUserObject(), "CCBAnimationManager")
    self._rootAnimationManager:connectScriptHandler(handler(self, self.rootAnimationEndHandler))
end

function QUIWindow:removeAnimationProxy()
    if self._rootAnimationManager then
        self._rootAnimationManager:disconnectScriptHandler()
    end
end

function QUIWindow:rootAnimationEndHandler(name)
    if name == self.effectInName then
        self._isEffectPlay = false
        self:viewAnimationInHandler()
    elseif name == self.effectOutName then
        self:viewAnimationOutHandler()
    end
end

function QUIWindow:getEffectPlay()
    return self._isEffectPlay or false
end

function QUIWindow:viewAnimationInHandler()

end

function QUIWindow:viewAnimationOutHandler()
    self:popSelf()
end

function QUIWindow:onTriggerBackHandler()
    app:getNavigationManager():popViewController(app.mainUILayer, QNavigationController.POP_TOP_CONTROLLER)
end

function QUIWindow:onTriggerHomeHandler()
    if self._isShowHome then
        app:getNavigationManager():popViewController(app.mainUILayer, QNavigationController.POP_TO_CURRENT_PAGE)
    end
end

--set back button enable
function QUIWindow:setBackBtnEnable(b )
    local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
    if page ~= nil and page.setBackBtnEnable ~= nil then
        page:setBackBtnEnable(b)
    end
end

function QUIWindow:popSelf()
    self:hide()
    -- app:getNavigationManager():popViewController(self:getOptions().layerIndex, QNavigationController.POP_TOP_CONTROLLER)
end

function QUIWindow:_enableTouchSwallow()
    if self:getComponent() == nil then return end

    self._gComponent:setOpaque(true)
    self._gComponent:addEventListener(fairygui.UIEventType.TouchBegin, handler(self, self._onTouchEnable))
    self._gComponent:addEventListener(fairygui.UIEventType.TouchEnd, handler(self, self._onTouchEnable))
end

function QUIWindow:_disableTouchSwallow()
    if self:getComponent() == nil then return end

    self._gComponent:setOpaque(false)
    self._gComponent:removeEventListeners()
end

--add touch layer at top layer stop touch event
function QUIWindow:enableTouchSwallowTop()
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
function QUIWindow:disableTouchSwallowTop()
    if self._topTouchLayer ~= nil then
        self._enable = true
        self._topTouchLayer:removeFromParent()
        self._topTouchLayer = nil
    end
end

function QUIWindow:_backClickHandler()
    
end

function QUIWindow:_onTouchEnable(event)
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

function QUIWindow:_topClickHandler()

end

function QUIWindow:_onTouchTopEnable(event)
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

function QUIWindow:_setFGUICallbacks(callbacks)
    for i, v in pairs(callbacks) do
        local childName = v.childName
        local callback = v.callback
        if childName ~= nil and callback ~= nil then
            local btn = self._gComponent:getChild(childName)
            if btn then
                btn:addEventListener(fairygui.UIEventType.Click, function(context)
                    callback(context)
                end)
            else
                print("no btn named "..childName)
            end
        end
    end
end

return QUIWindow