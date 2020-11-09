local QUIWidget = import(".QUIWidget")
local QUIWidgetHomeDrop = class("QUIWidgetHomeDrop", QUIWidget)

local QUIViewController = import("..QUIViewController")
local QUIWindowConfirm = import("..windows.QUIWindowConfirm")
local QUIWindowHelp = import("..windows.QUIWindowHelp")
local QUIWindowTips = import("..windows.QUIWindowTips")

function QUIWidgetHomeDrop:ctor(options)
    local fguiFile = "page_main"
    local resName = "drop"
    local callbacks = {
        {childName = "btn_drop_up", callback = handler(self, self._onTriggerDropUp)},
        {childName = "btn_drop_hero", callback = handler(self, self._onTriggerDropHero)},
        {childName = "btn_drop_mount", callback = handler(self, self._onTriggerDropMount)},
        {childName = "btn_drop_task", callback = handler(self, self._onTriggerDropTask)},
        {childName = "btn_drop_bag", callback = handler(self, self._onTriggerDropBag)},
    }
    QUIWidgetHomeDrop.super.ctor(self, fguiFile, resName, callbacks, options)

    self:extendEvent()
end

function QUIWidgetHomeDrop:setBackBtnVisible(b)
    self._fguiOwner.btn_back:displayObject():setVisible(b)
end

function QUIWidgetHomeDrop:setHomeBtnVisible(b)
    self._fguiOwner.btn_home:displayObject():setVisible(b)
end

function QUIWidgetHomeDrop:_onTriggerDropUp(context)
    local page = app:getNavigationManager():getController(app.mainUILayer):getTopPage()
    page:setHomeDropVisible(false)
end

function QUIWidgetHomeDrop:_onTriggerDropHero(context)
    app:getNavigationManager():pushViewController(app.mainUILayer, {uiType = QUIViewController.TYPE_DIALOG, uiClass = "QUIDialogHeroOverview"})
end

function QUIWidgetHomeDrop:_onTriggerDropMount(context)
    local win = QUIWindowConfirm.new({desc = "暗器敬请期待"})
end

function QUIWidgetHomeDrop:_onTriggerDropTask(context)
    local win = QUIWindowHelp.new({desc = "任务敬请期待"})
end

function QUIWidgetHomeDrop:_onTriggerDropBag(context)
    local win = QUIWindowTips.new({desc = "背包敬请期待"})
end

return QUIWidgetHomeDrop