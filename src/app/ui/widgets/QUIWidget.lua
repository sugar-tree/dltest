
local QUIWidget = class("QUIWidget", function()
    return display.newNode()
end)

function QUIWidget:ctor(fguiFile, resName, callbacks, options)
    self._fguiOwner = {}
    self._options = options

    if fguiFile and resName then
        fairygui.UIPackage:addPackage("fairygui/"..fguiFile);
        self._view = fairygui.UIPackage:createObject(fguiFile, resName)
        self._view:setOpaque(false)
        if self._view == nil then
            assert(false, "load fguiFile:" .. fguiFile .. " faild!")
        end
    else
        self._view = fairygui.GComponent:create()
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

    self:setNodeEventEnabled(true)
end

function QUIWidget:extendEvent()
    cc.GameObject.extend(self)
    self:addComponent("framework.components.EventProtocol"):exportMethods()
end

function QUIWidget:getView()
    return self._view
end

function QUIWidget:onEnter()

end

function QUIWidget:onExit()

end

function QUIWidget:getOptions()
    return self._options
end

function QUIWidget:setOptions(options)
    self._options = options or {}
end

function QUIWidget:_setFGUICallbacks(callbacks)
    for i, v in pairs(callbacks) do
        local childName = v.childName
        local callback = v.callback
        if childName ~= nil and callback ~= nil then
            local btn = self._view:getChild(childName)
            if btn then
                btn:addEventListener(fairygui.UIEventType.Click, function(context)
                    callback(context)
                end)
            else
                print("no btn named "..childName)
            end
        end
    end
end


return QUIWidget