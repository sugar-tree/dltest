
Þ
protocol/module_fightclub.protocc.qidea.wow.protocolprotocol/common.proto"1
FightClubGetMainInfoRequest

isMainInfo ("K
FightClubUserReplayData
userId (	
wave (

replayData (	"T
FightClubQuickFightEndInfo
myUserId (	
rivalUserId (	
success ("‘
FightClubUserInfo
userId (	
seasonNo (
seasonStartAt (
winCount (
floor (
envRank (

failUserId (	
rank (
roomRank	 (
dailyChangeCount
 (
roomPersonNum (
oldWinCount (
oldFailUserName (	"{
FightClubBattleArmy?
battleFormation (2&.cc.qidea.wow.protocol.BattleFormation
	armyForce (
pvpForce ("é
FightClubReward
rewardId (
rewards (	
oldFloor (
floor (
oldRoomRank (
roomRank (

oldEnvRank (
envRank (
winCount	 (
newWinCount
 (
type (
	upRewards (	"ó
FightClubBattleReport
reportId (0
fighter1 (2.cc.qidea.wow.protocol.Fighter0
fighter2 (2.cc.qidea.wow.protocol.Fighter
success (
fightAt (
fightersData (	
fighterReportData (	
	scoreInfo (	"
FightClubQuickFightInfo
userId (	
lastPassWave (/
fighter (2.cc.qidea.wow.protocol.Fighter
floor ("1
FightClubFightStartRequest
rivalUserId (	"H
FightClubFightEndRequest
rivalUserId (	
fightReportData (	"2
FightClubFightGetRewardRequest
rewardId ("ò
FightClubQuickFightEndRequest
rivalUserId (	
fightReportData (	
wave (
isQuick (>
myData (2..cc.qidea.wow.protocol.FightClubUserReplayDataD
userDataList (2..cc.qidea.wow.protocol.FightClubUserReplayData"
FightClubQuickFightRequest".
FightClubQueryFighterRequest
userId (	"¥
FightClubResponse:
userInfo (2(.cc.qidea.wow.protocol.FightClubUserInfo>

battleArmy (2*.cc.qidea.wow.protocol.FightClubBattleArmy7
rewards (2&.cc.qidea.wow.protocol.FightClubReward
	scoreList (
success (=
reports (2,.cc.qidea.wow.protocol.FightClubBattleReport4
rivalFighter (2.cc.qidea.wow.protocol.Fighter
lastQuickFightAt (O
fightClubQuickFightInfo	 (2..cc.qidea.wow.protocol.FightClubQuickFightInfo
seasonNO
 (
seasonStartAt (
fightReportId (
awardStr (	<
seasonReward (2&.cc.qidea.wow.protocol.FightClubRewardG
fightEndInfo (21.cc.qidea.wow.protocol.FightClubQuickFightEndInfoB'
cc.qidea.wow.protocolBFightClubProto