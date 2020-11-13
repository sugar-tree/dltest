
require "lfs"
local socket = require "socket"
-- local emoji = import(".QEmoji")

local _assert = assert
function assert(cond, eval)
    if not cond then
        if type(eval) == "function" then
            return _assert(cond, eval())
        else
            return _assert(cond, eval)
        end
    else
        return cond, eval
    end
end

-- find the item with maximium value in specified field
function table.max(list, field)
    local max = 0
    local r = nil
    for i, item in pairs(list) do
        if item[field] > max then
            r = item
            max = item[field]
        end
    end

    return r
end

-- find the item with maximium value in specified field
function table.max_fun(list, fun)
    local max = 0
    local r = nil
    for i, item in pairs(list) do
        if fun(item) > max then
            r = item
            max = fun(item)
        end
    end

    return r
end

-- find is value in specified field
function table.find(list, value)
    if list ~= nil and value ~= nil then
        for _, item in pairs(list) do
            if item == value then
                return true
            end
        end
    end
    return false
end

--通过index查找item值
function table.itemOfIndex(t, index)
    local i = 1
    for k, v in pairs(t) do
        if i == index then
            return v
        end
        i = i + 1
    end
    return nil
end

--[[--

合并表格中的值，此处当作数组处理

~~~ lua

local dest = {1,2}
local src  = {3,4}
table.mergeForArray(dest, src)
-- dest = {1,2,3,4}

~~~

@param table dest 目标表格
@param table src 来源表格

]]
function table.mergeForArray(dest, src, filter_func, get_func)
    if not filter_func then
        local dest_len = #dest
        local src_len = #src
        if not get_func then
            for i = 1, src_len do
                dest[dest_len + i] = src[i]
            end
        else
            for i = 1, src_len do
                dest[dest_len + i] = get_func(src[i])
            end
        end
    else
        local dest_len = #dest
        local src_len = #src
        local v = nil
        if not get_func then
            for i = 1, src_len do
                v = src[i]
                if filter_func(v) then
                    dest_len = dest_len + 1
                    dest[dest_len] = v
                end
            end
        else
            for i = 1, src_len do
                v = src[i]
                if filter_func(v) then
                    dest_len = dest_len + 1
                    dest[dest_len] = get_func(v)
                end
            end
        end
    end
end

--table转字符串
function table.join(t,sep)
    local str = ""
    local index = 0
    for k, v in pairs(t) do
        if type(v) == "number" or type(v) == "string" then
            if index > 0 then
                str = str..sep
            end
            str = str..v
            index = index + 1
        end
    end
    return str
end

--将table转换为sep1连接key和value，sep2连接数组格式的string
function table.formatString(t, sep1, sep2)
    local value = nil
    for k, v in pairs(t) do
      if value == nil then
        value = k..sep1..v 
      else
        value = value..sep2..k..sep1..v
      end
    end
    return value
end

-- Deprecated - Please use json.encode/decode ! -----------------------------------------------------------------------
--将table从内存转换成string型lua代码，用于序列化
-- str = table.tostring(t1)
-- local f = loadstring("return " .. str)
-- t2 = f()
-- assert(t1 == t2)
function table.tostring(t)
    local tableLog = ""
    tableLog = tableLog .. "{" 
    for k, v in pairs(t) do
        if type(v) == "table" then
            if type(k) == "string" then k = "\"" .. k .. "\"" end
            tableLog = tableLog .. "[" .. tostring(k) .. "]="
            tableLog = tableLog .. table.tostring(v) .. ","
        else
            if type(k) == "string" then k = "\"" .. k .. "\"" end
            if type(v) == "string" then v = "\"" .. v .. "\"" end
            v = string.gsub(tostring(v), "\n", "\\\\n")
            tableLog = tableLog .."["..tostring(k).."]".. "=" .. tostring(v) .. ","
        end
    end
    tableLog = tableLog .. "}"
    
    return tableLog
end

function table.toJsonString(t)
    local tableLog = ""
    tableLog = tableLog .. "{" 
    for k, v in pairs(t) do
        if type(v) == "table" then
            if type(k) == "string" then k = "\"" .. k .. "\"" end
            tableLog = tableLog .. tostring(k) .. ":"
            tableLog = tableLog .. table.toJsonString(v) .. ","
        else
            if type(k) == "string" then k = "\"" .. k .. "\"" end
            if type(v) == "string" then v = "\"" .. v .. "\"" end
            v = string.gsub(tostring(v), "\n", "\\\\n")
            tableLog = tableLog ..tostring(k).. ":" .. tostring(v) .. ","
        end
    end
    tableLog = string.sub(tableLog, 1, #tableLog - 1)
    tableLog = tableLog .. "}"
    
    return tableLog
end

function table.extend( old, new ,isRecursive)
    -- body
    if type(old) ~= "table" or type(new) ~= "table" then
        return 
    end
    for k, v in pairs(new) do
        if isRecursive and type(v) == "table" and type(old[k]) == "table" then
            table.extend( old[k], v )
        else
            old[k] = v
        end
    end
    return old
end

--打印table
function print_lua_table (lua_table, indent)
    indent = indent or 0
    local formatting
    for k, v in pairs(lua_table) do
        if type(k) == "string" then
            k = string.format("%q", k)
        end
        local szSuffix = ""
        if type(v) == "table" then
            szSuffix = "{"
        end
        local szPrefix = string.rep("    ", indent)
        formatting = szPrefix.."["..k.."]".." = "..szSuffix
        if type(v) == "table" then
            print(formatting)
            print_lua_table(v, indent + 1)
            print(szPrefix.."},")
        else
            local szValue = ""
            if type(v) == "string" then
                szValue = string.format("%q", v)
            else
                szValue = tostring(v)
            end
            print(formatting..szValue..",")
        end
    end
end

local _pesudo_id = 0
-- temporary uuid solution for demo
function uuid()
    _pesudo_id = _pesudo_id + 1
    return _pesudo_id
end

-- 获取当前的uuid
function get_pseudo_id()
    return _pesudo_id
end

-- os.time返回只能精确到秒，不符合要求，os.clock返回CPU消耗的时间，不符合要求。
function q.time()
    return socket.gettime() -- 以秒为单位，精确到毫秒
end

-- 未通信时记录本地time，通信时小于500ms误差的以服务器时间为准
function q.serverTime()
    if remote == nil or remote.serverTime == nil or remote.serverResTime == nil then
        return q.time()
    end
    local time = QUtility:getTime()
    -- printInfo("QUtility:getTime() " .. time)
    return remote.serverTime + time - remote.serverResTime
end

--转化时区后的os.date
function q.date(format, time)
    if time == nil then
        time = os.time()
    end
    time = time + UTC * HOUR
    if format ~= nil then
        if string.sub(format,1,1) ~= "!" then
            format = "!"..format
        end
    else
        format = "!%c"
    end
    return os.date(format, time)
end

--转化时区的time 取代os.time()
local _UTC_TIME
function q.OSTime(date)
    if _UTC_TIME == nil then
        local time = os.time()
        local date1 = os.date("*t", time)
        local date2 = os.date("!*t", time)
        _UTC_TIME = os.time(date2) - os.time(date1)
    end
    --最大整数表示时间即2147483647，转换成时间是Tue Jan 19 03:14:07 2038 所以超出2038年改称2037年比较安全
    if date and tonumber(date.year) >= 2038 then
        date.year = "2037"
    end
    return os.time(date) -(_UTC_TIME + UTC * HOUR)
end

function q.consumeTime(consumeTime)
    if consumeTime > 0 then
        local startTime = QUtility:getTime()
        while QUtility:getTime() - startTime < consumeTime do
        end
    end
end

function q.getDateTimeByStandStr(str)
    if not str then 
        return q.serverTime()
    end
    local tbl = {}
    for k,v in string.gmatch(str, "(%d+)") do
        table.insert(tbl, k)
    end
    if #tbl >= 3 then
        local date = {year = tonumber(tbl[1] or 0), month = tonumber(tbl[2] or 0), day = tonumber(tbl[3] or 0), 
            hour = tonumber(tbl[4] or 0), min = tonumber(tbl[5] or 0) , sec = tonumber(tbl[6] or 0)}
        return q.OSTime(date)
    end
    return q.serverTime()
end

function q.getDateTblByStr(str)
    if not str then 
        return {}
    end
    local tbl = {}
    for k,v in string.gmatch(str, "(%d+)") do
        table.insert(tbl, k)
    end
    local date = {year = tonumber(tbl[1] or 0), month = tonumber(tbl[2] or 0), day = tonumber(tbl[3] or 0), 
          hour = tonumber(tbl[4] or 0), min = tonumber(tbl[5] or 0) , sec = tonumber(tbl[6] or 0)}
    return date
end

-- 当数值大于100万的时候，显示 XXX万
-- 当数值大于1000亿的时候，显示 XXX亿
function q.convertLargerNumber(num)
    num = tonumber(num) or 0
    local unit = ""
    if num >= 1e+31 then
        num = math.floor(num/1e+28)
        unit = "亿亿兆"
    elseif num >= 1e+27 then
        num = math.floor(num/1e+24)
        unit = "万亿兆"
    elseif num >= 1e+23 then
        num = math.floor(num/1e+20)
        unit = "亿兆"
    elseif num >= 1e+19 then
        num = math.floor(num/1e+16)
        unit = "万兆"
    elseif num >= 1e+15 then
        num = math.floor(num/1e+12)
        unit = "万亿"
    elseif num >= 1e+10 then
        num = math.floor(num/1e+8)
        unit = "亿"
    elseif num >= 1e+6 then
        num = math.floor(num/1e+4)
        unit = "万"
    else
        num = math.floor(num)
    end
    return num,unit
end

-- 当数值大于100万的时候，显示 XXX万
-- 当数值大于1亿的时候，显示 XXX亿XXX万
function q.convertLargerNumber2(num)
    num = tonumber(num) or 0
    local unit = ""
    if num >= 1e+31 then
        num = math.floor(num/1e+28)
        unit = "亿亿兆"
    elseif num >= 1e+27 then
        num = math.floor(num/1e+24)
        unit = "万亿兆"
    elseif num >= 1e+23 then
        num = math.floor(num/1e+20)
        unit = "亿兆"
    elseif num >= 1e+19 then
        num = math.floor(num/1e+16)
        unit = "万兆"
    elseif num >= 1e+15 then
        num = math.floor(num/1e+12)
        unit = "万亿"
    elseif num >= 1e+11 then
        num = math.floor(num/1e+8)
        unit = "亿"
    elseif num >= 1e+8 then
        local num2 = math.floor((num%1e+8)/1e+4)
        if num2 > 0 then
            unit = "亿"..num2.."万"
        else
            unit = "亿"
        end
        num = math.floor(num/1e+8)
    elseif num >= 1e+6 then
        num = math.floor(num/1e+4)
        unit = "万"
    else
        num = math.floor(num)
    end
    return num..unit, ""
end

-- 保留两位小数
function q.convertLargerNumber3(num)
    num = tonumber(num) or 0
    local numStr = ""
    if num >= 1e+31 then
        numStr = string.format("%.2f亿亿兆", num/1e+28)
    elseif num >= 1e+27 then
        numStr = string.format("%.2f万亿兆", num/1e+24)
    elseif num >= 1e+23 then
        numStr = string.format("%.2f亿兆", num/1e+20)
    elseif num >= 1e+19 then
        numStr = string.format("%.2f万兆", num/1e+16)
    elseif num >= 1e+15 then
        numStr = string.format("%.2f万亿", num/1e+12)
    elseif num >= 1e+10 then
        numStr = string.format("%.2f亿", num/1e+8)
    elseif num >= 1e+6 then
        numStr = string.format("%.2f万", num/1e+4)
    else
        numStr = string.format("%.2f", num)
    end
    return numStr
end

function q.setForce(label, value)
    value = math.ceil(value)
    local num, unit = q.convertLargerNumber(value)
    label:setString(num..unit)
    local fontInfo = db:getForceColorByForce(value)
    if fontInfo ~= nil then
        local color = string.split(fontInfo.force_color, ";")
        label:setColor(ccc3(color[1], color[2], color[3]))
    end
end

-- 2个字转四个位置
function q.formatFourWords(name)
    local nameCount = #name
    if nameCount ~= 6 then
        return name
    end
    local word1 = string.sub(name, 1, 3)
    local b = string.byte(word1) or 0
    if b <= 128 then
        return name
    end
    local word2 = string.sub(name, 4, nameCount)
    local b = string.byte(word2) or 0
    if b <= 128 then
        return name
    end
    return word1.."       "..word2
end

function q.countNodeMaxWidth(node)
    local point = node:getAnchorPoint()
    local pos = cc.p(node:getPosition())
    local size = node:getContentSize()
    local scaleX = node:getScaleX()
    return pos.x + (1 - point.x) * size.width * scaleX
end

--自动排列node节点
function q.autoLayerNode(nodes, dircetion, gap)
    gap = gap or 0
    if dircetion == "x" then
        for index,node in ipairs(nodes) do
            if index > 1 then
                local perNode = nodes[index-1]
                local posX = 0
                if perNode:isVisible() then
                    posX = q.countNodeMaxWidth(perNode)
                else
                    posX = perNode:getPositionX()
                end
                if node:isVisible() then
                    local point = node:getAnchorPoint()
                    local size = node:getContentSize()
                    local scaleX = node:getScaleX()
                    posX = posX + point.x * size.width * scaleX + gap
                end
                node:setPositionX(posX)
            end
        end
    else
        for index,node in ipairs(nodes) do
            if index > 1 then
                local perNode = nodes[index-1]
                local size = perNode:getContentSize()
                if perNode:isVisible() == false then
                    size.height = 0
                end
                node:setPositionY(perNode:getPositionY() + size.height * perNode:getScaleY() + gap)
            end
        end
    end
end

--处理battleVerify
function q.battleVerifyHandler(battleVerify)
    if battleVerify then
        local buffer = crypto.decodeBase64(battleVerify)
        if buffer then
            buffer = crypto.decryptXXTEA(buffer, "WOW-BATTLE=VERIFY123")
            if buffer then
                local buffer = string.gsub(buffer, "battleKey:", "")
                buffer = string.gsub(buffer, ",sysTime:", "")
                local verify = crypto.encryptXXTEA(buffer, "WOW-BATTLE=VERIFY123")
                return crypto.encodeBase64(verify)
            end
        end
    end
end

-- 获取某时间当天剩余时间
function q.getLeftTimeOfDay(time, hour)
    time = time or q.serverTime()
    hour = hour or 0

    local dateTime = q.date("*t", time)
    dateTime.day = dateTime.day+1
    dateTime.hour = hour
    dateTime.min = 0
    dateTime.sec = 0

    return q.OSTime(dateTime) - time
end

-- 传入刷新时间点 计算刷新的时间毫秒数
function q.refreshTime(hour, min, sec)
    local currTime = q.date("*t", q.serverTime())
    local offsetTime = 0
    if tonumber(currTime.hour) < tonumber(hour) then
        offsetTime = 24*60*60
    end
    currTime.hour = hour or currTime.hour
    currTime.min = min or 0
    currTime.sec = sec or 0
    local freshTotalTime = q.OSTime(currTime) - offsetTime
    return freshTotalTime
end

-- 传入时间点 计算指定的时间毫秒数
function q.getTimeForHMS(hour, min, sec)
    local currTime = q.date("*t", q.serverTime())
    currTime.hour = hour or currTime.hour
    currTime.min = min or currTime.min
    currTime.sec = sec or currTime.sec
    local freshTotalTime = q.OSTime(currTime)
    return freshTotalTime
end

-- 传入时间点 计算指定的时间毫秒数
function q.getTimeForYMDHMS(year, month, day, hour, min, sec)
    local currTime = q.date("*t", q.serverTime())
    currTime.year = year or currTime.year
    currTime.month = month or currTime.month
    currTime.day = day or currTime.day
    currTime.hour = hour or currTime.hour
    currTime.min = min or currTime.min
    currTime.sec = sec or currTime.sec
    local freshTotalTime = q.OSTime(currTime)
    return freshTotalTime
end

-- 传入秒数计算时间格式为 小时：分钟：秒
-- hideHour： 如果小时为0，是否隐藏
function q.timeToHourMinuteSecond(time, hideHour)
    local hour = math.floor(time/(60*60))
    time = time % (60*60)
    local minute = math.floor(time/60)
    time = time%60
    local second = math.floor(time)
    local hourStr = string.format("%02d", hour)..":"
    if hideHour then
        hourStr = ""
    end

    return hourStr..string.format("%02d", minute)..":"..string.format("%02d", second)
end

function q.timeToHourMinuteSecondMs(time, hideHour)
   local dateTime = q.date("*t", time/1000)

   local hourStr = string.format("%02d", dateTime.hour)..":"
   if hideHour then
       hourStr = ""
   end
   
    return hourStr..string.format("%02d", dateTime.min)..":"..string.format("%02d", dateTime.sec)

end

function q.timeToDayHourMinute(time)
    local day = math.floor(time/DAY)
    time = time%DAY
    local hour = math.floor(time/HOUR)
    time = time%HOUR
    local minute = math.floor(time/MIN)
    time = time%MIN
    local second = math.floor(time)
    if day > 0 then
        return day.."天"..string.format("%02d", hour).."小时"..string.format("%02d", minute).."分"
    elseif hour > 0 then
        return string.format("%02d", hour).."小时"..string.format("%02d", minute).."分"..string.format("%02d", second).."秒"
    elseif minute > 0 then
        return string.format("%02d", minute).."分"..string.format("%02d", second).."秒"
    else
        return string.format("%02d", second).."秒"
    end
end

function q.timeToDayHourMinute2(time)
    local day = math.floor(time/DAY)
    time = time%DAY
    local hour = math.floor(time/HOUR)
    time = time%HOUR
    local minute = math.floor(time/MIN)
    time = time%MIN
    local second = math.floor(time)
    if day > 1 then
        return day.."天"
    elseif day == 1 then
        return (hour + 24).."小时"
    elseif hour > 0 then
        return hour.."小时"
    elseif minute > 0 then
        return minute.."分"
    else
        return second.."秒"
    end
end

function q.timeToYearMonthDay(time)

    local dateTime = q.date("*t", time)
   
    return dateTime.year.."."..string.format("%02d", dateTime.month).."."..string.format("%02d", dateTime.day)
end


function q.timeToMonthDayHourMin(time)
    local dateTime = q.date("*t", time)
    return string.format("%d", dateTime.month)..T("QFunctions_wordKey_13", "月")..string.format("%02d", dateTime.day)..T("QUIDialogGameCalendar_wordKey_2", "日")..string.format("%02d", dateTime.hour)..":"..string.format("%02d", dateTime.min)
end

function q.setScreenScale(node, screenScale)
    local scale = 1.0
    local parent = node:getParent()
    while parent do
        scale = scale * parent:getScale()
        parent = parent:getParent()
    end
    node:setScale(screenScale / scale)
end

function q.newPercentBarClippingNode(node)
    local clippingNode = CCClippingNode:create()
    local stencil = CCLayerColor:create(ccc4(0,0,0,150),node:getContentSize().width,node:getContentSize().height)
    local scaleX = node:getScaleX()
    local scaleY = node:getScaleY()
    stencil:setScaleX(scaleX)
    stencil:setScaleY(scaleY)
    stencil:ignoreAnchorPointForPosition(false)
    stencil:setAnchorPoint(node:getAnchorPoint())
    clippingNode:setStencil(stencil)
    local parent = node:getParent()
    node:retain()
    node:removeFromParent()
    clippingNode:addChild(node)
    parent:addChild(clippingNode)
    clippingNode:setPosition(cc.p(node:getPosition()))
    node:setPosition(cc.p(0, 0))
    node:release()

    return clippingNode
end

-- 判断两个点是否足够近
function q.is2PointsClose(pt1, pt2)
    local x = pt1.x - pt2.x
    local y = pt1.y - pt2.y
    return x * x + y * y < EPSILON * EPSILON
end

function q.is2PointsCloseWithTolerance(pt1, pt2, tolerance)
    tolerance = tolerance or EPSILON
    local x = pt1.x - pt2.x
    local y = pt1.y - pt2.y
    return x * x + y * y < tolerance * tolerance
end

-- 计算两点距离
function q.distOf2Points(pt1, pt2)
    local dx = pt1.x - pt2.x
    local dy = pt1.y - pt2.y
    return math.sqrt(dx * dx + dy * dy)
end

-- 计算两点距离的平方，用来比较距离
function q.distOf2PointsSquare(pt1, pt2)
    local dx = pt1.x - pt2.x
    local dy = pt1.y - pt2.y
    return dx * dx + dy * dy
end

function q.distOf2PointsSquareWithYCoefficient(pt1, pt2, yCoefficient)
    local dx = pt1.x - pt2.x
    local dy = (pt1.y - pt2.y) * yCoefficient
    return dx * dx + dy * dy
end

function qccp(x, y)
    return {x = x, y = y}
end

local __ccposition_const = cc.p(0, 0)
function ccp_const(x, y)
    __ccposition_const.x = x
    __ccposition_const.y = y
    return __ccposition_const
end

function q.countWord(str)
    if str == nil then return 0 end
    if #str == 0 then return 0 end
    local count = 0
    local c,b
    local i = 1
    while true do 
        c = string.sub(str,i,i)
        b = string.byte(c)
        if b > 128 then
            i = i + 3
        else
            i = i + 1
        end
        count = count + 1
        if i > #str then
            break
        end
    end
    return count
end
--[[
/**
 *  计算距离添加换行符
 *  @param input 需要添加换行符的字符串
 *  @param skipSpace 是否忽略空格
 *  @return fullWidth 全角字符所占的宽度
 *  @return width 半角字符所占的宽度
 *  @return lineWidth 本行的宽度
 */
--]]
function q.autoWrap(input,fullWidth,width,lineWidth,skipSpace)
    local str = ""
    local num = ""
    if string.len(input) == 0 then return str end
    local i = 1
    local len = 0
    local c,b
    while true do 
        c = string.sub(input,i,i)
        b = string.byte(c)
        if b > 128 then
            str = str .. (string.sub(input,i,i+2))
            len = len + fullWidth
            i = i + 3
        else
            if b ~= 32 or skipSpace == false then
                str = str .. c
            end
            len = len + width
            i = i + 1
        end
        --检查数字中是否有换行符
        if (b >= 48 and b <= 57) or b == 46 then
            num = num..c
        elseif num ~= "" then
            num = ""
        end
        if i > #input then
            break
        end
        if b == 10 then
            len = 0
        elseif len >= lineWidth then
            if num ~= "" then
              str = q.replaceString(str, num, "\n")
              str = str..num 
              len = 0
            else
              str = str .. "\n"
              len = 0
            end
        end
     end
     return str
end

--替换源字符串中最后一个字符
function q.replaceString(s, pattern, reps)
  local i = string.len(s)
  local a = string.len(pattern)
  local str = ""
  local c = ""
  local isReplace = false
  while true do 
      if i < a then
        c = string.sub(s,1,i)
      else
        c = string.sub(s,i - a + 1, i)
      end
      if c == pattern and isReplace == false then
        str = reps..str
        i = i - a
        isReplace = true
      else
        str = c..str
        i = i - a
      end
      if i <= 0 then
        break
      end
  end
  return str
end

--[[
 /**
  *计算文字的长度
  * @param input 需要计算的文字
  * @param fullWidth 全角宽度
  * @param width 半角宽度
  */
--]]

function q.wordLen(input, fullWidth, width)
    local i = 1
    local len = 0
    if string.len(input) == 0 then return len end
    local c,b
    while true do 
        c = string.sub(input,i,i)
        b = string.byte(c)
        if b > 128 then
            len = len + fullWidth
            i = i + 3
        else
            len = len + width
            i = i + 1
        end
        if i > string.len(input) then
            break
        end
     end
     return len
end

--[[
 /**
  * 划分数字的千分制
  * @param num 需要转换的数字
  * @return str 返回的字符串
  */ 
]]
function q.micrometer(num)
    local str = ""
    local value = 0
    while true do
        value = num%1000
        num = math.floor(num/1000)
        if num > 0 then
            str = string.format("%.3d", value) .. str
            str =  "," .. str
        else
            str = string.format("%d", value) .. str
            break
        end
    end
    return str
end

-- 取边界值
function q.getNumByBoundary(num, min, max)
    local tempNum = num
    if min and tempNum < min then
        tempNum = min
    end
    if max and tempNum > max then
        tempNum = max
    end
    return tempNum
end

--[[
    转换阿拉伯数字为中文数字
--]]
function q.numToWord(i)
    if i == 0 then
        return T("QFunctions_wordKey_15", "零")
    elseif i == 1 then
        return T("QFunctions_wordKey_16", "一")
    elseif i == 2 then
        return T("QFunctions_wordKey_17", "二")
    elseif i == 3 then
        return T("QFunctions_wordKey_18", "三")
    elseif i == 4 then
        return T("QFunctions_wordKey_19", "四")
    elseif i == 5 then
        return T("QFunctions_wordKey_20", "五")
    elseif i == 6 then
        return T("QFunctions_wordKey_21", "六")
    elseif i == 7 then
        return T("QFunctions_wordKey_22", "七")
    elseif i == 8 then
        return T("QFunctions_wordKey_23", "八")
    elseif i == 9 then
        return T("QFunctions_wordKey_24", "九")
    elseif i == 10 then
        return T("QFunctions_wordKey_25", "十")
    elseif i == 100 then
        return T("QFunctions_wordKey_26", "一百")
    elseif i == 1000 then
        return T("QFunctions_wordKey_27", "一千")
    elseif i > 10 and i <20 then
        return T("QFunctions_wordKey_28", "十")..q.numToWord(i%10)
    elseif i < 100 then
        if i%10 > 0 then
            return q.numToWord(math.floor(i/10))..T("QFunctions_wordKey_29", "十")..q.numToWord(i%10)
        else
            return q.numToWord(math.floor(i/10))..T("QFunctions_wordKey_30", "十")
        end
    elseif i < 1000 then
        if i%100 > 0 then
            if i%100 < 20 then
                return q.numToWord(math.floor(i/100))..T("QFunctions_wordKey_31", "百")..q.numToWord(math.floor((i%100)/10))..q.numToWord(i%100)
            else
                return q.numToWord(math.floor(i/100))..T("QFunctions_wordKey_32", "百")..q.numToWord(i%100)
            end
        else
            return q.numToWord(math.floor(i/100))..T("QFunctions_wordKey_33", "百")
        end
    elseif i < 10000 then
        if i%1000 > 0 then
            if i%1000 < 100 then
                return q.numToWord(math.floor(i/1000))..T("QFunctions_wordKey_34", "千")..q.numToWord(math.floor((i%1000)/100))..q.numToWord(i%1000)
            else
                return q.numToWord(math.floor(i/1000))..T("QFunctions_wordKey_35", "千")..q.numToWord(i%1000)
            end
        else
            return q.numToWord(math.floor(i/1000))..T("QFunctions_wordKey_36", "千")
        end
    elseif i < 100000000 then
        if i%10000 > 0 then
            if i%10000 < 1000 then
                return q.numToWord(math.floor(i/10000))..T("QFunctions_wordKey_38", "万")..q.numToWord(math.floor((i%10000)/1000))..q.numToWord(i%10000)
            else
                return q.numToWord(math.floor(i/10000))..T("QFunctions_wordKey_39", "万")..q.numToWord(i%10000)
            end
        else
            return q.numToWord(math.floor(i/10000))..T("QBattleScene_wordKey_14", "万")
        end
    else
        if i%100000000 > 0 then
            if i%100000000 < 10000000 then
                return q.numToWord(math.floor(i/100000000))..T("QFunctions_wordKey_40", "亿")..q.numToWord(math.floor((i%100000000)/10000000))..q.numToWord(i%100000000)
            else
                return q.numToWord(math.floor(i/100000000))..T("QFunctions_wordKey_41", "亿")..q.numToWord(i%100000000)
            end
        else
            return q.numToWord(math.floor(i/100000000))..T("QFunctions_wordKey_42", "亿")
        end
    end
end

--[[
    颜色转成文字
]]
function q.colorToWord(name)
    if name == "white" then
        return T("QFunctions_wordKey_43", "白")
    elseif name == "green" then
        return T("QFunctions_wordKey_44", "绿")
    elseif name == "blue" then
        return T("QFunctions_wordKey_45", "蓝")
    elseif name == "purple" then
        return T("QFunctions_wordKey_46", "紫")
    elseif name == "orange" then
        return T("QFunctions_wordKey_47", "橙")
    elseif name == "red" then
        return T("QFunctions_wordKey_48", "红")
    elseif name == "yellow" then
        return T("QFunctions_wordKey_49", "金")
    end
    return ""
end

--[[
    convert num address to ip address
]]
function q.convertNumToIP(num)
    local ip1 = math.floor(num/2^24)
    num = num%2^24
    local ip2 = math.floor(num/2^16)
    num = num%2^16
    local ip3 = math.floor(num/2^8)
    num = num%2^8
    local ip4 = math.floor(num)
    return string.format("%d.%d.%d.%d", ip1,ip2,ip3,ip4)
end

function q.convertColorToWord(color)
    if color == "white" then
        return T("QFunctions_wordKey_50", "白色")
    elseif color == "green" then
        return T("QFunctions_wordKey_51", "绿色")
    elseif color == "blue" then
        return T("QFunctions_wordKey_52", "蓝色")
    elseif color == "purple" then
        return T("QFunctions_wordKey_53", "紫色")
    elseif color == "orange" then
        return T("QUIDialogSpecialRefineChoose_wordKey_2", "橙色")
    elseif color == "red" then
        return T("QUIDialogSpecialRefineChoose_wordKey_4", "红色")
    elseif color == "yellow" then
        return T("QFunctions_wordKey_56", "金色")
    end
    return ""
end

function q.convertStrToTable(str, splits, index)
    if index == nil then index = 1 end
    local tbl = {}
    if str ~= nil and #str > 0 then
        if splits ~= nil and #splits > 0 then
            local arr = string.split(str, splits[index])
            local isSplitChild = false
            if #splits > index then
                isSplitChild = true
            end
            for _,value in ipairs(arr) do
                if isSplitChild then
                    local childTbl = q.convertStrToTable(value, splits, index+1)

                    if #childTbl == 1 and type(childTbl[1]) ~= "table" then
                        table.insert(tbl, childTbl[1])
                    elseif #childTbl == 2 then
                        tbl[childTbl[1]] = childTbl[2]
                    else
                        table.insert(tbl,childTbl)
                    end
                else
                    table.insert(tbl, value)
                end
            end
        end
    end
    return tbl
end

--[[
    convert ip address to num address
]]
function q.convertIPToNum(address)
    local ip1,ip2,ip3,ip4 = string.match(address, "(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)")
    return ip1*2^24 + ip2*2^16 + ip3*2^8 + ip4
end

-- sort node based on their y position from large to small when reverse is false
function q.sortNodeZOrder(nodes, reverse)
    if nodes == nil or table.nums(nodes) == 0 then
        return {}
    end
    local parent = nodes[1]:getParent()
    for k, node in ipairs(nodes) do
        if node:getParent() ~= parent then
            return nodes
        end
    end

    table.sort(nodes, function(node1, node2)
        local tag1 = node1:getTag()
        local tag2 = node2:getTag()
        if tag1 ~= tag2 then
            -- CCMessageBox(tostring(tag1) .. " " .. tostring(tag2), "")
            return tag1 > tag2
        else
            local y1 = 0
            local y2 = 0
            if node1 and node1.getPositionY then
                y1 = node1:getPositionY()
            end
            if node2 and node2.getPositionY then
                y2 = node2:getPositionY()
            end
            if (y1 < y2) and (y2 - y1) > 1e-6 then
                return true
            end

            return false
        end
    end)

    if reverse == false then
        local reverseNodes = {}
        local count = table.nums(nodes)
        count = count + 1
        for i, node in ipairs(nodes) do
            reverseNodes[(count - i)] = node
        end
        return reverseNodes
    else
        return nodes
    end
end

-- get table. if not existent, create one.
function q.mt(t, ...)
    local ps = {...}
    local subt = t
    for _, p in ipairs(ps) do
        subt = t[p]
        if not subt then
            subt = {}
            t[p] = subt
        end
        t = subt
    end
    return subt
end

-- set node position to the screen position of another node
function q.setScreenPosition(src, dst, pos)
    local wp = dst:convertToWorldSpace(cc.p(pos.x, pos.y))
    local lp = src:getParent():convertToNodeSpace(wp)
    src:setPosition(lp)
end

function q.isEmpty(t)
    return t == nil or next(t) == nil
end

local _emptyTable = nil
function q.emptyTable()
    if _emptyTable == nil then
        _emptyTable = {}
        setmetatable(_emptyTable, { __newindex = function() print("This table can not set the value !") end })
    end

    return _emptyTable
end

local __tableInsert = table.insert
function table.insert(t, ...)
    if t == _emptyTable then
        return
    end

    __tableInsert(t, ...)
end

QBattle = {}

function QBattle.getTouchingActor(actorViews, x, y)
    if actorViews == nil then return nil end

    local touchedViews = {}
    for i, actorView in ipairs(actorViews) do
        if actorView.getModel and actorView:getModel():isDead() == false 
            and actorView:isTouchMoveOnMe(x, y) == true 
            and (not actorView:getModel():isDisableTouch())
            and (not actorView:getModel():isElf())
            and actorView:getModel():isExile() ~= true then
            if table.nums(touchedViews) == 0 
                and actorView:isTouchMoveOnMeDeeply(x, y) == true 
                and (not app.scene._showActorView or app.scene._showActorView == actorView) then
                return actorView
            else
                table.insert(touchedViews, actorView)
            end
        end
    end

    local touchedCount = table.nums(touchedViews)
    local selectView = nil
    if touchedCount == 1 then
        selectView = touchedViews[1]
    elseif touchedCount > 1 then
        local touchWeight = 0
        local coefficient = 0.8
        for i, touchedView in ipairs(touchedViews) do
            if app.scene._showActorView then
                if touchedView == app.scene._showActorView then
                    selectView = touchedView
                end
            else
                local newTouchWeight = touchedView:getTouchWeight(x, y, coefficient)
                if newTouchWeight > touchWeight then
                    selectView = touchedView
                    touchWeight = newTouchWeight
                    coefficient = coefficient - 0.2
                    if coefficient < 0.2 then
                        coefficient = 0.2
                    end
                end
            end
        end
    end

    return selectView
end

function math.xor(value1, value2)
    return (not not value1) == (not value2)
end

function math.sampler(value1, value2, percent)
    if type(percent) ~= "number" then
        return nil
    end

    if type(value1) == "number" and type(value2) == "number" then
        return value1 * (1 - percent) + value2 * percent 
    elseif type(value1) == "table" and type(value2) == "table" then
        local result = {}
        for k,v1 in pairs(value1) do
            if value2[k] ~= nil then
                local v2 = value2[k]
                if type(v1) == "number" and type(v2) == "number" then
                    result[k] = v1 * (1 - percent) + v2 * percent 
                end
            end
        end
        return result
    else
        return nil
    end
end

function math.sampler2(value1, value2, source_limit1, source_limit2, source_value)
    return math.sampler(value1, value2, (source_value - source_limit1) / (source_limit2 - source_limit1))
end

function math.clamp(value, limit1, limit2)
    if value > limit1 and value > limit2 then
        return limit1 > limit2 and limit1 or limit2
    elseif value < limit1 and value < limit2 then
        return limit1 < limit2 and limit1 or limit2
    else
        return value
    end
end

function math.wrap(value, limit1, limit2)
    local value = math.fmod(value - limit1, limit2 - limit1) + limit1
    if value < limit1 then
        value = value + limit2 - limit1
    end
    return value
end

-- q:format_dec(123, 10, 4) --> "00,0000,0123"
function q.format_dec_int(value, max_digits_number, comma_interval)
    value = math.floor(value)
    local digits_number = 0
    local str = ""
    while true do
        if comma_interval and digits_number ~= 0 and (digits_number - math.floor(digits_number / comma_interval) * comma_interval) == 0 then
            str = "," .. str
        end

        local tmp = math.floor(value / 10)
        str = tostring(value - tmp * 10) .. str
        value = tmp
        digits_number = digits_number + 1

        if max_digits_number then
            if digits_number >= max_digits_number then
                break
            end
        else
            if value <= 0 then
                break
            end
        end
    end

    return str, digits_number
end

-- C (n, k) = n! / (k! * (n-k)!)
-- return the index array
-- n, k is a number
-- n should large or equal than k
function math.combine(n, k)
    local t = {}

    if n == nil then
        return t
    end

    if k == nil then
        k = 1
    end

    if type(n) ~= "number" or type(k) ~= "number" then
        return t
    end

    if n < k then
        return t
    end

    if n == k then
        local m = {}
        for i = n, 1, -1 do
            table.insert(m, i)
        end
        table.insert(t, m)
        return t
    end

    if k == 1 then
        for i = n, 1, -1 do
            local m = {}
            table.insert(m, i)
            table.insert(t, m)
        end
        return t
    end

    for i = n, k, -1 do
        local _t = math.combine(i - 1, k - 1)
        for _, m in ipairs(_t) do
            table.insert(m, 1, i)
        end
        for _, m in ipairs(_t) do
            table.insert(t, m)
        end
    end

    return t

end

-- 用于战斗回放的uuid
local _replay_pseudo_id = 0
-- temporary uuid solution for demo
function replay_uuid()
    _replay_pseudo_id = _replay_pseudo_id + 1
    return _replay_pseudo_id
end

-- 设置用于战斗回放的uuid
function set_replay_pseudo_id(replay_pseudo_id)
    if replay_pseudo_id then
        _replay_pseudo_id = replay_pseudo_id
    end
end

-- 用于计算带参数的四则运算的函数
local function _initParseValue()
    local priority = {}
    priority["+"] = 0
    priority["-"] = 0
    priority["*"] = 1
    priority["/"] = 1
    local func = {}
    func["+"] = function(v1, v2) return v1 + v2 end
    func["-"] = function(v1, v2) return v1 - v2 end
    func["*"] = function(v1, v2) return v1 * v2 end
    func["/"] = function(v1, v2) return v1 / v2 end
    local ops = {}
    ops["+"] = true
    ops["-"] = true
    ops["*"] = true
    ops["/"] = true
    ops["("] = true
    ops[")"] = true
    local digits = {}
    digits["0"] = true
    digits["1"] = true
    digits["2"] = true
    digits["3"] = true
    digits["4"] = true
    digits["5"] = true
    digits["6"] = true
    digits["7"] = true
    digits["8"] = true
    digits["9"] = true
    digits[","] = true
    local function parseWord(format, cursor)
        local number_cursor = nil
        local var_cursor = nil
        while cursor <= string.len(format) do
            local c = string.sub(format, cursor, cursor)
            if c == " " then
                if number_cursor then
                    return tonumber(string.sub(format, number_cursor, cursor - 1)), cursor
                elseif var_cursor then
                    return string.sub(format, var_cursor, cursor - 1), cursor
                end
            elseif number_cursor then
                if not digits[c] then
                    return tonumber(string.sub(format, number_cursor, cursor - 1)), cursor
                end
            elseif var_cursor then
                if ops[c] then
                    return string.sub(format, var_cursor, cursor - 1), cursor
                end
            else
                if ops[c] then
                    return c, cursor + 1
                elseif digits[c] then
                    number_cursor = cursor
                else
                    var_cursor = cursor
                end
            end
            cursor = cursor + 1
        end

        if number_cursor then
            return tonumber(string.sub(format, number_cursor, cursor - 1)), cursor
        elseif var_cursor then
            return string.sub(format, var_cursor, cursor - 1), cursor
        end

        return nil, nil
    end
    local function evaluate(temp)
        while #temp > 1 do
            local index = #temp
            temp[index - 2] = func[temp[index - 1]](temp[index - 2], temp[index])
            temp[index - 1] = nil
            temp[index] = nil
        end
        return temp[1]
    end
    local calculate = nil
    calculate = function(list, from, to, var)
        local cursor = from
        local last_op = nil
        local temp = {}
        while true do
            if cursor > to then
                return evaluate(temp), cursor
            end
            local c = list[cursor]
            if c == "(" then
                local v = nil
                v, cursor = calculate(list, cursor + 1, to, var)
                table.insert(temp, v)
            elseif c == ")" then
                return evaluate(temp), cursor + 1
            elseif type(c) == "number" then
                table.insert(temp, c)
                cursor = cursor + 1
            elseif not ops[c] then
                table.insert(temp, var[c])
                cursor = cursor + 1
            else
                local op = c
                if last_op then
                    if priority[last_op] > priority[op] then
                        local v = evaluate(temp)
                        temp = {}
                        table.insert(temp, v)
                        table.insert(temp, op)
                        last_op = op
                        cursor = cursor + 1
                    else
                        table.insert(temp, op)
                        last_op = op
                        cursor = cursor + 1
                    end
                else
                    table.insert(temp, op)
                    last_op = op
                    cursor = cursor + 1
                end
            end
        end
    end
    local function parseValue(format, var)
        local symbol = nil
        local cursor = 1
        local list = {}
        while true do
            symbol, cursor = parseWord(format, cursor)
            if symbol == nil or cursor == nil then
                break
            end
            table.insert(list, symbol)
        end

        return calculate(list, 1, #list, var)
    end
    return parseValue
end

local _parseValue = _initParseValue()

function q.evaluateFormula(format, var)
    return _parseValue(format, var)
end

--[[
    path: a directory path
    fileSuffix: suffix of file type. for example "lua", "png"
    isIntoSubfolder: default is true
--]]
function filesInFolder(path, fileSuffix, isIntoSubfolder)
    local findFiles = {}
    if path == nil then
        return findFiles
    end

    if isIntoSubfolder == nil then
        isIntoSubfolder = true
    end

    for file in lfs.dir(path) do
        if file ~= "." and file ~= ".." then
            local f = path .. "/" .. file
            local fname = file;
            if fileSuffix == nil or string.len(fileSuffix) == 0 then
                table.insert(findFiles, fname)
                -- printInfo("file file:" .. fname .. " in folder:" .. path)
            else
                if string.find(f, "%." .. fileSuffix) ~= nil then
                    table.insert(findFiles, fname)
                    -- printInfo("file file:" .. fname .. " in folder:" .. path)
                end
            end
            local attr = lfs.attributes(f)
            assert (type(attr) == "table")
            if attr.mode == "directory" and isIntoSubfolder then
                local fileNames = filesInFolder(f, fileSuffix, isIntoSubfolder)
                for _, fileName in ipairs(fileNames) do
                    table.insert(findFiles, fname .. "/" .. fileName)
                end
            end
        end
    end

    return findFiles
end


-- shrink object functions
local _rawget = rawget
local _rawset = rawset
local _next = next
local shrink_metas = {}
local _pattern_tmp
local function get_shrink_object_index(__colnames, __enum2string, __patterns, __chart)
    if __enum2string and __patterns then
        return function(t, key)
            local ret = _rawget(t, __colnames[key])
            if ret and __enum2string[key] then
                local __ret = __enum2string[key][ret]
                ret = __ret or ret
                return ret
            elseif ret and __patterns[key] then
                -- local values = {}
                -- while true do
                --     local value = _rawget(t, ret)
                --     if value then
                --         values[#values + 1] = value
                --         ret = ret - 1
                --     else
                --         break
                --     end
                -- end
                _pattern_tmp = __chart[tostring(_rawget(t,1))][-1]
                if _pattern_tmp and _pattern_tmp[__colnames[key]] then
                    _pattern_tmp = _pattern_tmp[__colnames[key]]
                    return string.format(_pattern_tmp, --[[unpack(values)]] 
                        _rawget(t, ret),_rawget(t, ret - 1),_rawget(t, ret - 2),_rawget(t, ret - 3),_rawget(t, ret - 4),_rawget(t, ret - 5),_rawget(t, ret - 6),_rawget(t, ret - 7),_rawget(t, ret - 8))
                else
                    return ret
                end
            else
                return ret
            end
        end
    elseif __enum2string then
        return function(t, key)
            local ret = _rawget(t, __colnames[key])
            if ret and __enum2string[key] then
                local __ret = __enum2string[key][ret]
                ret = __ret or ret
                return ret
            else
                return ret
            end
        end
    else
        return function(t, key)
            return _rawget(t, __colnames[key])
        end
    end
end
local function get_shrink_object_pairs(__colnames, __colindices, __enum2string)
    local v, index
    if __enum2string then
        return function(t)
            return function(t, k)
                repeat
                    k, index = _next(__colnames, k)
                    v = _rawget(t, index) 
                until k == nil or v ~= nil
                if v and __enum2string[k] then
                    local __v = __enum2string[k][v]
                    v = __v or v
                    return k, v
                else
                    return k, v
                end
            end, t, nil
        end
    else
        return function(t)
            local len = #__colindices
            return function(t, k)
                local _index = __colnames[k]
                for index = (_index and (_index + 1) or 1), len do
                    v = _rawget(t, index)
                    if v then
                        return __colindices[index], v
                    end
                end
            end, t, nil
        end
    end
end
local function get_shrink_object_newindex(__colnames, __colindices, __string2enum)
    if __string2enum then
        return function(t, k, v)
            local index = __colnames[k]
            if not index then
                table.insert(__colindices, k)
                index = #__colindices
                __colnames[k] = index
            end
            if v and __string2enum[k] then
                local __v = __string2enum[k][v]
                v = __v or v
                _rawset(t, index, v)
            else
                _rawset(t, index, v)
            end
        end
    else
        return function(t, k, v)
            local index = __colnames[k]
            if not index then
                table.insert(__colindices, k)
                index = #__colindices
                __colnames[k] = index
            end
            _rawset(t, index, v)
        end
    end
end
local clonedObjects = nil
function q.enableShrinkObjectCache()
    clonedObjects = {}
end
function q.disableShrinkObjectCache()
    clonedObjects = nil
end
function q.cloneShrinkedObject(shrink_obj)
    if type(shrink_obj) ~= "table" then
        return shrink_obj
    end

    if clonedObjects then
        local obj = clonedObjects[shrink_obj]
        if obj then
            return obj
        end
    end

    if not getmetatable(shrink_obj) or not shrink_metas[getmetatable(shrink_obj)] then
        return clone(shrink_obj)
    end

    local mt = getmetatable(shrink_obj)
    setmetatable(shrink_obj, nil)
    local obj = {}
    local __colnames = shrink_metas[mt][1]
    local enum2string = shrink_metas[mt][3]
    if enum2string then
        for k, v in pairs(__colnames) do
            local v = shrink_obj[v]
            if v and enum2string[k] then
                v = enum2string[k][v] or v
                obj[k] = v
            else
                obj[k] = v
            end
        end
    else
        for k, v in pairs(__colnames) do
            obj[k] = shrink_obj[v]
        end
    end
    setmetatable(shrink_obj, mt)

    if clonedObjects then
        clonedObjects[shrink_obj] = obj
    end

    return obj
end
function q.shrinkObject(colnames_bykey, colnames_byindex, mt, obj, enum2string, string2enum)
    local raw_obj = obj
    local obj = {}

    for key, value in pairs(raw_obj) do
        local col_index = colnames_bykey[key]
        if col_index == nil then
            table.insert(colnames_byindex, key)
            col_index = #colnames_byindex
            colnames_bykey[key] = col_index
        end
        obj[col_index] = value
    end

    if not mt.__index then
        mt.__index = get_shrink_object_index(colnames_bykey, enum2string)
        mt.__newindex = get_shrink_object_newindex(colnames_bykey, colnames_byindex, enum2string)
        mt.__pairs = get_shrink_object_pairs(colnames_bykey, colnames_byindex, enum2string)
        shrink_metas[mt] = {colnames_bykey, colnames_byindex, enum2string, string2enum}
    end
    setmetatable(obj, mt)

    return obj
end
function q.getShrinkMetatable(colnames_bykey, colnames_byindex, enum2string, string2enum, patterns, charttable)
    local mt = {}
    mt.__index = get_shrink_object_index(colnames_bykey, enum2string, patterns, charttable)
    mt.__newindex = get_shrink_object_newindex(colnames_bykey, colnames_byindex, enum2string)
    mt.__pairs = get_shrink_object_pairs(colnames_bykey, colnames_byindex, enum2string)
    shrink_metas[mt] = {colnames_bykey, colnames_byindex, enum2string, string2enum}
    return mt
end

function q.setNodeCascadeOpacityEnabled( node )
    -- body
    if node then
        node:setCascadeOpacityEnabled(true)
        local children = node:getChildren()
        if children then
            for index = 0, children:count()-1, 1 do
                local tempNode = children:objectAtIndex(index)
                local tempNode = tolua.cast(tempNode, "CCNode")
                q.setNodeCascadeOpacityEnabled(tempNode)
            end
        end
    end
end

-- debug utility functions
local _debug_hook_disabled_ = false
local _debug_hook_main_ = nil
function q.disableDebugHook()
    if _debug_hook_disabled_ then
        return
    end
    _debug_hook_main_ = debug.gethook()
    debug.sethook()
    _debug_hook_disabled_ = true
end

function q.enableDebugHook()
    if not _debug_hook_disabled_ then
        return
    end
    debug.sethook(_debug_hook_main_, "lcr")
    _debug_hook_main_ = nil
    _debug_hook_disabled_ = false
end

-- max
function q.max(candidates, dist_func, compare_func)
    local candidate, distance
    for i, obj in ipairs(candidates) do
        local dist = dist_func(obj)
        if compare_func(distance, dist) then
            distance = dist
            candidate = obj
        end
    end
    return candidate, distance
end

-- id, level parsing
function q.parseIDAndLevel(id, default_level, skill, buff)
    default_level = default_level or 1
    local level = nil
    if string.find(id, ",") then
        local objs = string.split(id, ",")
        id = objs[1]
        level = tonumber(objs[2])
    elseif string.find(id, ";") then
        local objs = string.split(id, ";")
        id = objs[1]
        if objs[2] == "y" then
            if skill then
                level = skill:getSkillLevel()
            elseif buff then
                level = buff:getLevel()
            else
                level = default_level
            end
        else
            level = default_level
        end
    else
        level = default_level
    end

    return id, level
end

-- shuffle array
function q.shuffleArray(array, random_func)
    random_func = random_func or math.random
    local count = #array
    for i = 1, count - 1 do
        local switch_index = random_func(i, count)
        local tmp = array[switch_index]
        array[switch_index] = array[i]
        array[i] = tmp
    end
end

function q.alignToScreenVerticalAbsolute(node, isUp, dist)
    if isUp then
        local p = node:getParent():convertToNodeSpace(cc.p(0.0, display.height - dist))
        node:setPositionY(p.y)
    else
        local p = node:getParent():convertToNodeSpace(cc.p(0.0, dist))
        node:setPositionY(p.y)
    end
end

local _posBeforeShake = nil

function q.shakeScreen(value, duration, repeat_count)
    value = value or 20
    duration = duration and (duration / 8) or 0.05
    repeat_count = repeat_count or 1

    local scene = CCDirector:sharedDirector():getRunningScene()
    if scene then
        if _posBeforeShake == nil then
            _posBeforeShake = {x = scene:getPositionX(), y = scene:getPositionY()}
        end
        scene:stopAllActions()
        scene:setPosition(_posBeforeShake.x, _posBeforeShake.y)
        local arr = CCArray:create()
        -- how shake looks like
        -- ______
        -- \    /|
        -- |\  / | 
        -- | \/  |
        -- | /\  |
        -- |/  \ |
        -- /____\|
        arr:addObject(CCMoveBy:create(duration / 2, cc.p(-value / 2, value / 2)))
        arr:addObject(CCMoveBy:create(duration, cc.p(value, 0)))
        arr:addObject(CCMoveBy:create(duration, cc.p(-value, -value)))
        arr:addObject(CCMoveBy:create(duration, cc.p(value, 0)))
        arr:addObject(CCMoveBy:create(duration, cc.p(-value, value)))
        arr:addObject(CCMoveBy:create(duration, cc.p(0, -value)))
        arr:addObject(CCMoveBy:create(duration, cc.p(value, value)))
        arr:addObject(CCMoveBy:create(duration, cc.p(0, -value)))
        arr:addObject(CCMoveBy:create(duration / 2, cc.p(-value / 2, value / 2)))
        scene:runAction(CCRepeat:create(CCSequence:create(arr), repeat_count))
    end
end

function q.strikeNode(node)
    node:setOpacity(120.0)
    node:setScale(7.0)
    local arr1 = CCArray:create()
    arr1:addObject(CCScaleTo:create(0.4, 1.0, 1.0))
    arr1:addObject(CCFadeTo:create(0.4, 255.0))
    local arr = CCArray:create()
    arr:addObject(CCFadeTo:create(1, 120.0))
    arr:addObject(CCSpawn:create(arr1))
    arr:addObject(CCScaleTo:create(5, 1.0, 1.0))
    
    -- node:runAction(CCSequence:create(arr))
    node:runAction(CCSpawn:create(arr1))
end

-- 呼吸效果动画
function q.nodeBreatheEffect(node, delay, min, max)
    if not node then return end

    delay = delay or 1
    min = min or 180
    max = max or 255
    local arr = CCArray:create()
    arr:addObject(CCFadeTo:create(delay, min))
    arr:addObject(CCFadeTo:create(delay, max))
    node:stopAllActions()
    node:runAction(CCRepeatForever:create(CCSequence:create(arr)))
end

function q.numberToRomanNumerals(num)
    local returnStr = ""
    local num = tonumber(num)
    if num == 0 then
        returnStr = ""
    elseif num == 1 then
        returnStr = "I"
    elseif num == 2 then
        returnStr = "II"
    elseif num == 3 then
        returnStr = "III"
    elseif num == 4 then
        returnStr = "IV"
    elseif num == 5 then
        returnStr = "V"
    elseif num == 6 then
        returnStr = "VI"
    elseif num == 7 then
        returnStr = "VII"
    elseif num == 8 then
        returnStr = "VIII"
    elseif num == 9 then
        returnStr = "IX"
    elseif num == 10 then
        returnStr = "X"
    else
        return num
    end

    return returnStr
end

function q.encodeURL(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end

function q.decodeURL(s)
    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
    return s
end

function writeToFile(name, content)
    if content == nil or name == nil then
        return
    end
    local fileutil = CCFileUtils:sharedFileUtils()
    local wfile = io.open(fileutil:getWritablePath() .. name, "w")
    if wfile then
        wfile:write(content)
        wfile:close()
    end
end

function writeToBinaryFile(name, content)
    if content == nil or name == nil then
        return
    end
    local fileutil = CCFileUtils:sharedFileUtils()
    local wfile = io.open(fileutil:getWritablePath() .. name, "wb")
    if wfile then
        wfile:write(content)
        wfile:close()
    end
end

function appendToFile(name, content)
    if content == nil or name == nil then
        return
    end
    local fileutil = CCFileUtils:sharedFileUtils()
    if fileutil:isFileExist(fileutil:getWritablePath() .. name) == false then
        writeToFile(name, content)
    else
        local wfile = io.open(fileutil:getWritablePath() .. name, "ab+")
        if wfile then
            wfile:seek("end")
            wfile:write(content)
            wfile:close()
        end
    end
end

function readFromFile(name)
    if name == nil then
        return
    end
    local fileutil = CCFileUtils:sharedFileUtils()
    local rfile=io.open(fileutil:getWritablePath() .. name, "r") 
    if rfile then
        local content = rfile:read("*a")
        rfile:close() 
        return content
    end
end

function readFromBinaryFile(name)
    if name == nil then
        return
    end
    local fileutil = CCFileUtils:sharedFileUtils()
    local rfile=io.open(fileutil:getWritablePath() .. name, "rb") 
    if rfile then
        local content = rfile:read("*a")
        rfile:close() 
        return content
    end
end

function fileExists(name)
    if not name then return end

    local fileutil = CCFileUtils:sharedFileUtils()
    if fileutil:isFileExist(fileutil:getWritablePath() .. name) then
        return true
    else
        return false
    end
end

function directoryExists(name)
    if not name then return end

    local fileutil = CCFileUtils:sharedFileUtils()
    if fileutil.isDirectoryExist and fileutil:isDirectoryExist(fileutil:getWritablePath() .. name) then
        return true
    else
        return false
    end
end

function createSubDirectory(name)
    if QUtility.createSubDirectory and QUtility:createSubDirectory(name) then
        return true
    else
        return false
    end
end

function listFolderWithFilter(dir, filter, except)
    if QUtility.listFolderWithFilter then
        local fileutil = CCFileUtils:sharedFileUtils()
        local folderPath = fileutil:getWritablePath() .. dir
        local fileList = QUtility:listFolderWithFilter(folderPath, filter, except)

        return fileList
    else
        return ""
    end
end

function zipFile(dir, source, removeIfSucceed)
    if QUtility.zipFile then
        removeIfSucceed = removeIfSucceed or false
        local fileutil = CCFileUtils:sharedFileUtils()
        local folderPath = fileutil:getWritablePath() .. dir
        return QUtility:zipFile(folderPath .. "/" .. source, removeIfSucceed)
    else
        return false
    end
end

function rename(dir, source, dest)
    if QUtility.rename then
        local fileutil = CCFileUtils:sharedFileUtils()
        local folderPath = fileutil:getWritablePath() .. dir
        QUtility:rename(folderPath .. "/" .. source, folderPath .. "/" .. dest)
    end
end

function QPrintTable( ... )
    local info = debug.getinfo(2, "Sl")
    local lineNumber = info and info.currentline or -1
    local source = info and info.source or ""
    local i1 = string.find(source, "/[^/]*$")
    local i2 = string.find(source, ".[^.]*$")
    info = debug.getinfo(2, "n")
    local callerName = info and info.name or ""
    print("Ln." .. lineNumber .. " " .. string.sub(source, i1+1, i2-1) .. ":" .. callerName)
    printTableWithColor(PRINT_FRONT_COLOR_BLUE, PRINT_BACK_COLOR_YELLOW, ... )
end

function QReplaceEmoji(source, replace)
    if source == nil or string.len(source) == 0 then 
        return source 
    end

    if replace == nil then 
        replace = "?" 
    end

    for _, c in ipairs(emoji) do
        source = string.gsub(source, c, replace)
    end
    
    return source
end

function QCheckIsMobile(str)
    -- str = tostring(str)
    -- return string.match(str,"[1][3,4,5,7,8,9]%d%d%d%d%d%d%d%d%d") == str
    return true
end


local function recalculateAtIndex(calculation_array, index)
    local last_final_value = 0
    if index > 1 then
        last_final_value = calculation_array[index - 1].final_value
    end
    local obj = calculation_array[index]
    local value
    if obj.operator == "+" then
        value = last_final_value + obj.value
    elseif obj.operator == "*" then
        value = last_final_value * obj.value
    elseif obj.operator == "&" then
        value = obj.value
    else
        assert(false , string.format("Wrong operator %s", tostring(obj.operator)))
    end
    obj.validate2:set(value)
    obj.final_value = value
end

function createActorNumberProperty()
    local return_obj = {}
    local calculation_array = {}
    local stub_table = {}
    local finalValueSetter = nil
    function return_obj:setFinalValueSetter(setter)
        finalValueSetter = setter
    end
    function return_obj:getFinalValue()
        local len = #calculation_array
        if len == 0 then
            return 0
        else
            return calculation_array[len].final_value
        end
    end
    function return_obj:getCount()
        return #calculation_array
    end
    function return_obj:insertValue(stub, operator, value)
        if stub_table[stub] then
            return
        end

        local obj = {operator = operator, value = value, stub = stub, validate = q.createValidation(value), validate2 = q.createValidation()}
        table.insert(calculation_array, obj)
        recalculateAtIndex(calculation_array, #calculation_array)
        stub_table[stub] = #calculation_array
        if finalValueSetter then
            finalValueSetter(self:getFinalValue())
        end
    end
    function return_obj:getValue(stub)
        local index = stub_table[stub]
        if index then
            return calculation_array[index].value
        end
    end
    function return_obj:modifyValue(stub, operator, value)
        local index = stub_table[stub]
        if index then
            local obj = calculation_array[index]
            obj.operator = operator
            obj.validate:set(value)
            obj.value = value
            recalculateAtIndex(calculation_array, index)
            for index2 = index + 1, #calculation_array do
                recalculateAtIndex(calculation_array, index2)
            end
            if finalValueSetter then
                finalValueSetter(self:getFinalValue())
            end
        end
    end
    function return_obj:removeValue(stub)
        local found_index = nil
        for index, obj in ipairs(calculation_array) do
            if obj.stub == stub then
                found_index = index
                stub_table[stub] = nil
                break
            end
        end
        local len = #calculation_array
        if found_index then
            for index = found_index, len do
                if index < len then
                    calculation_array[index] = calculation_array[index + 1]
                    stub_table[calculation_array[index].stub] = index
                    recalculateAtIndex(calculation_array, index)
                else
                    calculation_array[index] = nil
                end
            end
            if finalValueSetter then
                finalValueSetter(self:getFinalValue())
            end
        end
    end
    function return_obj:clear()
        calculation_array = {}
        stub_table = {}
    end
    function return_obj:validate()
        for _, obj in ipairs(calculation_array) do
            obj.validate:validate(obj.value)
            obj.validate2:validate(obj.final_value)
        end 
    end
    function return_obj:getCalculationArray()
        return calculation_array
    end
    return return_obj
end

function QRectMake(x, y, width, height)
    return {origin = {x = x, y = y}, size = {width = width, height = height}}
end

function QCleanNode( node )
    -- body
    local parentNode = tolua.cast(node, "CCNode")
    if parentNode then
        local children = parentNode:getChildren()
        if children then
            for index = 0, children:count()-1, 1 do
                local tempNode = children:objectAtIndex(index)
                QCleanNode(tempNode)
            end
        end
        parentNode:stopAllActions();
        parentNode:unscheduleUpdate();
    end
end

if CCSprite and CCSprite.setDisplayFrame then
    local _setDisplayFrame = CCSprite.setDisplayFrame
    function CCSprite:setDisplayFrame(frame)
        if frame == nil then
            return
        end
        _setDisplayFrame(self, frame)
    end
end

--[==[
跟踪一个table的某个键,当键被查询的时候会调用getCallBack,当键被重新赋值的时候会调用setCallBack
这个函数会将这个键从table中移除 所以如果有用到遍历的时候 需要注意 注意 注意！
getCallback参数 table,key,value: 被查询的表,被查询的key,查询到的值
setCallback参数 table,key,value,valueBefore: 被修改的表，被修改的键，被修改的值，修改前的值
--]==]
function QDebugFlowwTable(table, key, getCallback, setCallback)
    local __metatable = getmetatable(table) or {}
    local newmetatable = clone(__metatable)
    local realValue = table[key]
    rawset(table,key,nil)
    newmetatable.__index = function(t,k)
                            if k == key then
                                if getCallback then
                                    getCallback(t,k,realValue)
                                end
                                return realValue
                            end
                            if __metatable.__index then
                                if type(__metatable.__index) == "table" then
                                    return __metatable.__index[k]
                                elseif type(__metatable.__index) == "function" then
                                    return __metatable.__index(t,k)
                                end
                            end
                            rawget(t,k)
                        end
    newmetatable.__newindex = function(t,k,v)
                            if k == key then
                                if setCallback then
                                    setCallback(t,k,v,realValue)
                                end
                                realValue = v
                                return
                            end
                            if __metatable.__newindex then
                                if type(__metatable.__newindex) == "table" then
                                    __metatable.__newindex[k] = v
                                elseif type(__metatable.__newindex) == "function" then
                                    __metatable.__newindex(t,k,v)
                                end
                            end
                            rawset(t,k,v)
                        end
    setmetatable(table,newmetatable)
end

function guid()
    local seed={'e','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
    local tb={}
    for i=1,32 do
        table.insert(tb,seed[math.random(1,16)])
    end
    local sid=table.concat(tb)
    return string.format('%s-%s-%s-%s-%s',
        string.sub(sid,1,8),
        string.sub(sid,9,12),
        string.sub(sid,13,16),
        string.sub(sid,17,20),
        string.sub(sid,21,32)
    )
end

--[[
    判断开服时间
]]

function q.isInServerOpenDays(day)
	local openTimeSecond = q.serverTime() - (remote.user.openServerTime or 0)/1000
	local inSeconds = day * DAY
    return openTimeSecond < inSeconds
end

--[[
    判断合服时间
]]

function q.isInServerMergeDays(day)
    local mergeTimeSecond = q.serverTime() - (remote.user.serverMergeTime or 0)/1000
    local inSeconds = day * DAY
    return mergeTimeSecond < inSeconds
end

function q.addPropText(prop, name, value, ispercent, split)
    value = value or 0
    split = split or "+"
    if value > 0 then
        local str = ""
        if ispercent == true then
            str = name..split..(value * 100).."%"
        else
            str = name..split..value
        end
        table.insert(prop, str)
    end
end

--[[
    截屏
    @param node 需要截屏的父节点
    @param imageName ,图片的保存名称
    @param isSprite , 返回CCSprite,不保存图片
]]
function q.screenShot(node, imageName, isSprite)
    if node == nil then return end

    --the layer is just for excute autorender
    local layer = CCLayer:create()
    node:addChild(layer)

    local render = CCRenderTexture:create(display.width, display.height)
    render:begin()
    node:visit()
    render:endToLua()

    layer:removeFromParent()

    local sprite
    if isSprite then
        sprite = CCSprite:createWithSpriteFrame(render:getSprite():getDisplayFrame())
        sprite:flipY(true)
    else
        render:saveToFile(imageName, kFmtJpg)
        render:onExit()
    end

    return sprite
end


-- 获取某个时间的周起始时间
function q.getFirstTimeOfWeek(time, hour)
    time = time or q.serverTime()
    hour = hour or 0

    local dateTime = q.date("*t", time)
    --date的第一天是周日0点，需要加一天到周一0点 -- 周日需要减一周
    if dateTime.wday == 1 then
        dateTime.day = dateTime.day - 7
    end    
    dateTime.day = dateTime.day - dateTime.wday + 2
    dateTime.hour = hour
    dateTime.min = 0
    dateTime.sec = 0

    return q.OSTime(dateTime)
end

-- 是否同一周 hour起始小时
function q.isSameWeekTime(time, hour)
    if not time then
        return false
    end
    local startTime = q.getFirstTimeOfWeek(time, hour)
    if 0 <= q.serverTime() - startTime and q.serverTime() - startTime <= WEEK then
        return true
    end
    return false
end

--获取星期几
function q.timeWeekComm(y,m,d)
    if m == 1 or m == 2 then
        m = m + 12
        y = y - 1  
    end
    local m1,_ = math.modf(3 * (m + 1) / 5)
    local m2,_ = math.modf(y / 4)
    local m3,_ = math.modf(y / 100)
    local m4,_ = math.modf(y / 400)
 
    local iWeek = (d + 2 * m + m1 + y + m2 - m3  + m4 ) % 7
    local weekTab = {
        ["0"] = "星期一",
        ["1"] = "星期二",
        ["2"] = "星期三",
        ["3"] = "星期四",
        ["4"] = "星期五",
        ["5"] = "星期六",
        ["6"] = "星期日",
    }
    return weekTab[tostring(iWeek)] 
end

--[[
    设置品质
    @param nodeOwner 品质fgui节点
    @param aptitudeStr 当前品质字符 sss, ss, s,  a+, a,  b,  c
    @param aptitudeNum 当前品质数字 23, 22, 20, 18, 15, 12, 10
]]
function q.setAptitudeShow(nodeOwner, aptitudeStr, aptitudeNum)
    if nodeOwner == nil then return end
    local aptitudeInfo = nil
    for _, value in ipairs(HERO_SABC) do
        local node = nodeOwner[value.fgui]
        if node then
            node:setVisible(false)
        end
        if aptitudeStr and aptitudeStr == value.lower then
            aptitudeInfo = value
        elseif aptitudeNum and aptitudeNum == value.aptitude then
            aptitudeInfo = value
        end
    end
    
    -- 未找到品质
    if not aptitudeInfo then return end
    if nodeOwner[aptitudeInfo.fgui] then
        nodeOwner[aptitudeInfo.fgui]:setVisible(true)
    end
end
--[[
    设置职业
    @param nodeOwner 品质fgui节点
    @param aptitudeStr 当前品质字符 sss, ss, s,  a+, a,  b,  c
    @param aptitudeNum 当前品质数字 23, 22, 20, 18, 15, 12, 10
]]
function q.setProfessionalShow(nodeOwner, funcIcon)
    if nodeOwner == nil then return end
    local telentInfo = nil
    for _, value in ipairs(HERO_TALENT_CONFIG) do
        local node = nodeOwner[value.fgui]
        if node then
            node:setVisible(false)
        end
        if funcIcon and funcIcon == value.func_icon then
            telentInfo = value
        end
    end
    
    -- 未找到品质
    if not telentInfo then return end
    if nodeOwner[telentInfo.fgui] then
        nodeOwner[telentInfo.fgui]:setVisible(true)
    end
end