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

    self._heroItems = {}
end

function QUIDialogHeroOverview:viewDidAppear()
    QUIDialogHeroOverview.super.viewDidAppear(self)
    self:addBackEvent(true)

    self:initInfo()
end

function QUIDialogHeroOverview:viewWillDisappear()
    QUIDialogHeroOverview.super.viewWillDisappear(self)
end

function QUIDialogHeroOverview:initInfo()
    local data = {}
    local character = db:getStaticByName("character")
    local num = 1
    for i, v in pairs(character) do
        local info = v
        info.force = num*1000
        info.level = num*10
        info.grade = math.random(1, 15)
        table.insert(data, info)
        num = num + 1
    end
    table.sort( data, function(a, b)
        return a.force > b.force
    end )

    for i = 1, #data do
        local item = QUIWidgetHeroOverview.new()
        item:setInfo(data[i])
        self._fguiOwner.list_view:addChild(item:getView())
        self._heroItems[i] = item
    end
end

function QUIDialogHeroOverview:_onTriggerHandbook()
    QUIWindowTips.new({desc = "敬请期待"})
end


return QUIDialogHeroOverview