--
-- Author: zxs
-- Date: 2020-10-03 16:39:45
-- This class is to output game information to log file
-- API:
-- debug: output verbose debug infomation, can be used to trace trivial log. Debug level will not be applied in production.
-- info: non-trivial information which helps to know the game process flow. Not be applied in production
-- error: log down critical information. Will be applied in production.
-- Note: if input string is concatenated by ..., it is recommended to use QLogFile:debug(function () return "abc" .. "def" end)

local QLogFile = class("QLogFile")

local logDir = "logs"

function QLogFile:ctor()
    -- if QUtility.luaErrorDelegate then
    --     QUtility:luaErrorDelegate(function (content)
    --         self:error(content)
    --         if app:getClient() then 
    --             app:getClient():crashReport("LUA ERROR", content)
    --         end
    --     end)
    -- end
end

function QLogFile:logName(logNamePrefix)
	local currentDate = q.date("%Y-%m-%d")
    if type(logNamePrefix) ~= "string" then
        return string.format("/%s/%s-%s-wowlog.log", logDir, GAME_VERSION, currentDate)
    else
        return string.format("/%s/%s-%s-%s-wowlog.log", logDir, logNamePrefix, GAME_VERSION, currentDate)
    end
end

function QLogFile:uploadLogApplicable()
    if device.platform == "ios" or device.platform == "android" then
        if CCNetwork:isLocalWiFiAvailable() == true then
            return true
        end
    end

    return false
end

-- Compress previous log files
function QLogFile:compressOlderLogs()
    if device.platform ~= "ios" and device.platform ~= "android" then return end

	local currentDate = q.date("%Y-%m-%d")

    local logStr = listFolderWithFilter(logDir, ".log", currentDate)
    self:debug(string.format("Found log files %s", logStr))
    local logList = string.split(logStr, ";")
    for k, v in ipairs(logList) do
        if v ~= "" and not string.find(v, ".gz") then
            self:debug(string.format("Start zipping %s", v))
            if zipFile(logDir, v, true) then
                local newZipName = tostring(remote.user.userId) .. "-" .. v .. ".gz"
                rename(logDir, v..".gz", newZipName)
                self:debug(function ( ... )
                    return "Compress " .. v .. " successfully"
                end)
            else
                self:error(function ( ... )
                    return "Compress " .. v .. " failed"
                end)
            end
        end
    end 

    self:debug(function () return "Compress older logs complete!" end)
end

-- Only upload in WIFI environment for mobile phone
function QLogFile:uploadLogs(url, env)
    if self:uploadLogApplicable() and QUploader.createWithFilter then
        local fileUtil = CCFileUtils:sharedFileUtils()
        local localPath = fileUtil:getWritablePath() .. logDir
        local uploader = QUploader:createWithFilter(localPath, url, env, ".gz")
        if uploader:canStart() then
            uploader:start()
        end

        self:debug(function () return "Upload logs complete to " .. url .. env end)
    end
end

function QLogFile:outputLog(input, level, logNamePrefix)
    if directoryExists(logDir) or createSubDirectory(logDir) then
        local mem = QUtility.getAppUsedMemory and QUtility:getAppUsedMemory() or 0
        local vm = collectgarbage("count")/1024
        local content = input
        if type(content) == "function" then
            content = input()
        elseif type(content) == "table" then
             content = self:outputTable(content)
        end
        appendToFile(QLogFile:logName(logNamePrefix), string.format("%s(%s %d %d) - %s\n", os.date("%Y-%m-%d %H:%M:%S"), level, mem, vm, content))
        print(content)
    else
    	print("Failed to create log directory " .. logDir)
    end
end

function QLogFile:outputTable(t, prefix)
    if prefix == nil then
        prefix = ""
    end

    local tableLog = ""
    tableLog = tableLog .. "\n" .. prefix .. "{\n"
    local newPrefix = prefix .. "    "
    for k, v in pairs(t) do
        if type(v) == "table" then
            tableLog = tableLog .. newPrefix .. tostring(k) .. ": "
            tableLog = tableLog .. self:outputTable(v, newPrefix)
        else
            tableLog = tableLog .. newPrefix .. tostring(k) .. ": " .. tostring(v) .. "\n"
        end
    end
    tableLog = tableLog .. prefix .. "}\n"
    return tableLog
end

function QLogFile:debug(content, logNamePrefix)
	if LOG_LEVEL < 3 then return end

	self:outputLog(content, "DEBUG", logNamePrefix)
end

function QLogFile:info(content, logNamePrefix)
	if LOG_LEVEL < 2 then return end
	
	self:outputLog(content, "INFO", logNamePrefix)
end

function QLogFile:error(content, logNamePrefix)
	if LOG_LEVEL < 1 then return end
	
	self:outputLog(content, "ERROR", logNamePrefix)
end

return QLogFile