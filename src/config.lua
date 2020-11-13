-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 1

-- display FPS stats on screen
DEBUG_FPS = true

-- dump memory info every 10 seconds
DEBUG_MEM = false

-- design resolution
CONFIG_SCREEN_WIDTH  = 1136
CONFIG_SCREEN_HEIGHT = 640

GAME_VERSION = "1.0.1"

-- auto scale mode
-- CONFIG_SCREEN_AUTOSCALE = "FIXED_WIDTH"

DUMP_LISTENER_ITEM_PRIORITY_INFO = 0

--魂师职业类型
HERO_TALENT = {
    TANK = 1, --防御
    DPS_PHYSISC = 2, --物理攻击
    DPS_MAGIC = 3, --法术攻击
    HEALTH = 4, --治疗
}

HERO_TALENT_CONFIG = {
    {telent = HERO_TALENT.TANK, func_icon = "t", fgui = "node_professional_t"},
    {telent = HERO_TALENT.DPS_PHYSISC, func_icon = "dps_p", fgui = "node_professional_dps_p"},
    {telent = HERO_TALENT.DPS_MAGIC, func_icon = "dps_m", fgui = "node_professional_dps_m"},
    {telent = HERO_TALENT.HEALTH, func_icon = "health", fgui = "node_professional_health"},
}

--魂师品质
APTITUDE = {
    SSS = 24,    --SSS
    SSP = 23,    --SS+
    SS  = 22,    --SS
    SP  = 21,    --S+
    S   = 20,
    AP  = 18,    --A+
    A   = 15,
    B   = 12,
    C   = 10,
}

ITEM_QUALITY_INDEX = {}

HERO_SABC = {
    {aptitude = APTITUDE.SSS, qc = "SSS", lower = "sss", fgui = "node_aptitude_sss", color = "pink", colour = ITEM_QUALITY_INDEX.PINK, lowerColor = "h", breakLevel = 28},
    {aptitude = APTITUDE.SSP, qc = "SSP", lower = "ssp", fgui = "node_aptitude_ssp", color = "pink", colour = ITEM_QUALITY_INDEX.PINK, lowerColor = "h", breakLevel = 28},
    {aptitude = APTITUDE.SS, qc = "SS", lower = "ss", fgui = "node_aptitude_ss", color = "yellow", colour = ITEM_QUALITY_INDEX.YELLOW, lowerColor = "y", breakLevel = 22},
    {aptitude = APTITUDE.SP, qc = "S+", lower = "s+", fgui = "node_aptitude_sp", color = "red", colour = ITEM_QUALITY_INDEX.RED, lowerColor = "r", breakLevel = 17},
    {aptitude = APTITUDE.S, qc = "S", lower = "s", fgui = "node_aptitude_s", color = "orange", colour = ITEM_QUALITY_INDEX.ORANGE, lowerColor = "o", breakLevel = 12},
    {aptitude = APTITUDE.AP, qc = "A+", lower = "a+", fgui = "node_aptitude_ap", color = "purple", colour = ITEM_QUALITY_INDEX.PURPLE, lowerColor = "p", breakLevel = 7},
    {aptitude = APTITUDE.A, qc = "A", lower = "a", fgui = "node_aptitude_a", color = "purple", colour = ITEM_QUALITY_INDEX.PURPLE, lowerColor = "p", breakLevel = 7},
    {aptitude = APTITUDE.B, qc = "B", lower = "b", fgui = "node_aptitude_b", color = "blue", colour = ITEM_QUALITY_INDEX.BLUE, lowerColor = "b", breakLevel = 2},
    {aptitude = APTITUDE.C, qc = "C", lower = "c", fgui = "node_aptitude_c", color = "green", colour = ITEM_QUALITY_INDEX.GREEN, lowerColor = "g", breakLevel = 0},
}

--装备类型
EQUIPMENT_TYPE = {
    WEAPON = "weapon",
    BRACELET = "bracelet",
    CLOTHES = "clothes",
    SHOES = "shoes",
    JEWELRY1 = "jewelry1",
    JEWELRY2 = "jewelry2",
}