
‹;
protocol/module_blackrock.protocc.qidea.wow.protocolprotocol/common.proto"∂
BlackRockUserInfo

todayScore (

awardCount (
buyAwardCount (
refreshRivalsCount (

totalScore (
todayScoreRank (
lastShareAt (
todayHelpPassCount (
totalHelpPassCount	 (
topChapterId
 (
todayTopPerfectPassBoss (	
isPlayComeBack ("¿
BlackRockTeamAwardInfo
awardId (	
	chapterId (
happenAt (
awards (	
starNum (
getAward (

awardScore (
	giveAward (
isPlayComeBack	 ("Å
BlackRockTeam
teamId (	
	chapterId (.
leader (2.cc.qidea.wow.protocol.Fighter/
member1 (2.cc.qidea.wow.protocol.Fighter/
member2 (2.cc.qidea.wow.protocol.FighterB
teamProgress (2,.cc.qidea.wow.protocol.BlackRockTeamProgress
	memberCnt (
isOpen (
symbol	 (
password
 (	
isPlayComeBack (
leaderLastActiveAt ("ﬂ
BlackRockTeamProgress
isFight (
fightStartAt (
isEnd (
starCnt (C
allProgress (2..cc.qidea.wow.protocol.BlackRockMemberProgress

progressId (	
	createdAt (
canEatBuffs ("‘
BlackRockMemberProgress
memberId (	
	memberPos (
isEnd (
isWin (;
stepInfo (2).cc.qidea.wow.protocol.BlackRockFightStep6
	herosHpMp (2#.cc.qidea.wow.protocol.HeroHpMpInfo4
topnHerosHp (2.cc.qidea.wow.protocol.HeroInfo
isGiveUp (
	memberSts	 (
isFightStart
 (
ateBuffs ("w
BlackRockTeamFightReport
	chapterId (
success (
starCnt (

happenedAt (

progressId (	"π
BlackRockMemberFightReport
memberId (	

memberName (	
isLeader (
icon (
	teamLevel (
vipLv (
	topnForce (
isWin (
	soulTrial	 ("Ω
BlackRockFightStep
stepId (

isComplete (
isNpc (
battleVerify (	5
npcsHpMp (2#.cc.qidea.wow.protocol.HeroHpMpInfo
	stepStart (
soulSpiritId ("
BlackRockGetMyInfoRequest"9
#BlackRockGetFightingTeamInfoRequest

progressId (	"G
"BlackRockGetChapterTeamListRequest
	chapterId (
teamId (	"
BlackRockBuyAwardCountRequest""
 BlackRockGetTeamAwardListRequest"S
BlackRockGetTeamAwardRequest
awardId (	
isDouble (
isGiveUp ("A
,BlackRockGetOnlineConsortiaMemberListRequest
	chapterId ("m
-BlackRockInviteConsortiaMemberJoinTeamRequest
consortiaMemberId (	
	chapterId (
teamId (	"6
$BlackRockAcceptInviteJoinTeamRequest
teamId (	"@
BlackRockCreateTeamRequest
	chapterId (
isShare ("a
BlackRockJoinTeamRequest
teamId (	
	chapterId (
password (	
joinType ("
BlackRockQuitTeamRequest"3
BlackRockKickOffTeamRequest
teamMemberId (	"6
!BlackRockRefreshTeamRivalsRequest
	isAllBoss ("N
$BlackRockChangeMemberPositionRequest

memberPos1 (

memberPos2 (" 
BlackRockTeamFightStartRequest"J
$BlackRockMemberStepFightStartRequest
stepId (

progressId (	"›
"BlackRockMemberStepFightEndRequest<
	fightStep (2).cc.qidea.wow.protocol.BlackRockFightStep6
	herosHpMp (2#.cc.qidea.wow.protocol.HeroHpMpInfo
fightReportData (	
fightersData (	

progressId (	"#
!BlackRockMemberFightGiveUpRequest".
BlackRockInviteRejectRequest
userId (	"X
BlackRockDoTeamFightEndRequest

progressId (	
isDouble (
isGiveUp (">
(BlackRockGetMemberFightReportListRequest

progressId (	"1
BlackRockAutoJoinTeamRequest
	chapterId ("
BlackRockOneKeyInviteRequest"5
BlackRockChatRequest
content (	
type ("
BlackRockChatListRequest".
BlackRockFightReadyRequest
isCancel ("$
"BlackRockShareInviteMessageRequest"0
BlackRockSetTeamOpenStsRequest
isOpen ("u
BlackRockEatBuffRequest
buffId (6
	herosHpMp (2#.cc.qidea.wow.protocol.HeroHpMpInfo

progressId (	"/
BlackRockSetPasswordRequest
password (	"5
BlackRockGetProgressInfoRequest

progressId (	"u
!BlackRockQuickFightRequestRequest<
	fightStep (2).cc.qidea.wow.protocol.BlackRockFightStep

progressId (	"Z
#BlackRockGetChapterTeamListResponse3
teams (2$.cc.qidea.wow.protocol.BlackRockTeam"ü
BlackRockGetMyInfoResponse8
myInfo (2(.cc.qidea.wow.protocol.BlackRockUserInfo4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam
	dayOfYear ("\
$BlackRockGetFightingTeamInfoResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"Z
BlackRockBuyAwardCountResponse8
myInfo (2(.cc.qidea.wow.protocol.BlackRockUserInfo"e
!BlackRockGetTeamAwardListResponse@
	awardList (2-.cc.qidea.wow.protocol.BlackRockTeamAwardInfo"Y
BlackRockGetTeamAwardResponse8
myInfo (2(.cc.qidea.wow.protocol.BlackRockUserInfo"g
-BlackRockGetOnlineConsortiaMemberListResponse6
onlineMemebers (2.cc.qidea.wow.protocol.Fighter"0
.BlackRockInviteConsortiaMemberJoinTeamResponse"]
%BlackRockAcceptInviteJoinTeamResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"ç
BlackRockCreateTeamResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam8
myInfo (2(.cc.qidea.wow.protocol.BlackRockUserInfo"ã
BlackRockJoinTeamResponse8
myInfo (2(.cc.qidea.wow.protocol.BlackRockUserInfo4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"
BlackRockQuitTeamResponse"T
BlackRockKickOffTeamResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"î
"BlackRockRefreshTeamRivalsResponse8
myInfo (2(.cc.qidea.wow.protocol.BlackRockUserInfo4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"]
%BlackRockChangeMemberPositionResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"W
BlackRockTeamFightStartResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"ø
#BlackRockMemberStepFightEndResponse8
myInfo (2(.cc.qidea.wow.protocol.BlackRockUserInfo4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam

awardScore (
stepWinAward (	"î
"BlackRockMemberFightGiveUpResponse8
myInfo (2(.cc.qidea.wow.protocol.BlackRockUserInfo4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"â
SendBlackRockInviteResponse
	chapterId (
nickname (	
	teamLevel (

fightForce (
teamId (	
userId (	"5
!SendBlackRockInviteRejectResponse
nickname (	"ﬁ
BlackRockDoTeamFightEndResponse
starCnt (/
members (2.cc.qidea.wow.protocol.FighterC
allProgress (2..cc.qidea.wow.protocol.BlackRockMemberProgress4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"}
'BlackRockGetTeamFightReportListResponseR
blackRockTeamFightReports (2/.cc.qidea.wow.protocol.BlackRockTeamFightReport"É
)BlackRockGetMemberFightReportListResponseV
blackRockMemberFightReports (21.cc.qidea.wow.protocol.BlackRockMemberFightReport"U
BlackRockAutoJoinTeamResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"U
BlackRockOneKeyInviteResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"
BlackRockChatResponse"*
BlackRockChatListResponse
chats (	"S
BlackRockFightReadyResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"%
#BlackRockShareInviteMessageResponse"W
BlackRockSetTeamOpenStsResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"P
BlackRockEatBuffResponse4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeam"ﬂ
 BlackRockGetProgressInfoResponse
starCnt (/
members (2.cc.qidea.wow.protocol.FighterC
allProgress (2..cc.qidea.wow.protocol.BlackRockMemberProgress4
myTeam (2$.cc.qidea.wow.protocol.BlackRockTeamB'
cc.qidea.wow.protocolBBlackRockProto