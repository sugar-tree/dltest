
local QUIWidget = class("QUIWidget", function()
    return display.newNode()
end)

function QUIWidget:ctor(fguiFile, resName, callbacks, options)
    self._fguiOwner = {}
    self._options = options

    if fguiFile and resName then
        fairygui.UIPackage:addPackage("fairygui/"..fguiFile);
        self._view = fairygui.UIPackage:createObject(fguiFile, resName)
        self._view:setOpaque(false) -- ignore touch
        if self._view == nil then
            assert(false, "load fguiFile:" .. fguiFile .. " faild!")
        end
        app:getRairyRoot():addChild(self._view)
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

    self:setNodeEventEnabled(true)
end

function QUIWidget:extendEvent()
    cc.GameObject.extend(self)
    self:addComponent("components.behavior.EventProtocol"):exportMethods()
end

function QUIWidget:getView()
    return self
end

function QUIWidget:getCCBView()
    return self._fguiOwner
end

function QUIWidget:onEnter()

end

function QUIWidget:onExit()

end

function QUIWidget:getOptions()
    return self._options
end

function QUIWidget:setOptions(options)
    self._options = options
end

function QUIWidget:_setFGUICallbacks(callbacks)
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


return QUIWidget