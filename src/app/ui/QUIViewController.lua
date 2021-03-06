
local QUIViewController = class("QUIViewController")
local QFairyGUILoad = import("..utils.QFairyGUILoad")

QUIViewController.TYPE_PAGE = "UI_TYPE_PAGE"
QUIViewController.TYPE_DIALOG = "UI_TYPE_DIALOG"

function QUIViewController:ctor(sType, fguiFile, resName, callbacks, options)
    self.__type = sType
    self._fguiOwner = {}
    self._appear = false

    -- 总view
    self._view = fairygui.GComponent:create()
    -- guiView
    self._curView = fairygui.GComponent:create()
    self._view:addChild(self._curView)
    
    self._topView = fairygui.GComponent:create()
    self._view:addChild(self._topView)
    
    -- guiView
    if fguiFile and resName then
        self._gComponent = QFairyGUILoad.loadLua(fguiFile, resName, self._fguiOwner, callbacks)
        self._curView:addChild(self._gComponent)
    end
    
    -- 前节点
    self._viewNode = cc.Node:create()
    self._curView:displayObject():addChild(self._viewNode, 1)

    self._parentViewController = nil
    self._subViewControllers = {}
end

function QUIViewController:getType()
    return self.__type
end

function QUIViewController:getView()
    return self._view
end

function QUIViewController:getTopView()
    return self._topView
end

function QUIViewController:getComponent()
    return self._gComponent
end

function QUIViewController:getRoot()
    return self._viewNode
end

function QUIViewController:addFairyChild(controller)
    self:getRoot():addChild(controller)
    self:_addViewSubView(controller:getView())
end

function QUIViewController:addTopFairyChild(controller)
    self:getRoot():addChild(controller)
    self._topView:addChild(controller:getView())
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
end

function QUIViewController:_addViewSubView(view)
    if view == nil then
        return
    end

    if self._curView == nil then
        assert(false, "self view is invalid!")
        return
    end

    self._curView:addChild(view)
end

function QUIViewController:_removeViewSubView(view)
    if view == nil then
        return
    end

    if self._curView == nil then
        assert(false, "self view is invalid!")
        return
    end

    self._curView:removeChild(view)
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