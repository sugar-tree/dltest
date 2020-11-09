--
-- Author: zxs
-- Date: 2014-05-05 14:22:52
--
local QUIWindow = import(".QUIWindow")
local QUIWindowTips = class("QUIWindowTips", QUIWindow)

function QUIWindowTips:ctor(options)
    local fguiFile = "dialog_middle"
    local resName = "dialog_confirm"
    local callbacks = {
        {childName = "btn_close", callback = handler(self, self._onTriggerClose)},
        {childName = "btn_cancel", callback = handler(self, self._onTriggerCancel)},
        {childName = "btn_confirm", callback = handler(self, self._onTriggerConfirm)},
    }
    QUIWindowTips.super.ctor(self, fguiFile, resName, callbacks, options)

    app:getRairyRoot():showPopup(self)

    if options.desc then
        self._fguiOwner.tf_desc:setText(options.desc)
    end
end

function QUIWindowTips:viewDidAppear()
    QUIWindowTips.super.viewDidAppear(self)
    self:addBackEvent(true)
end

function QUIWindowTips:viewWillDisappear()
    QUIWindowTips.super.viewWillDisappear(self)
end

function QUIWindowTips:_onTriggerConfirm(context)
    self:playEffectOut()
end

function QUIWindowTips:_onTriggerCancel(context)
    self:playEffectOut()
end

function QUIWindowTips:_onTriggerClose(context)
	self:playEffectOut()
end

function QUIWindowTips:_backClickHandler()
	self:playEffectOut()
end

return QUIWindowTips