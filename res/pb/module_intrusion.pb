
–
protocol/module_intrusion.protocc.qidea.wow.protocolprotocol/common.proto"Œ
IntrusionAward
awardId (	
awardStr (	M
	awardType (2:.cc.qidea.wow.protocol.IntrusionAward.INTRUSION_AWARD_TYPE
shared_user_name (	
shared_consortia_name (	
killed_user_name (	"5
INTRUSION_AWARD_TYPE

SHARE_TYPE
	KILL_TYPE"^
IntrusionOneFightResult
hurt (
baseIntrusionMoney (
addIntrusionMoney ("i
IntrusionFightEndRequest
bossHp (
userId (	
fightReportData (	
battleVerify (	"J
LuckyDrawIntrusionRequest
	rewardIds (
isSecretary (:false":
IntrusionFightStartRequest
type (
userId (	"5
IntrusionBossBox
boxType (
boxCount ("z
IntrusionOpenBossBoxRequest
boxType (
boxCount (8
bosList (2'.cc.qidea.wow.protocol.IntrusionBossBox"H
IntrusionTakeAwardRequest
awardId (	
isSecretary (:false"Ð
IntrusionQuickPassRequest
autoConsumeToken (
isAllOut (
fightReportData (	?
battleFormation (2&.cc.qidea.wow.protocol.BattleFormation
	autoShare (
isSecretary (:false"q
IntrusionQuickFightRequest
targetUserId (	
autoConsumeToken (
isAllOut (
	autoShare ("û
UserIntrusionResponse
bossId (
bossRefreshAt (
bossHp (

fightCount (
allHurt (
maxHurt (

rewardInfo (	
	boss_type (
allHurtRank	 (
maxHurtRank
 (
share (
userId (	
nickname (	
	teamLevel (
criticalHit (
historyMaxHurt (
allFightCount (
friend (

isFighting (
deltaBossHp (
fightingNickname (	
fightingUserId (	
energy_consume (
boss_summon_count ("“
SendIntrusionChangeResponseS
messageType (2>.cc.qidea.wow.protocol.SendIntrusionChangeResponse.MessageType
userId (	
bossHp (
bossId (
hurtHp (
fightingNickname (	
fightingUserId (	"-
MessageType
FIGHT_START
	FIGHT_END"[
IntrusionOpenBossBoxResponse;
	luckyDraw (2(.cc.qidea.wow.protocol.LuckyDrawResponse"]
IntrusionOpenBossBoxesResponse;
	luckyDraw (2(.cc.qidea.wow.protocol.LuckyDrawResponse"0
IntrusionQuickPassResponse

fightCount ("v
IntrusionQuickFightResponse

fightCount (C
fightResult (2..cc.qidea.wow.protocol.IntrusionOneFightResult"
IntrusionTakeAwardResponse" 
SendIntrusionAwardMarkResponse"=
IntrusionFightStartResponse
userId (	
bossHp (B'
cc.qidea.wow.protocolBIntrusionProto