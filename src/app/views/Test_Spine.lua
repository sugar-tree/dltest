local BaseLayer = require("app.scenes.BaseLayer")

local TestCase = class("Test_Spine", BaseLayer)
local socket = require "socket"

function TestCase:ctor()
	self.super.ctor(self)

	local spineNames = {
		"pf_sspbosaixi02",
	}
	local spineNames2 = {
		"pf_sspbosaixi02",
	}
	local time1 = socket.gettime()
	for i, name in pairs(spineNames) do
		-- tips
		local spineBinary = "spine/"..name..".skel"
		local spineJson = "spine/"..name..".json"
		local spineAtlas = "spine/"..name..".atlas"
		local spineSP = sp.SkeletonAnimation:createWithBinaryFile(spineBinary, spineAtlas)
		spineSP:setScale(0.5)
		spineSP:pos(i*100, 100):addTo(self)
		spineSP:setAnimation(0, "stand", true)
	end
	local time2 = socket.gettime()

	for i, name in pairs(spineNames2) do
		-- tips
		local spineJson = "spine/"..name..".json"
		local spineAtlas = "spine/"..name..".atlas"
		local spineSP = sp.SkeletonAnimation:createWithJsonFile(spineJson, spineAtlas)
		spineSP:setScale(0.5)
		spineSP:pos(3*100, 100):addTo(self)
		spineSP:setAnimation(0, "stand", true)
	end
	local time2 = socket.gettime()
    local sprite = cc.Sprite:create("spine/pf_sspbosaixi02.png")
    self:addChild(sprite)
	
	local time3 = socket.gettime()
	print( time1, time2, time3 )
	print( time2 - time1, time3 - time2 )
end

return TestCase
