
ì5
"protocol/module_silves_arena.protocc.qidea.wow.protocolprotocol/common.proto"7
SilvesArenaGameAreaListInfo
gameAreaNameList (	"7
SilvesArenaBattleOrder
userId (	
order (";
SilvesArenaFightInfoDetail
index (
isDone ("U
SilvesArenaSeasonInfo
seasonNo (
seasonStartAt (
seasonEndAt ("ž
SilvesArenaUserInfo
getFightCountReward (
todayFightCount (
todayFightAt (
myApplyIdList (	
zoneNo (
refreshCount ("²
SilvesArenaTeamInfo
teamId (	
teamName (	
	memberCnt (.
leader (2.cc.qidea.wow.protocol.Fighter/
member1 (2.cc.qidea.wow.protocol.Fighter/
member2 (2.cc.qidea.wow.protocol.Fighter
status (
teamMinForce (
	teamScore	 (
symbol
 (
teamRank (
averageForce (
totalFightCount (
shareAt (
createAt (
todayFightCount (

totalForce (
position (
	currRound (
peakWinCount (
isThirdRound (
	isSuccess (
memberChangeAt ("Û
SilvesArenaFightInfo

matchingId (	
teamId (	7
attackFightInfo (2.cc.qidea.wow.protocol.Fighter8
defenseFightInfo (2.cc.qidea.wow.protocol.Fighter
endInfo (
	watchInfo (
	scoreList (
reportIdList (
	team1Name	 (	
	team2Name
 (	

team1Score (

team2Score (
	skipWatch ("U
SilvesArenaGetOnlineUserInfo5
onlineFighter (2.cc.qidea.wow.protocol.Fighter"L
SilvesArenaApplyInfo4
applyFighter (2.cc.qidea.wow.protocol.Fighter"Ð
SilvesArenaBattleHistory

matchingId (	
team1Id (	
	team1Name (	8
team1fighterList (2.cc.qidea.wow.protocol.Fighter
team1AddScore (
team2Id (	
	team2Name (	8
team2fighterList (2.cc.qidea.wow.protocol.Fighter
team2AddScore	 (
success
 (
reportIdList (
fightAt (";
SilvesArenaStatsInfo
reportId (
	statsData (	"Ì
SilvesArenaBattleReport
reportId (0
fighter1 (2.cc.qidea.wow.protocol.Fighter0
fighter2 (2.cc.qidea.wow.protocol.Fighter
success	 (
fightAt (
fightersData (	
fighterReportData (	B
statsDataList (2+.cc.qidea.wow.protocol.SilvesArenaStatsInfo
	team1Name (	
	team2Name (	"Q
SilvesArenaTodayTeamBattleInfo
userId (	
success (
leader ("R
SilvesPeakScoreDetailInfo
scoreId (
totalNum (

totalMoney ("å
SilvesPeakUserBetInfo

matchingId (	9
team1 (2*.cc.qidea.wow.protocol.SilvesArenaTeamInfo9
team2 (2*.cc.qidea.wow.protocol.SilvesArenaTeamInfo
scoreId (
	currRound (
isThirdRound (J
scoreDetailInfos (20.cc.qidea.wow.protocol.SilvesPeakScoreDetailInfo

myBetAward (
	myScoreId	 (
myCanGetAward
 ("B
SilvesArenaCreateTeamRequest
teamName (	
minForce (",
SilvesArenaJoinTeamRequest
teamId (	"?
SilvesArenaApplyTeamRequest
teamId (	
isCancel ("F
SilvesArenaPromissTeamRequest
applyUserId (	
isCancel (",
SilvesArenaQuitTeamRequest
teamId (	"E
SilvesArenaInviteRequest
consortiaMemberId (	
teamId (	"X
SilvesArenaChatRequest-
type (2.cc.qidea.wow.protocol.ChatType
content (	"8
&SilvesArenaAcceptInviteJoinTeamRequest
teamId (	"k
%SilvesArenaChangeBattleUserPosRequestB
battleOrder (2-.cc.qidea.wow.protocol.SilvesArenaBattleOrder"5
SilvesArenaKickOffTeamRequest
teamMemberId (	"•
#SilvesArenaGenerateFightInfoRequest
rivalTeamId (	F
battleOrderList (2-.cc.qidea.wow.protocol.SilvesArenaBattleOrder
	skipWatch ("7
SilvesArenaGetTeamRewardRequest
rewardIdList ("0
SilvesArenaInviteRejectRequest
userId (	"c
"SilvesArenaWatchFightReportRequest
fightReportId (
isFightEndWatch (
index ("W
SilvesArenaFightStartRequest
team1UserId (	
team2UserId (	
index ("d
SilvesArenaFightEndRequest
team1UserId (	
team2UserId (	
index (
isWin ("F
"SilvesArenaQueryTeamFighterRequest
team1Id (	
team2Id (	"-
SilvesArenaTeamHistoryRequest
type ("S
%SilvesArenaBattleHistoryDetailRequest
fightReportIds (

matchingId (	"<
#SilvesArenaQueryFightersDataRequest
fightReportId ("N
SilvesArenaGetChatListRequest-
type (2.cc.qidea.wow.protocol.ChatType"4
SilvesArenaGetFighterRequest
targetUserId (	"W
SilvesArenaTeamInfoList<
teamInfo (2*.cc.qidea.wow.protocol.SilvesArenaTeamInfo"<
SilvesPeakBetInfoRequest
team1Id (	
team2Id (	"[
SilvesPeakBetRequest
team1Id (	
team2Id (	
betAward (
scoreId ("-
SilvesModifyArmyRequest

replayData (	"
SilvesPeakGetMyBetInfoRequest"B
SilvesPeakGetBattleInfoRequest
team1Id (	
team2Id (	",
SilvesGetTargetTeamRequest
teamId ("•

SilvesArenaInfoResponse@

seasonInfo (2,.cc.qidea.wow.protocol.SilvesArenaSeasonInfo<
userInfo (2*.cc.qidea.wow.protocol.SilvesArenaUserInfo>

myTeamInfo (2*.cc.qidea.wow.protocol.SilvesArenaTeamInfoD
teamInfoList (2..cc.qidea.wow.protocol.SilvesArenaTeamInfoList>
	fightInfo (2+.cc.qidea.wow.protocol.SilvesArenaFightInfoK
onlineUserInfo (23.cc.qidea.wow.protocol.SilvesArenaGetOnlineUserInfo>
	applyInfo (2+.cc.qidea.wow.protocol.SilvesArenaApplyInfoJ
battleHistoryList	 (2/.cc.qidea.wow.protocol.SilvesArenaBattleHistoryD
battleReport
 (2..cc.qidea.wow.protocol.SilvesArenaBattleReportH
gameArenList (22.cc.qidea.wow.protocol.SilvesArenaGameAreaListInfo@
rankInfo (2..cc.qidea.wow.protocol.SilvesArenaRankResponse
chatInfoList (	
totalSilvesArenaMoney (
fightEndAddScore (/
fighter (2.cc.qidea.wow.protocol.Fighter<

battleArmy (2(.cc.qidea.wow.protocol.DefenseBattleArmy
	haveApply (

myTeamRank (A
peakTeamInfos (2*.cc.qidea.wow.protocol.SilvesArenaTeamInfo

replayData (	
betWinCount (K
silvesPeakUserBetInfo (2,.cc.qidea.wow.protocol.SilvesPeakUserBetInfo
isTop16 (D
championTeamInfo (2*.cc.qidea.wow.protocol.SilvesArenaTeamInfo
hasTop16Data ("
SilvesArenaFightEndResponse"›
SilvesArenaRankResponse@
teamRankInfo (2*.cc.qidea.wow.protocol.SilvesArenaTeamInfo>

myRankInfo (2*.cc.qidea.wow.protocol.SilvesArenaTeamInfo"|
&SilvesArenaTodayTeamBattleInfoResponseR
todayTeamBattleInfo (25.cc.qidea.wow.protocol.SilvesArenaTodayTeamBattleInfo"x
SilvesArenaSendInviteResponse
userId (	
nickname (	
	teamLevel (

fightForce (
teamId (	"b
 SilvesArenaGetTargetTeamResponse>

myRankInfo (2*.cc.qidea.wow.protocol.SilvesArenaTeamInfo*Z
ChatType
SILVERS_ARENA_GLOBAL
SILVERS_ARENA_TEAM_SHARE
SILVERS_ARENA_TEAMB)
cc.qidea.wow.protocolBSilvesArenaProto