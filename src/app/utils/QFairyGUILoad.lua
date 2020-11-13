local QFairyGUILoad = {}

function QFairyGUILoad.loadLua(fguiFile, resName, owner, callbacks)
	fairygui.UIPackage:addPackage("fairygui/"..fguiFile)
   	local gComponent = fairygui.UIPackage:createObject(fguiFile, resName)
    if gComponent == nil then
        assert(false, "load fguiFile:" .. fguiFile .. " faild!")
    end
    -- 节点
    QFairyGUILoad._setChildrenMap(gComponent, owner)
    QFairyGUILoad._setFGUICallbacks(callbacks, owner)

    return gComponent
end


function QFairyGUILoad._setChildrenMap(gComponent, owner)
    local childList = gComponent:getChildren()
    for i, child in pairs(childList) do
        owner[child.name] = child
        if child.getChildren then
            QFairyGUILoad._setChildrenMap(child, owner)
        end
    end
end

function QFairyGUILoad._setFGUICallbacks(callbacks, owner)
    for i, v in pairs(callbacks or {}) do
        local childName = v.childName
        local callback = v.callback
        if childName ~= nil and callback ~= nil then
            local btn = owner[childName]
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

return QFairyGUILoad