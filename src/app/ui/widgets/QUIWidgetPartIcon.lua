local QUIWidget = import(".QUIWidget")
local QUIWidgetPartIcon = class("QUIWidgetPartIcon", QUIWidget)

function QUIWidgetPartIcon:ctor(options)
    local fguiFile = "basics"
    local resName = "part_icon"
    local callbacks = {
    }
    QUIWidgetPartIcon.super.ctor(self, fguiFile, resName, callbacks, options)
end

function QUIWidgetPartIcon:setInfo(info)
    self._fguiOwner["sp_part_icon"]:setVisible(false)
    self._fguiOwner["sp_plus"]:setVisible(false)
    self._fguiOwner["sp_lock"]:setVisible(false)
    
    if info.lock then
        self._fguiOwner["sp_lock"]:setVisible(true)
    elseif info.icon then
        self._fguiOwner["sp_part_icon"]:setVisible(true)
        self._fguiOwner["sp_part_icon"]:setURL(info.icon)
    else
        self._fguiOwner["sp_lock"]:setVisible(true)
    end
end

return QUIWidgetPartIcon