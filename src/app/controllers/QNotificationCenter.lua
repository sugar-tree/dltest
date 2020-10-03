--[[
    Class name QNotificationCenter 
    Create by zxs 
    This class is a handle notification push stuff
--]]

local EventProtocol = require("framework.components.EventProtocol")
local QNotificationCenter = class("QNotificationCenter", EventProtocol)

QNotificationCenter.EVENT_BULLET_TIME_TURN_ON = "NOTIFICATION_EVENT_BULLET_TIME_TURN_ON"
QNotificationCenter.EVENT_BULLET_TIME_TURN_OFF = "NOTIFICATION_EVENT_BULLET_TIME_TURN_OFF"

QNotificationCenter.EVENT_BULLET_TIME_TURN_START = "NOTIFICATION_EVENT_BULLET_TIME_TURN_START"
QNotificationCenter.EVENT_BULLET_TIME_TURN_FINISH = "NOTIFICATION_EVENT_BULLET_TIME_TURN_FINISH"

QNotificationCenter.EVENT_TRIGGER_BACK = "NOTIFICATION_EVENT_TRIGGER_BACK"
QNotificationCenter.EVENT_TRIGGER_HOME = "NOTIFICATION_EVENT_TRIGGER_HOME"

QNotificationCenter.EVENT_DIALOG_DID_APPEAR = "EVENT_DIALOG_DID_APPEAR"
QNotificationCenter.EVENT_DIALOG_WILL_DISAPPEAR = "EVENT_DIALOG_WILL_DISAPPEAR"

QNotificationCenter.EVENT_ENTER_DUNGEON_LOADER = "EVENT_ENTER_DUNGEON_LOADER"
QNotificationCenter.EVENT_EXIT_FROM_BATTLE = "EVENT_EXIT_FROM_BATTLE"
QNotificationCenter.EVENT_EXIT_FROM_QUICKBATTLE = "EVENT_EXIT_FROM_QUICKBATTLE"

QNotificationCenter.EVENT_CLOSE_QUICK_WAY_DIALOG = "EVENT_CLOSE_QUICK_WAY_DIALOG"
QNotificationCenter.EVENT_CLOSE_EQUIPMENT_COMPOSE_DIALOG = "EVENT_CLOSE_EQUIPMENT_COMPOSE_DIALOG"
QNotificationCenter.EVENT_UI_VIEW_SIZE_CAHNGE = "EVENT_UI_VIEW_SIZE_CAHNGE"

QNotificationCenter.VIP_RECHARGED = "VIP_RECHARGED"
QNotificationCenter.VIP_LEVELUP = "VIP_LEVELUP"


function QNotificationCenter:ctor(options)
    QNotificationCenter.super.ctor(self)
    self._handlesInfo = {}
end

function QNotificationCenter:sharedNotificationCenter( )
    if app._notificationCenter == nil then
        app._notificationCenter = QNotificationCenter.new()
    end
    return app._notificationCenter
end

function QNotificationCenter:addEventListener(eventName, listener, tag)
	local key1 = listener
	local key2 = tag
	local ttag = type(tag)
    if ttag == "table" or ttag == "userdata" then
        key1 = handler(tag, listener)
        key2 = ""
    end
	local handle = QNotificationCenter.super.addEventListener(self, eventName, key1, key2)
	if listener ~= nil and tag ~= nil then
		table.insert(self._handlesInfo, {handle = handle, listener = listener, tag = tag, eventName = eventName})
	end
end

-- key1 is listener and key2 is tag
function QNotificationCenter:removeEventListener(eventNameOrHandle, key1, key2)
	if key1 ~= nil or key2 ~= nil then
		local handle = nil
		for i, handlerInfo in ipairs(self._handlesInfo) do
			if eventNameOrHandle == handlerInfo.eventName and handlerInfo.listener == key1 and handlerInfo.tag == key2 then
				handle = handlerInfo.handle
				table.remove(self._handlesInfo, i)
				break
			end
		end
		if handle ~= nil then
			return QNotificationCenter.super.removeEventListener(self, handle)
		else
			printInfo("WARN: cannot find event handle for event name " .. eventNameOrHandle)
		end
	else
		return QNotificationCenter.super.removeEventListener(self, eventNameOrHandle, key1, key2)
	end
end

function QNotificationCenter:triggerMainPageEvent(eventName)
	if self._mainPageList == nil then return end
	local lastTarget = self._mainPageList[#self._mainPageList]
	if eventName == QNotificationCenter.EVENT_TRIGGER_BACK then
		if lastTarget ~= nil and lastTarget.onTriggerBackHandler ~= nil and (lastTarget.getEnable == nil or lastTarget:getEnable() == true) then
			lastTarget:onTriggerBackHandler()
		end
	elseif eventName == QNotificationCenter.EVENT_TRIGGER_HOME then
		if lastTarget ~= nil and lastTarget.onTriggerHomeHandler ~= nil and (lastTarget.getEnable == nil or lastTarget:getEnable() == true) then
			lastTarget:onTriggerHomeHandler()
		end
	end
end

function QNotificationCenter:addMainPageEvent(target)
	if self._mainPageList == nil then
		self._mainPageList = {}
	end

    local isExist = false
    for index, value in pairs(self._mainPageList) do
        if value == target then
            isExist = true
            break
        end
    end

    if isExist == false then
	   table.insert(self._mainPageList, target)
    end
end

function QNotificationCenter:removeMainPageEvent(target)
	if self._mainPageList == nil then return end

	for index, value in pairs(self._mainPageList) do
		if value == target then
			table.remove(self._mainPageList, index)
            break
		end
	end
end

return QNotificationCenter