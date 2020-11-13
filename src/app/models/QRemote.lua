

local QRemote = class("QRemote")

QRemote.HERO_UPDATE_EVENT = "HERO_UPDATE_EVENT"

function QRemote:ctor()
	cc.GameObject.extend(self)
    self:addComponent("framework.components.EventProtocol"):exportMethods()

    self.models = {}    --有顺序
    
    table.insert(self.models,{name = "herosUtil", className = ".network.models.QSkillTree"})    --涉及到阵容解锁信息，至少需要在instance前

    self:initData()
end

function QRemote:initData()
    for _,model in ipairs(self.models) do
        self[model.name] = require("app"..model.className).new()
	end
end

--在用户准备登陆时调用
function QRemote:loginEnd()
    for _,model in ipairs(self.models) do
        if self[model.name].loginEnd then
            self[model.name]:loginEnd()
        end
	end
end

--设置销毁
function QRemote:disappear()
    for _,model in ipairs(self.models) do
        if self[model.name].disappear then
            self[model.name]:disappear()
        end
	end
end

function QRemote:updateData(data)
	if data.heros then
        self.herosUtil:updateHeros(data.heros)

        self:dispatchEvent({name = QRemote.HERO_UPDATE_EVENT})
        printInfo("self:dispatchEvent({name = QRemote.HERO_UPDATE_EVENT})")
    end
end