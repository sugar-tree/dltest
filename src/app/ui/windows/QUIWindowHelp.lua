--
-- Author: zxs
-- Date: 2014-05-05 14:22:52
--
local QUIWindow = import(".QUIWindow")
local QUIWindowHelp = class("QUIWindowHelp", QUIWindow)

local QUIWindowTips = import("..windows.QUIWindowTips")

function QUIWindowHelp:ctor(options)
    local fguiFile = "dialog_middle"
    local resName = "dialog_help"
    local callbacks = {
        {childName = "btn_tip", callback = handler(self, self._onTriggerTip)},
    }
    QUIWindowHelp.super.ctor(self, fguiFile, resName, callbacks, options)
    self:setModal(true)
    self:show()

    if options.desc then
        self._fguiOwner.tf_desc:setText(options.desc)
    end
end

function QUIWindowHelp:_onTriggerTip(context)
    local options = {
        isPopTop = false,
        desc = "背包敬请期待",
    }
    local win = QUIWindowTips.new(options)
end

return QUIWindowHelp