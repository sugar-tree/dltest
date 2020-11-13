
local QClient = class("QClient")

local QTcpSocket = import(".QTcpSocket")
local QNavigationController = import("..controllers.QNavigationController")
local QLogFile = import("..utils.QLogFile")
local QPayUtil = import("..utils.QPayUtil")

local retry = 0 -- 缺省情况下不重试

local READ_TIME_OUT_DURATION = 25

QClient.PUSH_NOTIFICATION = "QCLIENT_PUSH_NOTIFICATION"

function QClient:ctor(host, port)
    cc(self):addComponent("components.behavior.EventProtocol"):exportMethods()

    self._isReady = false
    self._canSendRequest = false
    self._tcpsocket = QTcpSocket.new(host, port)
    self._seq = 0

    self._readTimeoutHandle = nil

    self._sendList = {}
    self._pushReqList = {}
end

function QClient:open(success, fail)
    self._tcpProxy = cc.EventProxy.new(self._tcpsocket)
    self._tcpProxy:addEventListener(QTcpSocket.EVENT_START_CONNECT, handler(self, self._onStartConnect))
    self._tcpProxy:addEventListener(QTcpSocket.EVENT_CONNECT_SUCCESS, handler(self, self._onConnectSuccess))
    self._tcpProxy:addEventListener(QTcpSocket.EVENT_CONNECT_FAILED, handler(self, self._onConnectFailed))
    self._tcpProxy:addEventListener(QTcpSocket.EVENT_CONNECT_CLOSE, handler(self, self._onConnectClose))
    self._tcpProxy:addEventListener(QTcpSocket.EVENT_RECEIVE_PACKAGE, handler(self, self._onReceivePackage))

    self._connectSuccessCallback = success
    self._connectFaildCallback = fail
    self._tcpsocket:connect()
end

function QClient:close()
    self._tcpsocket:disConnect()

    if self._tcpProxy ~= nil then
        self._tcpProxy:removeAllEventListeners()
        self._tcpProxy = nil
    end

    if self._readTimeoutHandle ~= nil then
        scheduler.unscheduleGlobal(self._readTimeoutHandle)
        self._readTimeoutHandle = nil
    end

    if self._connectionStatusScheduler ~= nil then
        scheduler.unscheduleGlobal(self._connectionStatusScheduler)
        self._connectionStatusScheduler = nil
    end

    self:removeAllEventListeners()
end

-- seq is used to identifiy the uniqueness of package per session
function QClient:seq( ... )
    self._seq = self._seq + 1
    return self._seq
end

function QClient:getSeq( ... )
    return self._seq
end

function QClient:resetSeq( ... )
    self._seq = 0
    return self._seq
end

--[[
服务器连接当前是否可用
--]]
function QClient:isReady()
    return self._isReady
end

function QClient:_onStartConnect()
    
end

-- 判断现在是否允许和服务器进行通讯
function QClient:isServerAuthorized( ... )
    return self._canSendRequest
end

-- 判断TCP连接状态，最好使用下面的checkConnection
function QClient:isConnected()
    return self._tcpsocket:getState() == QTcpSocket.State_Connected
end

function QClient:checkConnection( ... )
    return self._tcpsocket:checkIfSocketIsConnected()
end