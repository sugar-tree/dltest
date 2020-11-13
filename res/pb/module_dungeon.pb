
Ó
protocol/module_dungeon.protocc.qidea.wow.protocolprotocol/common.proto"ã
DungeonWaveReward
	dungeonId (/
	awardList (2.cc.qidea.wow.protocol.Award2
expAwardList (2.cc.qidea.wow.protocol.Award"_
MapStar
mapId (
isDraw1 (
isDraw2 (
isDraw3 (

easterEggs ("b
MonsterStatus

monster_id (:0
	showed_at (:1
died_at (:2
index (:3"~
WelfareDungeonInfo
	passCount (
passProgress (
specialPassInfo (	
bossBoxInfo (	
	failCount ("A
NightmareDungeonBestPassForce
	dungeonId (
force ("F
NightmareDungeonChapterInfo
	chapterId (
passProgress ("3
LuckyDrawMapRequest
index (
mapId ("&
FightStartRequest
	dungeonId ("◊
FightSuccessRequest
start_at (:0
end_at (:0

dungeon_id (:0
star (:03
damage (2#.cc.qidea.wow.protocol.VerifyDamage6
monsters (2$.cc.qidea.wow.protocol.MonsterStatus
starPos (	
battleVerify (	
fightReportData	 (	
fightersData
 (	
killEnemyCount (
bossMinimumHp ("%
FightFailRequest
	dungeonId ("X
FightQuickRequest
	dungeonId (
count (
itemId (
	itemCount ("[
 FightActivityDungeonQuickRequest
	dungeonId (
count (
autoUseEnergy ("&
DungeonBuyCountRequest
type ("-
FightDungeonResetRequest
	dungeonId ("Ω
DungeonQuickPassRequest
	dungeonId (
itemId (
	itemCount (
ifIntrusionStop (
ifConsumeEnergyToken (
dungeonResetCount (
isSecretary (:false"-
ApiDungeonBossBoxRequest
	dungeonId ("-
WelfareFightStartRequest
	dungeonId ("q
WelfareFightSuccessRequest
start_at (:0
end_at (:0

dungeon_id (:0
battleVerify (	"=
WelfareQuickFightRequest

dungeon_id (
count (".
OpenWelfareBossBoxRequest
	dungeonId ("/
NightmareFightStartRequest
	dungeonId ("\
NightmareFightEndRequest
	dungeonId (
battleVerify (	
fightReportData (	"0
NightmarePassHistoryRequest
	dungeonId ("5
 NightmareGetBestPassForceRequest
	chapterId ("=
DungeonGetPassAwardsRequest
awardId (
index ("F
 DungeonGetEasterEggRewardRequest
mapId (
easterEggId ("ö
DungeonQuickPassResponseC
dungeonWaveReward (2(.cc.qidea.wow.protocol.DungeonWaveReward

resetCount (
tokenConsume (
stopFor ("X
ApiDungeonBossBoxResponse;
	luckyDraw (2(.cc.qidea.wow.protocol.LuckyDrawResponse"ô
 NightmareDungeonFightEndResponse6
dungeonPassAward (2.cc.qidea.wow.protocol.Award2
bossBoxAward (2.cc.qidea.wow.protocol.Award0

finalAward (2.cc.qidea.wow.protocol.AwardW
nightmareDungeonChapterInfo (22.cc.qidea.wow.protocol.NightmareDungeonChapterInfo"ù
#NightmareDungeonPassHistoryResponse8
bestPassUserInfo (2.cc.qidea.wow.protocol.Fighter<
earliestPassUserInfo (2.cc.qidea.wow.protocol.Fighter"|
/NightmareDungeonGetChapterBestPassForceResponseI
dungeonInfo (24.cc.qidea.wow.protocol.NightmareDungeonBestPassForceB%
cc.qidea.wow.protocolBDungeonProto