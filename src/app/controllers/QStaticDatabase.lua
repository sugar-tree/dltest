local QStaticDatabase = class("QStaticDatabase")


local loadEndCallBack = nil
function QStaticDatabase.setLoadEndFunc( callBack ) 
    loadEndCallBack = callBack
end

function QStaticDatabase:getInstance()
	if app._database == nil then
        app._database = QStaticDatabase.new()
        _G["db"] = app._database
    end
    return app._database
end

function QStaticDatabase:ctor()
    self:reloadStaticDatabaseJson(function ( )
    -- self:reloadStaticDatabaseLua(function ( )
        if loadEndCallBack then
            loadEndCallBack()
        end
    end)
end

function QStaticDatabase:loadIndexFile()
    local index, timestamp = QStaticDatabase.loadIndex(CCFileUtils:sharedFileUtils():getFileData("static/index"))
    if timestamp then
        self._dic_version = string.sub(timestamp, 2)
    end
    return index
end

local function createChart(chartname)
    local fileUtil = CCFileUtils:sharedFileUtils()
    local zipName
    if IS_64_BIT_CPU == true then
        zipName = fileUtil:fullPathForFilename("static_lua/" .. chartname .. "_64.lua.zip")
    else
        zipName = fileUtil:fullPathForFilename("static_lua/" .. chartname .. ".lua.zip")
    end
    local t
    if fileUtil:isFileExist(zipName) == true then
        local content
        if IS_64_BIT_CPU == true then
            content = QUtility:decryptZipFile(zipName, chartname .. "_64.lua")
        else
            content = QUtility:decryptZipFile(zipName, chartname .. ".lua")
        end
        local f = loadstring(content)
        assert(f, function() return "local f = loadstring(content), f is nil, zipName is " ..  tostring(zipName) end)
        t = f()
        assert(t, function() return "t = f(), t is nil, zipName is " ..  tostring(zipName) .. ". f type is " .. type(f) .. ". count is " .. tostring(count) end)
    else
        t = import( "....res.static_lua." .. chartname)
    end
    local charttable, __colnames, __colindices, __enum2string, __string2enum, __patterns = t[1], t[2], t[3], t[4], t[5], t[6]
    local mt = q.getShrinkMetatable(__colindices, __colnames, __enum2string, __string2enum, __patterns, charttable)
    if next(charttable) then
        -- 因为已经shrink过，不能通过#obj>0判断是不是array，可以判断第一个元素是不是table类型来判断是不是array
        if type(charttable[next(charttable)][1]) == "table" then
            for _, obj in pairs(charttable) do
                for _, obj in ipairs(obj) do
                    setmetatable(obj, mt)
                end
            end
        else
            for _, obj in pairs(charttable) do
                setmetatable(obj, mt)
            end
        end
    end

    return charttable
end

local function createLazyInitializeObject(initFunc)
    local returnobj = {}
    local initialized = {}
    local __index = function(t, k)
        local value = initialized[k]
        if not value then
            value = initFunc(k)
            initialized[k] = value
        end
        return value
    end
    setmetatable(returnobj, {__index = __index})
    return returnobj
end

function QStaticDatabase:reloadStaticDatabaseLua(endCallback)
    self._initfuncs = {}
    self._inited = {}
    self._staticDatabase = createLazyInitializeObject(function(chartname)
        if self._inited[chartname] == nil then
            local func = self._initfuncs[chartname]
            self._initfuncs[chartname] = nil
            self._inited[chartname] = true
            local chart = func and func() or createChart(chartname)
            return chart
        else
            return nil
        end
    end)


    local fileUtil = CCFileUtils:sharedFileUtils()
    local count = 0
    local staticTable = self:loadIndexFile()
    local staticNames = {}
    for name,_ in pairs(staticTable) do
        count = count + 1
        table.insert( staticNames, name)
    end

    local totalCount = count > 0 and count or 99999
    self._totalCount = totalCount
    self._staticNames = staticNames
    self._curIndex = 0
    self._schedulerID = scheduler.scheduleUpdateGlobal(function ( )
        -- body
        if self._curIndex < self._totalCount then
            local max = self._curIndex + 10  > self._totalCount and self._totalCount or self._curIndex + 10
            for i=self._curIndex + 1, max do
                local name = self._staticNames[i]
                repeat
                    if not string.find(name, ".json") then
                        break
                    end

                    local str = string.sub(name, 1, string.find(name, ".json") - 1)
                    local chartname = string.sub(str, string.find(str, "/", -string.len(str)) + 1)
                    local zipName
                    if IS_64_BIT_CPU == true then
                        zipName = fileUtil:fullPathForFilename("static_lua/" .. chartname .. "_64.lua.zip")
                    else
                        zipName = fileUtil:fullPathForFilename("static_lua/" .. chartname .. ".lua.zip")
                    end
                    self._initfuncs[chartname] = function()
                        return createChart(chartname)
                    end
                until true
                if initProgressCallBack then
                    initProgressCallBack(i/self._totalCount)
                end
            end
            self._curIndex = self._curIndex + 10
        else
            self._staticNames = nil
            self._totalCount = nil
            self._curIndex = nil
            
            self._isArrayOfBuffData = true
            self._isArrayOfTrapData = false

            self._initfuncs["animation_time"] = function()
                local animation_time = {}
                local fileUtils = CCFileUtils:sharedFileUtils()
                local filepath = "res/actor/animation_time"
                if fileUtils:isFileExist(fileUtils:getWritablePath()..filepath) then
                    filepath = fileUtils:getWritablePath()..filepath
                end
                local content = fileUtils:getFileData(filepath)
                local lines = string.split(content, "\n")
                local animationFile = nil
                local index = nil
                local time = nil
                local bytes = nil
                for _, line in ipairs(lines) do
                    if line ~= "" then
                        if string.sub(line, 1, 1) ~= ' ' then
                            bytes = {string.byte(line, 1, -1)}
                            if bytes[#bytes] == 13 then
                                line = string.sub(line, 1, #bytes - 1)
                            end
                            animationFile = {}
                            animation_time[line] = animationFile
                        else
                            index = string.find(line, "\"", 3, true)
                            time = tonumber(string.sub(line, index + 2))
                            animationFile[string.sub(line, 3, index - 1)] = time
                        end
                    end
                end
                return animation_time
            end

            if endCallback then
                endCallback()
            end

            if self._schedulerID then
                scheduler.unscheduleGlobal(self._schedulerID)
                self._schedulerID = nil
            end
        end
    end)
end

function readJsonFile(filePath)
	local path = cc.FileUtils:getInstance():fullPathForFilename(filePath)
    local content = io.readfile(path)
    return json.decode(content)
end

function QStaticDatabase:reloadStaticDatabaseJson(endCallback)
	self._staticDatabase = {}
	local indexData = cc.FileUtils:getInstance():getDataFromFile("static/index")
	local indexFiles = string.split(indexData, "\n")
	for i, filePath in pairs(indexFiles) do
		local dirPos = string.find(filePath, "/")
		local pointPos = string.find(filePath, ".json")
		local fileName = string.sub(filePath, dirPos + 1, pointPos - 1)
		local jsonTbl = readJsonFile(filePath)
		for key, value in pairs(jsonTbl) do
			self._staticDatabase[key] = value
		end
	end
end

--根据量表名称获取量表对象
function QStaticDatabase:getStaticByName(staticName)
    return self._staticDatabase[staticName] or {}
end

return QStaticDatabase