
local QUITransition = class("QUITransition")

QUITransition.EVENT_TRANSITION_START = "EVENT_TRANSITION_START"
QUITransition.EVENT_TRANSITION_FINISHED = "EVENT_TRANSITION_FINISHED"

function QUITransition:ctor(newController, oldController, controller, options)
    cc.GameObject.extend(self)
    self:addComponent("framework.components.EventProtocol"):exportMethods()

    self.controller = controller
    self._newController = newController
    self._oldController = oldController
    self._popOldDialog = true
end

function QUITransition:getNewController()
    return self._newController
end

function QUITransition:getOldController()
    return self._oldController
end

function QUITransition:setPopOldDialog(isPopOldDialog)
    if isPopOldDialog ~= nil then
        self._popOldDialog = isPopOldDialog
    end
end

function QUITransition:isPopOldDialog()
    return self._popOldDialog
end

function QUITransition:_doTransition()
	-- body
end

function QUITransition:start()
    self:_doTransition()

    self:dispatchEvent({name = QUITransition.EVENT_TRANSITION_START, transition = self, controller = self.controller})

    self:performWithDelay(function()
       self:finished()
   	end, 0)
    
end

function QUITransition:finished()
    self:dispatchEvent({name = QUITransition.EVENT_TRANSITION_FINISHED, transition = self, controller = self.controller})
end

return QUITransition