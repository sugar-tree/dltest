
local QUIViewController = class("QUIViewController")

QUIViewController.TYPE_PAGE = "UI_TYPE_PAGE"
QUIViewController.TYPE_DIALOG = "UI_TYPE_DIALOG"

function QUIViewController:ctor(type, fguiFile, resName, callbacks, options)
    self.__type = type
    self._fguiOwner = {}

    if fguiFile and resName then
        fairygui.UIPackage:addPackage("fairygui/"..fguiFile);
        self._view = fairygui.UIPackage:createObject(fguiFile, resName)
        if self._view == nil then
            assert(false, "load fguiFile:" .. fguiFile .. " faild!")
        end
    else
        self._view = cc.Node:create()
    end

    -- 回调函数
    if callbacks ~= nil then
        self:_setFGUICallbacks(callbacks)
    end
    
    -- 节点
    local childList = self._view:getChildren()
    for i, child in pairs(childList) do
        self._fguiOwner[child.name] = child
    end

    self._parentViewController = nil
    self._subViewControllers = {}
end

function QUIViewController:getType()
    return self.__type
end

function QUIViewController:getView()
    return self._view
end

function QUIViewController:setParentController(controller)
    if controller == nil then
        return
    end

    self._parentViewController = controller
end

function QUIViewController:getParentController()
    return self._parentViewController
end

function QUIViewController:getNodeFromName(name)
    local node = self._ccbOwner[name]
    
    if node ~= nil then
        if type(node) == "function" then
            node = nil
        end
    end

    return node
end

function QUIViewController:addSubViewController(controller)
    if controller == nil or controller:getView() == nil then
        return
    end

    if controller:getParentController() ~= nil then
        assert(false, "controller is already have parent!")
        return
    end

    controller:viewWillAppear()
    controller:setParentController(self)
    table.insert(self._subViewControllers, controller)
    self:_addViewSubView(controller:getView())
    controller:viewDidAppear()
end

function QUIViewController:removeSubViewController(controller)
    if controller == nil or controller:getView() == nil then
        return
    end

    for i, v in ipairs(self._subViewControllers) do
        if controller == v then
            controller:viewWillDisappear()
            self:_removeViewSubView(controller:getView())
            controller:setParentController(nil)
            table.remove(self._subViewControllers, i)
            controller:viewDidDisappear()
            break
        end
    end
end

function QUIViewController:removeFromParentController()
    if self._parentViewController == nil then
        return
    end

    self._parentViewController:removeSubViewController(self)
end

function QUIViewController:getSubViewControllersCount()
    return #self._subViewControllers
end

function QUIViewController:viewWillAppear()

end

function QUIViewController:viewDidAppear()
    if DEBUG > 0 then
        printInfo(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        printInfo("Enter instance:" .. self.__cname)
        printInfo("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
    end

    self._appear = true
end

function QUIViewController:viewWillDisappear()
    
end

function QUIViewController:viewDidDisappear()
    if DEBUG > 0 then
        printInfo(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        printInfo("Exit instance:" .. self.__cname)
        printInfo("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
    end
    self._appear = false
    if self.__scheduler then
        self.__scheduler.unscheduleAll()
    end
end

function QUIViewController:viewDidReback()
    if DEBUG > 0 then
        printInfo(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        printInfo("reback instance:" .. self.__cname)
        printInfo("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
    end
end

function QUIViewController:_addViewSubView(view)
    if view == nil then
        return
    end

    if self._view == nil then
        assert(false, "self view is invalid!")
        return
    end

    self._view:addChild(view)
end

function QUIViewController:_removeViewSubView(view)
    if view == nil then
        return
    end

    if self._view == nil then
        assert(false, "self view is invalid!")
        return
    end

    self._view:removeChild(view, true)
end

function QUIViewController:_setFGUICallbacks(callbacks)
    for i, v in pairs(callbacks) do
        local childName = v.childName
        local callback = v.callback
        if childName ~= nil and callback ~= nil then
            local btn = self._view:getChild(childName)
            btn:addEventListener(fairygui.UIEventType.TouchEnd, function(context)
                callback(context)
            end)
        end
    end
end

function QUIViewController:hide()
    local view = self:getView()
    if view ~= nil then
        view:setVisible(false)
    end
end

function QUIViewController:show()
    local view = self:getView()
    if view ~= nil then
        view:setVisible(true)
    end
end

function QUIViewController:safeHandler(func)
    return function(...)
        if not self._appear then
            return
        elseif func and type(func) == "function" then
            func(...)
        end
    end
end

function QUIViewController:safeCheck()
    return self._appear == true
end

return QUIViewController