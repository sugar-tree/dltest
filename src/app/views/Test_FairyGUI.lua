local BaseLayer = require("app.scenes.BaseLayer")

local TestCase = class("Test_FairyGUI", BaseLayer)
local socket = require "socket"

function TestCase:ctor()
	self.super.ctor(self)

	-- tips
	self.fairyRoot = fairygui.GRoot:create(display.getRunningScene())
    self.fairyRoot:retain()

	local time1 = socket.gettime()
	fairygui.UIPackage:addPackage("fairygui/page_main");
    local view = fairygui.UIPackage:createObject("page_main", "main")
	view:setOpaque(false) -- ignore touch
    self.fairyRoot:addChild(view)

	-- local time2 = socket.gettime()
	-- print( time2 - time1 )

	-- local time1 = socket.gettime()
	-- for i = 1, 14 do
	-- 	local name = string.format("map/BigEliteMap%d.jpg", i)
	--     local sprite = cc.Sprite:create(name)
	--     sprite:setPosition(i*30, 300)
	--     self:addChild(sprite)
	-- end
	-- for i = 1, 4 do
	-- 	local name = string.format("map/battle_bj%d.jpg", i)
	--     local sprite = cc.Sprite:create(name)
	--     sprite:setPosition(i*30, 300)
	--     self:addChild(sprite)
	-- end
	-- for i = 1, 4 do
	-- 	local name = string.format("map/fuben%d_battle.jpg", i)
	--     local sprite = cc.Sprite:create(name)
	--     sprite:setPosition(i*30, 300)
	--     self:addChild(sprite)
	-- end
	-- for i = 1, 4 do
	-- 	local name = string.format("map/normal_bj_main%d.jpg", i)
	--     local sprite = cc.Sprite:create(name)
	--     sprite:setPosition(i*30, 300)
	--     self:addChild(sprite)
	-- end
	-- for i = 1, 4 do
	-- 	local name = string.format("map/shadowfang_keep0%d.jpg", i)
	--     local sprite = cc.Sprite:create(name)
	--     sprite:setPosition(i*30, 300)
	--     self:addChild(sprite)
	-- end
	-- for i = 1, 4 do
	-- 	local name = string.format("map/yingkuangzhan_%d.jpg", i)
	--     local sprite = cc.Sprite:create(name)
	--     sprite:setPosition(i*30, 300)
	--     self:addChild(sprite)
	-- end
	-- for i = 1, 4 do
	-- 	local name = string.format("map/wailing_caverns0%d.jpg", i)
	--     local sprite = cc.Sprite:create(name)
	--     sprite:setPosition(i*30, 300)
	--     self:addChild(sprite)
	-- end
	-- for i = 1, 3 do
	-- 	local name = string.format("map/zmwh_boss_bg%d.jpg", i)
	--     local sprite = cc.Sprite:create(name)
	--     sprite:setPosition(i*30, 300)
	--     self:addChild(sprite)
	-- end
 --    local time2 = socket.gettime()
 --    local sprite = cc.Sprite:create("login_newqj.png")
 --    self:addChild(sprite)
 --    local time3 = socket.gettime()
 --    local sprite = cc.Sprite:create("fairygui/page_main_atlas0.png")
 --    self:addChild(sprite)
 --    local time4 = socket.gettime()
	-- print( time3 - time2 )
	-- print( time4 - time3 )
	-- btn event, fairy has it's own EventDispatcher, cover the cocos's node
	local btn = view:getChild("btn_rank")
	btn:addEventListener(fairygui.UIEventType.TouchEnd, function(context)
		local input = context:getInput()
		local touchPos = input:getTouch():getLocation()
		print("touch ended")
		if btn:displayObject():hitTest(touchPos) then
			self.fairyRoot:release()
			-- XXX:场景切换的时候需要释放fairygui的静态数据，避免不必要的异常
			fairygui.HtmlObject:clearStaticPools()
			fairygui.DragDropManager:destroyInstance()
		else
			print("touch canceled")
		end
	end)

	-- local btnOpenWin = view:getChild("btnOpenWin")
	-- btnOpenWin:addEventListener(fairygui.UIEventType.TouchEnd, function(context)
	-- 	local input = context:getInput()
	-- 	local touchPos = input:getTouch():getLocation()
	-- 	if btnOpenWin:displayObject():hitTest(touchPos) then
	-- 		local window = fairygui.Window:create()
	-- 		window:addEventListener(fairygui.UIEventType.OnInit, function(context)
	-- 			print("Window OnInit")
	-- 		end)
	-- 		window:addEventListener(fairygui.UIEventType.OnShown, function(context)
	-- 			print("Window OnShown")
	-- 		end)
	-- 		window:addEventListener(fairygui.UIEventType.OnHide, function(context)
	-- 			print("Window OnHide")
	-- 		end)
	-- 		window:setContentPane(fairygui.UIPackage:createObject("package01", "window"))
	-- 		window:show()
	-- 	end
	-- end)

	-- -- displayObject is FUIInput, FUIInput is derive from Editbox
	-- local inputText = view:getChild("inputText"):displayObject()
	-- inputText:registerScriptEditBoxHandler(function(event, target)
 --        if event == "began" then
 --            -- 开始输入
 --            print("开始输入")
 --        elseif event == "changed" then
 --            -- 输入框内容发生变化
 --            print("输入框内容发生变化")
 --            local text = inputText:getText()
 --            print(text)
 --        elseif event == "ended" then
 --            -- 输入结束
 --            print("输入结束")
 --        elseif event == "return" then
 --            -- 从输入框返回
 --            print("从输入框返回")
 --        end
	-- end)

	-- -- button was created by <object src='ui://2enwy5c4lhol5' name='11' icon=''/>
	-- local richtext = view:getChild("richtext")
	-- local htmlObj = richtext:getControl("11")
	-- dump(htmlObj:getElementAttrs())
	-- local btnInRT = htmlObj:getUI()
	-- btnInRT:addEventListener(fairygui.UIEventType.TouchEnd, function(context)
	-- 	print("btnInRT clicked")
	-- end)
end

return TestCase
