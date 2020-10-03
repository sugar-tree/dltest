--
-- Author: wkwang
-- Date: 2014-05-05 14:22:52
--
local QUIDialog = import(".QUIDialog")
local QUIDialogInstance = class("QUIDialogInstance", QUIDialog)

function QUIDialogInstance:ctor(options)
    local fguiFile = "test"
	local resName = "main"
    local callbacks = {
    }
    QUIDialogInstance.super.ctor(self, fguiFile, resName, callbacks, options)
end

return QUIDialogInstance