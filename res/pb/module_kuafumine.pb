
Õ
protocol/module_kuafumine.protocc.qidea.wow.protocolprotocol/common.proto"Ž
PbUserKuafuMine
	occupyCnt (
buyOccupyCnt (
lootCnt (

buyLootCnt (
lootRandomAward (	
myScoreAwards (
consortiaScoreAwards (
myScore (

myMaxScore	 (
consortiaScore
 (
consortiaMaxScore (
myMineId (
myRank (
consortiaRank (;
defenseArmy (2&.cc.qidea.wow.protocol.BattleFormation
	maxMineId ("Ù
PbKuafuMineOccupy
mineId (
occupyScore (
	lootedCnt (
ownerId (	
	ownerName (	
consortiaId (	
consortiaName (	
defenseForce	 (
gameAreaName
 (	
pvpForce ("]
PbKuafuMineCave
caveId (:
occupies (2(.cc.qidea.wow.protocol.PbKuafuMineOccupy"Û
KuafuMineBattleHistory
fightReportId (0
fighter1 (2.cc.qidea.wow.protocol.Fighter0
fighter2 (2.cc.qidea.wow.protocol.Fighter
success (
mineId (

reportType (
	lootScore ("²
KuafuMineBattleInfo
mineId (
fightAt (
fighter1Name (	
fighter1GameAreaName (	
fighter1Force (
fighter2Name (	
fighter2GameAreaName (	
fighter2Force	 (
success
 (
type (
	lootScore (
fighter1PvpForce (
fighter2PvpForce ("
KuafuMineGetMyInfoRequest"
KuafuMineBuyOccupyCntRequest"
KuafuMineBuyLootCntRequest"$
"KuafuMineGetLootRandomAwardRequest"4
KuafuMineGetMyScoreAwardRequest
	rewardIds (";
&KuafuMineGetConsortiaScoreAwardRequest
	rewardIds ("1
KuafuMineGetCaveListRequest

mineRegion ("-
KuafuMineGetCaveInfoRequest
caveId ("1
KuafuMineGetUserCaveInfoRequest
userId (	"1
KuafuMineGetLastCaveInfoRequest
mineId ("”
KuafuMineOccupyFightEndRequest
mineId (
mineOwnerId (	
fightReportData (	
battleVerify (	
isWin (
isQuick ("E
KuafuMineLootFightStartRequest
mineId (
mineOwnerId (	"’
KuafuMineLootFightEndRequest
mineId (
mineOwnerId (	
fightReportData (	
battleVerify (	
isWin (
isQuick ("$
"KuafuMineGetFightReportListRequest"(
&KuafuMineGetMineFightReportListRequest".
KuafuMineQueryFighterRequest
userId (	"
KuafuMineGetMyInfoResponse6
myInfo (2&.cc.qidea.wow.protocol.PbUserKuafuMine:
myOccupy (2(.cc.qidea.wow.protocol.PbKuafuMineOccupy"H
KuafuMineBuyOccupyCntResponse
buyOccupyCnt (
	occupyCnt ("B
KuafuMineBuyLootCntResponse

buyLootCnt (
lootCnt ("j
#KuafuMineGetLootRandomAwardResponseC
luckyDrawResponse (2(.cc.qidea.wow.protocol.LuckyDrawResponse"Z
 KuafuMineGetMyScoreAwardResponse6
myInfo (2&.cc.qidea.wow.protocol.PbUserKuafuMine"a
'KuafuMineGetConsortiaScoreAwardResponse6
myInfo (2&.cc.qidea.wow.protocol.PbUserKuafuMine"Y
KuafuMineGetCaveListResponse9
	mineCaves (2&.cc.qidea.wow.protocol.PbKuafuMineCave"X
KuafuMineGetCaveInfoResponse8
mineCave (2&.cc.qidea.wow.protocol.PbKuafuMineCave"·
KuafuMineOccupyFightEndResponse6
myInfo (2&.cc.qidea.wow.protocol.PbUserKuafuMine4
cave (2&.cc.qidea.wow.protocol.PbKuafuMineCave
fightReportId (
success ("È
KuafuMineLootFightEndResponse6
myInfo (2&.cc.qidea.wow.protocol.PbUserKuafuMine4
cave (2&.cc.qidea.wow.protocol.PbKuafuMineCave
fightReportId (
success (
	lootScore ("e
#KuafuMineGetFightReportListResponse>
reports (2-.cc.qidea.wow.protocol.KuafuMineBattleHistory"f
'KuafuMineGetMineFightReportListResponse;
reports (2*.cc.qidea.wow.protocol.KuafuMineBattleInfo"]
#KuafuMineChangeDefenseHerosResponse6
myInfo (2&.cc.qidea.wow.protocol.PbUserKuafuMine"P
KuafuMineQueryFighterResponse/
fighter (2.cc.qidea.wow.protocol.Fighter"\
%KuafuMineGetMineScoreRankInfoResponse3
	consortia (2 .cc.qidea.wow.protocol.Consortia"4
"KuafuMineQuickFindLootMineResponse
mineId ("3
ScoreChangeInfo
	timeStamp (
score (B'
cc.qidea.wow.protocolBKuafuMineProto