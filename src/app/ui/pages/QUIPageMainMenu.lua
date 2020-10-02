local QUIPage = import(".QUIPage")
local QUIPageMainMenu = class("QUIPageMainMenu", QUIPage)

local QUIGestureRecognizer = import("..QUIGestureRecognizer")

function QUIPageMainMenu:ctor(options)
    local fguiFile = "page_main"
	local resName = "main"
    local callbacks = {
        {childName = "btn_rank", callback = handler(self, self._onTriggerRank)},
    }
    QUIPageMainMenu.super.ctor(self, fguiFile, resName, callbacks, options)

    self._touchLayer = QUIGestureRecognizer.new()
    self._touchLayer.parentName = "QUIPageMainMenu"
    self._touchLayer:setSlideRate(0.3)
    self._touchLayer:setAttachSlide(true)
    self._touchLayer:attachToNode(self:getView(), display.width, display.height, 0, 0, handler(self, self._onTouch))
end

function QUIPageMainMenu:viewDidAppear()
    QUIPageMainMenu.super.viewDidAppear(self)

    self._touchLayer:enable()
    self._touchLayer:addEventListener(QUIGestureRecognizer.EVENT_SLIDE_GESTURE, handler(self, self._onTouch))
end

function QUIPageMainMenu:viewWillDisappear()
    QUIPageMainMenu.super.viewWillDisappear(self)

    self._touchLayer:removeAllEventListeners()
    self._touchLayer:disable()
    self._touchLayer:detach()
end

function QUIPageMainMenu:_onTouch(event)
    print(event)
    -- if event.name == "began" then
    --     self._sliderTemp = 0
    --     self._lastSlidePositionX = event.x
    --     self._farPositionX = self._ccbOwner.node_far:getPositionX()
    --     self._farPosition2X = self._ccbOwner.node_far2:getPositionX()
    --     self._farPosition3X = self._ccbOwner.node_far3:getPositionX()
    --     self._midPositionX = self._ccbOwner.node_mid:getPositionX()
    --     self._topPositionX = self._ccbOwner.node_top:getPositionX()
    --     self._farNearPositionX = self._ccbOwner.node_far_near:getPositionX()
    --     self:_removeAction()
    --     return true
    -- elseif event.name == "moved" then
    --     self:screenMove(event.x - self._lastSlidePositionX, false)
    --     if self._isMoveing ~= true and math.abs(event.x - self._lastSlidePositionX) > 10 then
    --         self._isMoveing = true
    --     end
    -- elseif event.name == "ended" or event.name == "cancelled" then
    --     scheduler.performWithDelayGlobal(function ()
    --         self._isMoveing = false
    --     end, 0)
    -- elseif event.name == QUIGestureRecognizer.EVENT_SLIDE_GESTURE then
    --     self._farPositionX = self._ccbOwner.node_far:getPositionX()
    --     self._farPosition2X = self._ccbOwner.node_far2:getPositionX()
    --     self._farPosition3X = self._ccbOwner.node_far3:getPositionX()
    --     self._midPositionX = self._ccbOwner.node_mid:getPositionX()
    --     self._topPositionX = self._ccbOwner.node_top:getPositionX()
    --     self._farNearPositionX = self._ccbOwner.node_far_near:getPositionX()
    --     self:screenMove(event.distance.x, true)
    -- end
end

function QUIPageMainMenu:_onTriggerRank(context)
    print("-----context--",context)
end

return QUIPageMainMenu