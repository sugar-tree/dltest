
šB
protocol/module_user.protocc.qidea.wow.protocolprotocol/common.proto"ê
PbUserDailyTask
achievements (
missedAchievements (
todayLuckyDrawAnyCount (
todaySkillImprovedCount ("
totalLuckyDrawAdvanceCount (!
totalLuckyDrawNormalCount (
addupDungeonPassCount ("4
BuyMoneyInfo
money (
buyMoneyYield ("K
ChatInfo
type (
content (	
params (	
sendTime ("Z
PersonChatInfo
userId (	8
personChatInfos (2.cc.qidea.wow.protocol.ChatInfo"3
GameTipsInfo
tips_id (	

like_count ("~
PlayerRecoverInfo
isFreeRewardTaken (
payRewardTakenInfo (	
startAt (
endAt (

lastOpenAt ("K
RechargeDetail
cash_num (
	cash_type (
recharge_cnt ("ù
RechargeInfo
firstRecharge (
firstAwarded (
monthCard1EndTime (
monthCard2EndTime (>
rechargeDetails (2%.cc.qidea.wow.protocol.RechargeDetail
cash (
itemId	 (
cashType
 (
rechargeDataId ("i
LuxuriousCheckInSingleInfo
hasTaken (
isQualified (
rechargeType (
reward (	"j
LuxuriousCheckInInfo?
info (21.cc.qidea.wow.protocol.LuxuriousCheckInSingleInfo
	getInfoAt ("D
RechargeFeedbackInfo
rechargeAmount (
gotRewardIds ("ý
UserComeBackInfo
startAt (
endAt (
loginRewardInfo (G
userComeBackBuyList (2*.cc.qidea.wow.protocol.UserComeBackBuyInfo
dailyMaxRecharge (
dailyTotalRecharge (
rechargeRewardInfo (
initTeamLevel ("4
UserComeBackBuyInfo
goodId (
count ("\
CheckInGrid
gridId (
isCheck (
isDoubleCheck (
lastCheckInAt ("^
UserLevelReward
level (

unlockTime (
unlockRecharge (	
drawInfo (	"C
UserLevelGoal

id (
taskProgress (	
isReward ("Y
UserDailyGiftInfo
giftProgress (	
giftComplete (	
autoGetGiftEndAt ("f
UserWeekTaskInfo
taskInfo (	
taskCompleteInfo (	
boxCompleteInfo (	
score ("
PushConfigurationInfoRequest"X
PushSetConfigurationRequest9
setting (2(.cc.qidea.wow.protocol.StringIntegerPair" 
GuidanceRequest
index ("'
LogGuidePointRequest
guideId ("4
ChangeAvatarRequest
avatar (
title (")
ChangeNicknameRequest
nickname (	"<
ChangeDefaultActorRequest
actorId (
skinId ("/
CDKeyUseRequest
key (	
type (:0"
CheckInRequest
index ("$
CheckInAwardRequest
index ("+
LuxuriousCheckInRequest
recharge ("$
CheckInMonthRequest
index (")
CheckInAwardMonthRequest
index ("<
BuyMoneyRequest
count (
isSecretary (:false"=
BuyEnergyRequest
count (
isSecretary (:false""
ItemCraftRequest
itemId ("=
ItemSellRequest*
items (2.cc.qidea.wow.protocol.Item"L
ItemOpenRequest
itemId (
count (
isSecretary (:false"N
ItemRecoverRequest*
items (2.cc.qidea.wow.protocol.Item
type ("J
ItemChooseRequest
itemId (
targetResource (	
count ("g
LuckyDrawRequest
	isAdvance (
count (
isHalf (:false
isSecretary (:false"=
LuckyDrawBuyBullRequest
	bullCount (
is10Buy ("H
LuckyDrawEnchantRequest
	is10Times (
isSecretary (:false"1
LuckyDrawEnchantRewardRequest
rewardId ("L
LuckyDrawEnchantRecoverRequest*
items (2.cc.qidea.wow.protocol.Item">
GetLuckyDrawScorePrizeRequest
boxId (	
itemId (",
RankingQueryFighterRequest
userId (	"?
DailyTaskCompleteRequset
tasks (	
isOneKeyOpen ("(
DailyTaskRewardRequest
box_id ("4
AchievementCompleteRequest
achievementIds (	"B
WeekTaskCompleteRequest
	taskIndex (
isOneKeyOpen ("'
WeekTaskRewardRequest
box_id ("N
ChatRequest
type (
content (	
params (	
toUserId (	"­
ChatReportRequest
userId (	H

reportType (24.cc.qidea.wow.protocol.ChatReportRequest.REPORT_TYPE">
REPORT_TYPE
CHAT_REPORT_TYPE
CONSORTIA_REPORT_TYPE"(
CheckUserOnlineRequest
userId (	"%
GameTipsLikeTipsRequest

id (	"À
PlayerRecoverGetRewardRequestS

rewardType (2?.cc.qidea.wow.protocol.PlayerRecoverGetRewardRequest.RewardType
rewardId (
count (")

RewardType
	FREE_TYPE
PAY_TYPE"6
UserCertificationRequest
name (	
idno (	"[
DoRechargeTokenRequest
	targetRmb (

targetType (
itemId (

id ("4
GetFirstRechargeRewardRequest
rewardIndex ("4
 RechargeFeedbackGetRewardRequest
rewardId ("6
"UserComeBackTakeLoginRewardRequest
loginDay ("=
UserComeBackBuyRewardRequest
goodId (
count ("9
%UserComeBackTakeRechargeRewardRequest
rewardId ("*
UserOfflineEventGetRequest
type ("'
PublicityMapRewardRequest

id ("8
UserLevelRewardComleteRequest

id (
num (")
UserLevelGoalComleteRequest

id (")
LevelGoalGetInfoRequest
getAll ("B
ServerGoalGetMainInfoRequest
taskType (
isGetAll ("-
ServerGoalGetTaskInfoRequest
index ("*
ServerGoalCompleteRequest
index ("*
UserDailyGiftCompleteRequest

id ("+
UserSkinWardrobeActiveRequest

id ("*
UserSkinPictureActiveRequest

id ("1
 UserSoulSpiritOccultResetRequest
mapId ("^
 SettingConfigurationInfoResponse:
settings (2(.cc.qidea.wow.protocol.StringIntegerPair"E
BuyMoneyResponse1
info (2#.cc.qidea.wow.protocol.BuyMoneyInfo"ý
GetChatResponse7
worldChatInfos (2.cc.qidea.wow.protocol.ChatInfo;
consortiaChatInfos (2.cc.qidea.wow.protocol.ChatInfo>
personChatInfos (2%.cc.qidea.wow.protocol.PersonChatInfo
reportChatTimes (
silvermineChatTimes (")
CheckUserOnlineResponse
online ("k
GameTipsLikeTipsResponse9
gameTipsInfo (2#.cc.qidea.wow.protocol.GameTipsInfo
like_tips_id (	"u
GameTipsGetAllTipsInfoResponse=
gameTipsInfoList (2#.cc.qidea.wow.protocol.GameTipsInfo
like_tips_id (	"2
PlayerRecoverGetRewardResponse
awardStr (	"T
GetRechargeInfoResponse9
rechargeInfo (2#.cc.qidea.wow.protocol.RechargeInfo"T
DoRechargeTokenResponse9
rechargeInfo (2#.cc.qidea.wow.protocol.RechargeInfo"=
TokenChangeResponse
changeValue (
	tokenType ("—
GetFirstRechargeAwardResponse9
rechargeInfo (2#.cc.qidea.wow.protocol.RechargeInfo;
	luckyDraw (2(.cc.qidea.wow.protocol.LuckyDrawResponse" 
GetFirstRechargeRewardResponse"Ë
GetLuckyDrawScorePrizeResponse!
luckydrawAdvanceRewardRow (%
luckydrawAdvanceRewardGotBoxs (	"
luckydrawAdvanceTotalScore (;
	luckyDraw (2(.cc.qidea.wow.protocol.LuckyDrawResponse"ó
CheckInMonthInfo
index (
checkin_times (
last_checkin_at (
addup_count (
addup_award (	
total_supply (

cur_supply (
last_supply_at (4
gridList	 (2".cc.qidea.wow.protocol.CheckInGrid"P
CheckInResponse=
checkInMonth (2'.cc.qidea.wow.protocol.CheckInMonthInfo"_
UserOfflineEventInfo
type (
fightNickName (	
	startRank (	
nowRank (	"
VipGiftGetRecordRequest"C
VipGiftGetRecordResponse
dailyRecord (	

weekRecord (	"
VipGiftDailyGainRequest"/
VipGiftDailyGainResponse
dailyRecord (	"&
VipGiftWeekBuyRequest
index (",
VipGiftWeekBuyResponse

weekRecord (	"=
UserTelephoneInfo
phoneNum (	
nextRewardTime ("1
TelephoneVerifyCodeGetRequest
phoneNum (	"G
TelephoneVerifyCodeCheckRequest
phoneNum (	

verifyCode (	"g
ServerGoalGetMainInfoResponseF
serverGoalUserInfos (2).cc.qidea.wow.protocol.ServerGoalUserInfo"g
ServerGoalGetTaskInfoResponseF
serverGoalUserInfos (2).cc.qidea.wow.protocol.ServerGoalUserInfo"\
UserDailyGiftCompleteResponse;
	luckyDraw (2(.cc.qidea.wow.protocol.LuckyDrawResponse"]
"UserSoulSpiritOccultLevelUpRequest
mapId (

bigPointId (
smallPointId ("]
UserSoulSpiritOccultResponse=
mapInfo (2,.cc.qidea.wow.protocol.UserSoulSpiritMapInfo"F
ItemReturnRequest1
consumeItems (2.cc.qidea.wow.protocol.Item"E
MonthCardSupplementResponse

monthCard1 (

monthCard2 ("o
OneKeyChangeDefenseArmyRequest9

battleType (2%.cc.qidea.wow.protocol.BattleTypeEnum

replayData (	B"
cc.qidea.wow.protocolB	UserProto