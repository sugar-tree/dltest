
local QBaseModel = import(".QBaseModel")
local QHerosUtils = class("QHerosUtils",QBaseModel)

function QHerosUtils:ctor(options)
	QHerosUtils.super.ctor(self)

	self.heros = {}
	self._keyHaveHeros = {}
end

function QHerosUtils:updateHeros(heros)
    for _,value in pairs(heros) do
        self.heros[value.actorId] = value
    end
end

function QHerosUtils:getHeroById(actorId)
	return self.heros[tonumber(actorId)]
end

--获取已经拥有的英雄ID
function QHerosUtils:getHaveHero(level)
	local heroKeys = {}
	if level == nil then level = 0 end
	for _,actorId in pairs(self._keyHaveHeros) do
		local heroInfo = self:getHeroById(actorId)
		if heroInfo ~= nil and heroInfo.level >= level then
			table.insert(heroKeys, actorId)
		end
	end
	return heroKeys
end