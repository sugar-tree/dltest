--
-- Author: zxs
-- Date: 2020-11-05 14:22:52
--
local QUIDialog = import(".QUIDialog")
local QUIDialogHeroOverview = class("QUIDialogHeroOverview", QUIDialog)

local QUIWidgetHeroOverview = import("..widgets.QUIWidgetHeroOverview")
local QUIWindowTips = import("..windows.QUIWindowTips")

function QUIDialogHeroOverview:ctor(options)
    local fguiFile = "dialog_main"
    local resName = "dialog_hero_overview"
    local callbacks = {
        {childName = "btn_handbook", callback = handler(self, self._onTriggerHandbook)},
    }
    QUIDialogHeroOverview.super.ctor(self, fguiFile, resName, callbacks, options)
end

function QUIDialogHeroOverview:viewDidAppear()
    QUIDialogHeroOverview.super.viewDidAppear(self)
    self:addBackEvent(true)
end

function QUIDialogHeroOverview:viewWillDisappear()
    QUIDialogHeroOverview.super.viewWillDisappear(self)
end

function QUIDialogHeroOverview:initInfo()

end

function QUIDialogHeroOverview:_onTriggerHandbook()
    QUIWindowTips.new({desc = "敬请期待"})
end


return QUIDialogHeroOverview