--
-- Author: wkwang
-- Date: 2014-05-05 14:22:52
--
local QUIDialog = import(".QUIDialog")
local QUIDialogSunwell = class("QUIDialogSunwell", QUIDialog)

function QUIDialogSunwell:ctor(options)
    local fguiFile = "dialog_middle"
	local resName = "main"
    local callbacks = {
        {childName = "btn_close", callback = handler(self, self._onTriggerClose)},
    }
    QUIDialogSunwell.super.ctor(self, fguiFile, resName, callbacks, options)

end

function QUIDialogSunwell:_onTriggerClose(context)
	self:playEffectOut()
end

function QUIDialogSunwell:_backClickHandler()
	self:playEffectOut()
end

return QUIDialogSunwell