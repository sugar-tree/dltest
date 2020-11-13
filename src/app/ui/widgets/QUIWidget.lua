
local QUIWidget = class("QUIWidget", function()
    return display.newNode()
end)

local QFairyGUILoad = import("...utils.QFairyGUILoad")

function QUIWidget:ctor(fguiFile, resName, callbacks, options)
    self._fguiOwner = {}
    self._options = options

    self._view = QFairyGUILoad.loadLua(fguiFile, resName, self._fguiOwner, callbacks)
    
    self:setNodeEventEnabled(true)
end

function QUIWidget:extendEvent()
    cc.GameObject.extend(self)
    self:addComponent("framework.components.EventProtocol"):exportMethods()
end

function QUIWidget:getView()
    return self._view
end

function QUIWidget:onEnter()

end

function QUIWidget:onExit()

end

function QUIWidget:getOptions()
    return self._options
end

function QUIWidget:setOptions(options)
    self._options = options or {}
end

return QUIWidget