
®0
 protocol/module_silvermine.protocc.qidea.wow.protocolprotocol/common.proto"‚
PbUserSilverMine

fightCount (
buyFightCount (;
defenseArmy (2&.cc.qidea.wow.protocol.BattleFormation
miningLv (
	miningExp (
totalOccupySecs (
assistCount (
miningPickBuyCount (
miningPickEndAt	 ("á
PbSilverMineOccupy
mineId (
occupyId (	
startAt (
endAt (
occupyAward (	
miningAward (	
extendCount (
ownerId (	
	ownerName	 (	
consortiaId
 (	
consortiaName (	
defenseForce (
defenseWinCount (
inviteAssistUserId (	=
assistUserInfo (2%.cc.qidea.wow.protocol.AssistUserInfo
oriOccupyId (	
inviteAssistCount (
miningPickEndAt (
exOccupyAward (	
pvpForce ("2
AssistUserInfo
userId (	
nickname (	"þ
PbSilverMineOccupyAward
mineId (
occupyId (	
	occupySec (
occupyEndType (
defenseWinCount (
occupyAward (	
miningAward (	
attackerName (	
getAward	 (
exOccupyAward
 (	
fightReportId (	"
PbSilverMineMiningEvent
mineId (
occupyId (	
miningActorId (
	miningSec (
miningAward (	
eventId (
miningAt ("„
PbSilverMineCave
	mineCount (;
occupies (2).cc.qidea.wow.protocol.PbSilverMineOccupy
caveId (
isInvite ("M
PbFightLock

lockUserId (	
lockUserName (	
lockRestSecs ("Æ
SilverMineRank
rank (
userId (	
name (	
avatar (
level (
vip (
miningLevel (
	miningExp (!
nightmareDungeonPassCount	 (
	soulTrial
 ("
SilverMineGetMyInfoRequest"2
SilverMineGetCaveListRequest

mineRegion (".
SilverMineGetCaveInfoRequest
caveId (" 
SilverMineBuyFightCountRequest"2
 SilverMineFightStartCheckRequest
mineId ("B
SilverMineFightStartRequest
mineId (
mineOwnerId (	"
SilverMineFightEndRequest
mineId (
mineOwnerId (	
fightReportData (	
battleVerify (	
isWin (
isQuick ("3
!SilverMineExtendOccupyTimeRequest
mineId ("G
#SilverMineGetMiningEventListRequest
mineId (
occupyId (	"&
$SilverMineShowOccupyAwardListRequest"4
SilverMineGetOccupyAwardRequest
	occupyIds (	"!
SilverMineSetDefenseArmyRequest"2
 SilverMineShowDefenseArmyRequest
mineId (" 
SilverMineQuickFindMineRequest"µ
SilverMineBattleHistory
fightReportId (0
fighter1 (2.cc.qidea.wow.protocol.Fighter0
fighter2 (2.cc.qidea.wow.protocol.Fighter
success (
mineId ("I
#SilverMineGetFightReportListRequest
ifSelf (

mineRegion ("A
(SilverMineFightReportQueryFighterRequest
fighterUserId (	"3
!SilverMineFinishMineOccupyRequest
mineId ("4
"SilverMineGetMineOccupyInfoRequest
mineId ("/
SilverMineInviteAssistRequest
userId (	">
SilverMineAssistRequest
oriOccupyId (	
userId (	"D
SilverMineToAssistCaveRequest
userId (	
oriOccupyId (	"Æ
SilverMineGetMyInfoResponse=
mySilverMine (2'.cc.qidea.wow.protocol.PbUserSilverMine;
myOccupy (2).cc.qidea.wow.protocol.PbSilverMineOccupy

awardCount (
inviteAssistNum ("[
SilverMineGetCaveListResponse:
	mineCaves (2'.cc.qidea.wow.protocol.PbSilverMineCave"Z
SilverMineGetCaveInfoResponse9
mineCave (2'.cc.qidea.wow.protocol.PbSilverMineCave"`
SilverMineBuyFightCountResponse=
mySilverMine (2'.cc.qidea.wow.protocol.PbUserSilverMine"Z
!SilverMineFightStartCheckResponse5
	fightLock (2".cc.qidea.wow.protocol.PbFightLock"†
SilverMineFightStartResponse/
fighter (2.cc.qidea.wow.protocol.Fighter5
	fightLock (2".cc.qidea.wow.protocol.PbFightLock"÷
SilverMineFightEndResponse5
	fightLock (2".cc.qidea.wow.protocol.PbFightLock=
mySilverMine (2'.cc.qidea.wow.protocol.PbUserSilverMine;
myOccupy (2).cc.qidea.wow.protocol.PbSilverMineOccupy
fightReportId (
success ("a
"SilverMineExtendOccupyTimeResponse;
myOccupy (2).cc.qidea.wow.protocol.PbSilverMineOccupy"l
$SilverMineGetMiningEventListResponseD
miningEvents (2..cc.qidea.wow.protocol.PbSilverMineMiningEvent"g
%SilverMineShowOccupyAwardListResponse>
awards (2..cc.qidea.wow.protocol.PbSilverMineOccupyAward"u
 SilverMineGetOccupyAwardResponse=
mySilverMine (2'.cc.qidea.wow.protocol.PbUserSilverMine

awardCount ("a
 SilverMineSetDefenseArmyResponse=
mySilverMine (2'.cc.qidea.wow.protocol.PbUserSilverMine"U
!SilverMineShowDefenseArmyResponse0
defender (2.cc.qidea.wow.protocol.Fighter"A
SilverMineQuickFindMineResponse
mineId (
caveId ("g
$SilverMineGetFightReportListResponse?
reports (2..cc.qidea.wow.protocol.SilverMineBattleHistory"\
)SilverMineFightReportQueryFighterResponse/
fighter (2.cc.qidea.wow.protocol.Fighter"…
SilverMineRankResponse4
ranks (2%.cc.qidea.wow.protocol.SilverMineRank5
myrank (2%.cc.qidea.wow.protocol.SilverMineRank"$
"SilverMineFinishMineOccupyResponse"Ã
SilverMineEventPushResponseO
	eventType (2<.cc.qidea.wow.protocol.SilverMineEventPushResponse.EventType

eventValue ("?
	EventType
SILVERMINE_GRABBED
SILVERMINE_AUTO_OCCUPY"
#SilverMineGetMineOccupyInfoResponse;

silverMine (2'.cc.qidea.wow.protocol.PbUserSilverMine9
occupy (2).cc.qidea.wow.protocol.PbSilverMineOccupy"^
SilverMineGetInviteListResponse;
consortiaMemberList (2.cc.qidea.wow.protocol.Fighter"]
SilverMineInviteAssistResponse;
myOccupy (2).cc.qidea.wow.protocol.PbSilverMineOccupy"k
SilverMineAssistResponse?
targetOccupy (2).cc.qidea.wow.protocol.PbSilverMineOccupy
caveId ("t
SilverMineOneKeyAssistResponseR
silverMineAssistResponses (2/.cc.qidea.wow.protocol.SilverMineAssistResponse"\
SilverMineToAssistCaveResponse:
	mineCaves (2'.cc.qidea.wow.protocol.PbSilverMineCave"
SilverMineBuyMiningPickResponse=
mySilverMine (2'.cc.qidea.wow.protocol.PbUserSilverMine;
myOccupy (2).cc.qidea.wow.protocol.PbSilverMineOccupyB(
cc.qidea.wow.protocolBSilverMineProto