local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

local QUIViewController = import("..ui.QUIViewController")

function MainScene:ctor()
	-- self:showScrollView()
	self:showPageMainUI()
end

function MainScene:showScrollView()
	local tests = {
		"Test_NodeFrameEvent",
		"Test_NodeEvent",
		"Test_KeypadEvent",
		"Test_NodeTouchEvent",
		"Test_AccelerometerEvent",
		"Test_CocosStudio",
		"Test_Audio",
		"Test_FairyGUI",
		"Test_Network",
		"Test_WebSocket",
		"Test_LuaProtobuf",
		"Test_Spine",
		"Test_RichText",
		"Test_TMXTiledMap",
		"Test_AsyncTCP",
	}

	local scrollView = ccui.ScrollView:create()
	scrollView:addTo(self)
	scrollView:align(display.TOP_CENTER, display.cx, display.top)
	self.scrollView = scrollView

	local total = 0
	local btnSize = nil
	for i = #tests, 1, -1 do
		local btn = ccui.Button:create()
		btn:setTitleText(tests[i])
		btn:setTitleFontSize(24)
		btn:addTouchEventListener(function(sender, eventType)
			if 2 == eventType then
				scrollView:setVisible(false)
    			app:getNavigationManager():pushViewController(app.mainUILayer, {uiType=QUIViewController.TYPE_PAGE, uiClass="QUIPageMainMenu"})
			end
		end)
		if not btnSize then
			btnSize = btn:getContentSize()
		end
		btn:pos((display.width - btnSize.width) / 2 + btnSize.width / 2,
				btnSize.height * total + btnSize.height / 2)
		total = total + 1

		scrollView:addChild(btn)
	end

	local totalHeight = btnSize.height * total
	scrollView:setInnerContainerSize(cc.size(display.width, totalHeight))
	local scrollHeight = display.height
	if totalHeight < scrollHeight then
		scrollHeight = totalHeight
	end
	scrollView:setContentSize(cc.size(display.width, scrollHeight))
end

function MainScene:showPageMainUI()
	self:schedule(function()
    	app:getNavigationManager():pushViewController(app.mainUILayer, {uiType=QUIViewController.TYPE_PAGE, uiClass="QUIPageMainMenu"})
	end, 0)
end

function MainScene:openScrollView()
	self.scrollView:setVisible(true)
end

function MainScene:onEnter()
	print("MainScene onEnter")
end

function MainScene:onExit()
	print("MainScene onExit")
end

return MainScene
