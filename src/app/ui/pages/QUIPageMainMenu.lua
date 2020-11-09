local QUIPage = import(".QUIPage")
local QUIPageMainMenu = class("QUIPageMainMenu", QUIPage)

local QUIViewController = import("..QUIViewController")
local QUIWidgetHomeBack = import("..widgets.QUIWidgetHomeBack")
local QUIWidgetHomeDrop = import("..widgets.QUIWidgetHomeDrop")
local QUIWindowConfirm = import("..windows.QUIWindowConfirm")


function QUIPageMainMenu:ctor(options)
    local fguiFile = "page_main"
	local resName = "main"
    local callbacks = {
        {childName = "btn_instance", callback = handler(self, self._onTriggerInstance)},
        {childName = "btn_sunwell", callback = handler(self, self._onTriggerSunwell)},
    }
    QUIPageMainMenu.super.ctor(self, fguiFile, resName, callbacks, options)

    self._isMoveing = false
    self._isTouchBegin = false
    self._lastPositionX = 0
    self._totalWidth = self._fguiOwner.node_near:getWidth()
    self._minLeftX = self._fguiOwner.node_near:getX()

    self._homeBack = QUIWidgetHomeBack.new()
    self._homeBack:setPosition(0, -display.height)
    self:addTopFairyChild(self._homeBack)

    self._homeDrop = QUIWidgetHomeDrop.new()
    self._homeDrop:setPosition(0, -display.height)
    self:addTopFairyChild(self._homeDrop)
end

function QUIPageMainMenu:viewDidAppear()
    QUIPageMainMenu.super.viewDidAppear(self)

    self._gComponent:addEventListener(fairygui.UIEventType.TouchBegin, handler(self, self._onTouchEvent))
    self._gComponent:addEventListener(fairygui.UIEventType.TouchMove, handler(self, self._onTouchEvent))
    self._gComponent:addEventListener(fairygui.UIEventType.TouchEnd, handler(self, self._onTouchEvent))

    self:setBackBtnVisible(false)
    self:setHomeBtnVisible(false)
    self:setHomeDropVisible(false)
end

function QUIPageMainMenu:viewWillDisappear()
    QUIPageMainMenu.super.viewWillDisappear(self)
end

function QUIPageMainMenu:_onTouchEvent(event)
    local eventType = event:getType()
    local input = event:getInput()
    if not input then
        return
    end
    local posX = input:getX()
    local posY = input:getY()
    if eventType == fairygui.UIEventType.TouchBegin then
        event:captureTouch()
        self._lastPositionX = posX
        self._skyPositionX = self._fguiOwner.node_sky:getX()
        self._farPositionX = self._fguiOwner.node_far:getX()
        self._midPositionX = self._fguiOwner.node_mid:getX()
        self._nearPositionX = self._fguiOwner.node_near:getX()
        self:_removeAction()
        self._isTouchBegin = true
    elseif eventType == fairygui.UIEventType.TouchMove then
        self:screenMove(posX - self._lastPositionX, false)
        if not self._isMoveing and math.abs(posX - self._lastPositionX) > 10 then
            self._isMoveing = true
        end
    elseif self._isTouchBegin and eventType == fairygui.UIEventType.TouchEnd then
        event:uncaptureTouch()
        self._isTouchBegin = false
        self:screenMove(posX - self._lastPositionX, false)
        self:getRoot():performWithDelay(function ()
            self._isMoveing = false
        end, 0)
    end
end

--滑动距离，是否有惯性
function QUIPageMainMenu:screenMove(distance, isSlider)
    if (self._nearPositionX + distance) > 0 then
        return
    end
    if (self._nearPositionX + distance) < ( CONFIG_SCREEN_WIDTH - self._totalWidth) then
        return
    end

    --远景移动
    local skyDistance = distance*0.5
    local farDistance = distance*0.7
    local midDistance = distance*0.9
    local nearDistance = distance
    if isSlider == false then
        self._fguiOwner.node_sky:setPosition(self._skyPositionX + skyDistance, self._fguiOwner.node_sky:getY())
        self._fguiOwner.node_far:setPosition(self._farPositionX + farDistance, self._fguiOwner.node_far:getY())
        self._fguiOwner.node_mid:setPosition(self._midPositionX + midDistance, self._fguiOwner.node_mid:getY())
        self._fguiOwner.node_near:setPosition(self._nearPositionX + nearDistance, self._fguiOwner.node_near:getY())
    else
        self._actionHandler1 = self:_contentRunAction(self._fguiOwner.node_sky, self._skyPositionX + skyDistance, self._fguiOwner.node_sky:getY())
        self._actionHandler2 = self:_contentRunAction(self._fguiOwner.node_far, self._farPositionX + farDistance, self._fguiOwner.node_far:getY())
        self._actionHandler3 = self:_contentRunAction(self._fguiOwner.node_mid, self._midPositionX + midDistance, self._fguiOwner.node_mid:getY())
        self._actionHandler4 = self:_contentRunAction(self._fguiOwner.node_near, self._nearPositionX + nearDistance, self._fguiOwner.node_near:getY())
    end
end

function QUIPageMainMenu:_contentRunAction(node, posX, posY)
    local moveTo = cc.MoveTo:create(1.3, cc.p(posX, posY))
    local speed = cc.EaseExponentialOut:create(moveTo)
    local callback = cc.CallFunc:create(function ()
        self:_removeAction()
    end)
    local sequence = cc.Sequence:create(speed, callback)
    return node:displayObject():runAction(moveTo)
end

function QUIPageMainMenu:_removeAction()
    if self._actionHandler1 ~= nil then
        self._fguiOwner.node_sky:displayObject():stopAction(self._actionHandler1)
        self._actionHandler1 = nil
    end
    if self._actionHandler2 ~= nil then
        self._fguiOwner.node_far:displayObject():stopAction(self._actionHandler2)
        self._actionHandler2 = nil
    end
    if self._actionHandler3 ~= nil then
        self._fguiOwner.node_mid:displayObject():stopAction(self._actionHandler3)
        self._actionHandler3 = nil
    end
    if self._actionHandler4 ~= nil then
        self._fguiOwner.node_near:displayObject():stopAction(self._actionHandler4)
        self._actionHandler4 = nil
    end
end

function QUIPageMainMenu:setBackBtnVisible(b)
    self._homeBack:setBackBtnVisible(b)
end

function QUIPageMainMenu:setHomeBtnVisible(b)
    self._homeBack:setHomeBtnVisible(b)
end

function QUIPageMainMenu:setHomeDropVisible(b)
    self._homeDrop:getView():setVisible(b)
end

function QUIPageMainMenu:setAllUIVisible(b)
    if self._homeDrop ~= nil then
        self._homeDrop:setVisible(true)
    end
end

--回退到主界面
function QUIPageMainMenu:onBackPage()
    self:setAllUIVisible(true)
    self:setHomeDropVisible(false)
    self:setBackBtnVisible(false)
    self:setHomeBtnVisible(false)
end

function QUIPageMainMenu:_onTriggerInstance(context)
    app:getNavigationManager():pushViewController(app.mainUILayer, {uiType = QUIViewController.TYPE_DIALOG, uiClass = "QUIDialogInstance"})
end

function QUIPageMainMenu:_onTriggerSunwell(context)
    app:getNavigationManager():pushViewController(app.mainUILayer, {uiType = QUIViewController.TYPE_DIALOG, uiClass = "QUIDialogSunwell"})
end

return QUIPageMainMenu