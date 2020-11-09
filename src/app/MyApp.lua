q = q or {}

require("config")
require("cocos.init")
require("framework.init")

require("app.utils.QFunctions")

local QLogFile = require("app.utils.QLogFile")
local QNavigationController = import(".controllers.QNavigationController")
local QNavigationManager = import(".controllers.QNavigationManager")
local QNotificationCenter = import(".controllers.QNotificationCenter")

local MainScene = import(".scenes.MainScene")
local QUIScene = import(".ui.QUIScene")
local QUIViewController = import(".ui.QUIViewController")

local AppBase = require("framework.AppBase")
local MyApp = class("MyApp", AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)

    cc.FileUtils:getInstance():addSearchPath("res/")
    fairygui.UIPackage:addPackage("fairygui/basics")
    fairygui.UIPackage:addPackage("fairygui/widgets")
    self.log = QLogFile:new()
    self._uiScene = MainScene.new()
    display.replaceScene(self._uiScene)
end

function MyApp:run()
    self.fairyRoot = fairygui.GRoot:create(self._uiScene)
    self.fairyRoot:retain()
    self._navigationManager = QNavigationManager.new(self.fairyRoot)
    self._mainLayerPage = self._navigationManager:createAndPushALayer("UI Main Navigation")
    self._topLayerPage = self._navigationManager:createAndPushALayer("Mid Layer Navigation")
    self._thirdLayerPage = self._navigationManager:createAndPushALayer("Third Layer Navigation", true)

    self.mainUILayer = 1
    self.middleLayer = 2
    self.topLayer = 3
end

function MyApp:getRairyRoot()
    return self.fairyRoot
end

function MyApp:popTopWindew()
    local topWindow = self.fairyRoot:getTopWindow()
    self.fairyRoot:hideWindow(topWindow)
end

function MyApp:getNavigationManager()
    return self._navigationManager
end

function MyApp:recordNavigationStack()
end

return MyApp
