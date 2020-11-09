--
-- Author: zxs
-- Date: 2014-05-05 14:22:52
--
local QUIWindow = import(".QUIWindow")
local QUIWindowConfirm = class("QUIWindowConfirm", QUIWindow)

function QUIWindowConfirm:ctor(options)
    local fguiFile = "dialog_middle"
    local resName = "dialog_confirm"
    local callbacks = {
        {childName = "btn_close", callback = handler(self, self._onTriggerClose)},
        {childName = "btn_cancel", callback = handler(self, self._onTriggerCancel)},
        {childName = "btn_confirm", callback = handler(self, self._onTriggerConfirm)},
    }
    QUIWindowConfirm.super.ctor(self, fguiFile, resName, callbacks, options)
    self:setModal(true)
    self:show()

    if options.desc then
        self._fguiOwner.tf_desc:setText(options.desc)
    end
end

function QUIWindowConfirm:viewDidAppear()
    QUIWindowConfirm.super.viewDidAppear(self)
    self:addBackEvent(true)
end

function QUIWindowConfirm:viewWillDisappear()
    QUIWindowConfirm.super.viewWillDisappear(self)
end

function QUIWindowConfirm:_onTriggerConfirm(context)
    self:playEffectOut()
end

function QUIWindowConfirm:_onTriggerCancel(context)
    self:playEffectOut()
end

function QUIWindowConfirm:_onTriggerClose(context)
	self:playEffectOut()
end

function QUIWindowConfirm:_backClickHandler()
	self:playEffectOut()
end

return QUIWindowConfirm