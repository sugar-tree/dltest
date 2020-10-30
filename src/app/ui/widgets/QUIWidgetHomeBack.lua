local QUIWidget = import(".QUIWidget")
local QUIWidgetHomeBack = class("QUIWidgetHomeBack", QUIWidget)

function QUIWidgetHomeBack:ctor(options)
    local fguiFile = "page_main"
    local resName = "home"
    local callbacks = {
        {childName = "btn_home", callback = handler(self, self._onTriggerHome)},
        {childName = "btn_back", callback = handler(self, self._onTriggerBack)},
        {childName = "btn_drop", callback = handler(self, self._onTriggerDrop)},
    }
    QUIWidgetHomeBack.super.ctor(self, fguiFile, resName, callbacks, options)

    cc.GameObject.extend(self)
    self:addComponent("framework.components.EventProtocol"):exportMethods()

end

function QUIWidgetHomeBack:_onTriggerHome(context)
	print("--_onTriggerHome---")
end

function QUIWidgetHomeBack:_onTriggerBack(context)
	print("--_onTriggerBack---")
end

function QUIWidgetHomeBack:_onTriggerDrop(context)
	print("--_onTriggerDrop---")
end

return QUIWidgetHomeBack