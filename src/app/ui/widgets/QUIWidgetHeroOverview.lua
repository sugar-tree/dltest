local QUIWidget = import(".QUIWidget")
local QUIWidgetHeroOverview = class("QUIWidgetHeroOverview", QUIWidget)

local QNotificationCenter = import("...controllers.QNotificationCenter")

function QUIWidgetHeroOverview:ctor(options)
    local fguiFile = "page_main"
    local resName = "home"
    local callbacks = {
        {childName = "btn_home", callback = handler(self, self._onTriggerHome)},
        {childName = "btn_back", callback = handler(self, self._onTriggerBack)},
        {childName = "btn_drop", callback = handler(self, self._onTriggerDrop)},
    }
    QUIWidgetHeroOverview.super.ctor(self, fguiFile, resName, callbacks, options)

    self:extendEvent()
end

return QUIWidgetHeroOverview