local QUIWidget = import(".QUIWidget")
local QUIWidgetHeroOverview = class("QUIWidgetHeroOverview", QUIWidget)

local QUIWidgetGradeStar = import(".QUIWidgetGradeStar")
local QUIWidgetStoneIcon = import(".QUIWidgetStoneIcon")
local QUIWidgetPartIcon = import(".QUIWidgetPartIcon")

function QUIWidgetHeroOverview:ctor(options)
    local fguiFile = "widgets"
    local resName = "widget_hero_overview"
    local callbacks = {
    }
    QUIWidgetHeroOverview.super.ctor(self, fguiFile, resName, callbacks, options)

    self:extendEvent()

    self._equipWidget = {}
    self._stoneWidget = {}
end

function QUIWidgetHeroOverview:setInfo(info)
    self._fguiOwner.tf_name:setText(info.name)
    self._fguiOwner.tf_force:setText(info.force)
    self._fguiOwner.tf_level:setText(info.level)

    q.setAptitudeShow(self._fguiOwner, nil, info.aptitude)
    q.setProfessionalShow(self._fguiOwner, info.func_icon)

	if info.visitingCard then
   		self._fguiOwner.node_card:setURL(info.visitingCard)
	end

    --grade
	if not self._gradeWidget then
		self._gradeWidget =	QUIWidgetGradeStar.new()
   		self._fguiOwner.node_grade_star:addChild(self._gradeWidget:getView())
	end
	self._gradeWidget:setInfo(info.grade)

    -- mount
    local mountInfo = {
        
    }
    if not self._mountWidget then
        self._mountWidget = QUIWidgetPartIcon.new()
        self._fguiOwner.node_mount:addChild(self._mountWidget:getView())
    end
    self._mountWidget:setInfo(mountInfo)

    -- soulSpirit
    local soulSpiritInfo = {
        
    }
    if not self._soulSpiritWidget then
        self._soulSpiritWidget = QUIWidgetPartIcon.new()
        self._fguiOwner.node_soul_spirit:addChild(self._soulSpiritWidget:getView())
    end
    self._soulSpiritWidget:setInfo(soulSpiritInfo)

    -- artifact
    local artifactInfo = {
        
    }
    if not self._artifactWidget then
        self._artifactWidget = QUIWidgetPartIcon.new()
        self._fguiOwner.node_artifact:addChild(self._artifactWidget:getView())
    end
    self._artifactWidget:setInfo(artifactInfo)

    -- equipment
    for i = 1, 6 do
        self._equipWidget[i] = QUIWidgetPartIcon.new()
        self._equipWidget[i]:getView():setX((i-1)*30)
        self._fguiOwner.node_equip:addChild(self._equipWidget[i]:getView())
    end
    -- stone
    for i = 1, 6 do
        self._stoneWidget[i] = QUIWidgetStoneIcon.new()
        self._stoneWidget[i]:getView():setX((i-1)*30)
        self._fguiOwner.node_stone:addChild(self._stoneWidget[i]:getView())
    end
end

return QUIWidgetHeroOverview