--
-- Author: Your Name
-- Date: 2015-07-13 14:59:16
--
local QBaseModel = class("QBaseModel")

function QBaseModel:ctor(options)
	cc.GameObject.extend(self)
    self:addComponent("framework.components.EventProtocol"):exportMethods()
end

function QBaseModel:didappear()
	-- body
end

function QBaseModel:disappear()
	-- body
end

function QBaseModel:loginEnd()
	-- body
end

function QBaseModel:checkRedTips()
	return false
end

function QBaseModel:checkIsOpen()
	return true
end

function QBaseModel:responseHandler(data, success, fail, succeeded)
    if succeeded == true then
        if success ~= nil then
            success(data)
        end
    else
        if fail ~= nil then
            fail(data)
        end
    end
end

return QBaseModel