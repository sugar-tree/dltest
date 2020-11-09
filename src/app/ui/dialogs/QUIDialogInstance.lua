--
-- Author: zxs
-- Date: 2020-11-05 14:22:52
--
local QUIDialog = import(".QUIDialog")
local QUIDialogInstance = class("QUIDialogInstance", QUIDialog)

function QUIDialogInstance:ctor(options)
    local fguiFile = "dialog_main"
	local resName = "main"
    local callbacks = {
    }
    QUIDialogInstance.super.ctor(self, fguiFile, resName, callbacks, options)
end

function QUIDialogInstance:viewDidAppear()
    QUIDialogInstance.super.viewDidAppear(self)
    self:addBackEvent(true)
end

return QUIDialogInstance