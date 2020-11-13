
£â
protocol/module_activity.protocc.qidea.wow.protocolprotocol/common.proto"ı
ActivityTarget
activityTargetId (	
type (
value (
value2 (
awards (	
description (	

activityId (	
repeatCount (

showStatus	 (
value3
 (	
discount (
effectItemIdList ("î
ActivityRecord
activityTargetId (	

activityId (	
complete_progress (
completeCount (

awardCount (
param1 ("§
Activity

activityId (	
description (	
title (	
icon (	6
targets (2%.cc.qidea.wow.protocol.ActivityTarget
start_at (
end_at (
type (
params	 (	
show_at
 (
weight (
award_at (
award_end_at (6
records (2%.cc.qidea.wow.protocol.ActivityRecord

background (	

title_icon (	
tip_type (
subject (
banner (	"D
ActivityTargetSimple
activityTargetId (	

activityId (	"∂
LuckyDrawDirectionalInfo
rowNum (
startAt (
endAt (
	showEndAt (
luckyDrawId (	L
	luckyType (29.cc.qidea.wow.protocol.LuckyDrawDirectionalInfo.LuckyType
buyEndAt ("·
	LuckyType
LUXURIOUS_ROLLING
GROUP_BUYING

DIVINATION
HOLIDAY_ACTIVITY
RUSH_BUY

GUESS_CARD
SKY_FALL_REWARD
	TURN_CARD
CELEBRITY_HALL_RANK	
	WEEK_FUND

HOLIDAY_ACTIVITY2
NEW_WEEK_FUND
FORGE_ACTIVITY
SOUL_LETTER
PLAYER_COME_BACK
PRIZE_WHEEL_ACTIVITY
RAT_FESTIVAL
THEME_PREHEAT
THEME_FORMAL
WEEK_PLAY_TEA
MAZE_EXPLORE
NEW_SERVER_RECHARGE
RESOURCE_TREASURES
CUSTOM_SHOP"F
PbUserGroupBuying
groupBuyingScore (
awardedScoreIds ("T
PbGroupBuyingBoughtGoods
goodsId (
discount (
todayBuyCount ("D
PbGroupBuyingGoodsDiscount
goodsId (
totalBuyCount ("î
PbGroupBuyInfo
goodsId (
item (	
num (
price (
time (
level_limit (
discount (	

num_player (	"I

NumberInfo
num (
XAxis (
YAxis (
isActive ("y
	AwardInfo+
award (2.cc.qidea.wow.protocol.Award
XAxis (
YAxis (
isTaken (
isActive ("v
DivinationInfo2
numbers (2!.cc.qidea.wow.protocol.NumberInfo0
awards (2 .cc.qidea.wow.protocol.AwardInfo"¨
PbUserLuckyDrawDirectional
	drawScore (
	drawCount (
lastFreeDrawAt (

lastDrawAt (
awardedBoxIds (

commonRank (
	eliteRank ("÷
MonthFundInfo
startAt (
awardStartAt (
endAt (E
monthFundAwardList (2).cc.qidea.wow.protocol.MonthFundAwardInfoH
monthFund128AwardList (2).cc.qidea.wow.protocol.MonthFundAwardInfo"i
MonthFundAwardInfo

awardIndex (+
award (2.cc.qidea.wow.protocol.Award

glittering ("[
MonthFundAwardListE
monthFundAwardList (2).cc.qidea.wow.protocol.MonthFundAwardInfo"”
UserMonthFundInfo
hasRechargedMoreThan288 (
status (

login_days (
award_taken_info (	
	status128 (
award128_taken_info (	
hasRechargedMoreThan128 (
buy_at ("X
WeekFundAwardListC
weekFundAwardInfo (2(.cc.qidea.wow.protocol.WeekFundAwardInfo"T
WeekFundAwardInfo

awardIndex (+
award (2.cc.qidea.wow.protocol.Award"`
UserWeekFundInfo
status (
awardTakenInfo (
buyAt (
activateMoney ("©
WeekFundInfo
startAt (
endAt (
money (
rebate (C
weekFundAwardInfo (2(.cc.qidea.wow.protocol.WeekFundAwardInfo
showAwardInfo (	"L
UserNewWeekFundInfo
status (
awardTakenInfo (
buyAt ("ê
PbRushBuyGoods
roundId (
item (	
num (
price (
times (

levelLimit (
numLimit	 (
buyMax
 ("`
PbRushBuyGoodsBuyInfo
roundId (
issue (
allBuyCount (

myBuyCount ("é
PbRushBuyLuckyUserInfo
roundId (
issue (
luckyAt (

myBuyCount (/
fighter (2.cc.qidea.wow.protocol.Fighter"Z
PbRushBuyBuyLog
buyAt (
buyCount (
nickname (	
gameAreaName (	"ø
UserGuessCardInfo
guess_info1 (
guess_info2 (
guess_count1 (
guess_count2 (
reset_count1 (
reset_count2 (
last_reset1 (
last_reset2 ("^
UserTurnCardInfo

turn_card1 (

turn_card2 (

turn_card3 (
is_get ("u
SoulLetterReward
type (
level (
exp (
normalRewardIndexes (
eliteRewardIndexes ("^
ActivityCompleteRequest

activityId (	
targetId (	
params (	
count ("I
 ActivityGetIntegralRewardRequest
activityType (	
prizeId ("0
ActivityGetEnterRewardRequest
prizeId ("6
&GroupBuyingGetGoodsDiscountInfoRequest
flag ("3
GroupBuyingGetScoreAwardRequest
awardIds ("?
GroupBuyingBuyGoodsRequest
goodsId (
discount ("(
DivinationDivineRequest
count ("±
DivinationGetAwardRequestL
type (2>.cc.qidea.wow.protocol.DivinationGetAwardRequest.POSITION_TYPE
value ("7
POSITION_TYPE

TYPE_X

TYPE_Y

TYPE_FINAL"ó
DivinationGetRankInfoRequestK
type (2=.cc.qidea.wow.protocol.DivinationGetRankInfoRequest.RANK_TYPE"*
	RANK_TYPE
CENTER_RANK
ENV_RANK"9
DivinationGetScoreAwardRequest
scoreAwardIndex ("7
#LuckyDrawDirectionalGetRanksRequest
rankType ("*
LuckyDrawDirectionRequest
count ("1
 LuckyDrawIntegralFeedbackRequest
boxId ("F
MonthFundGetAwardRequest

awardIndex (
is128MonthFund ("-
WeekFundGetAwardRequest

awardIndex ("/
RushBuyGetGoodsInfoRequest
	rushBuyId (	"-
RushBuyGetBuyInfoRequest
	rushBuyId (	"L
RushBuyBuyGoodsRequest
	rushBuyId (	
issue (
buyCount ("0
RushBuyGetLuckyUsersRequest
	rushBuyId (	"D
 RushBuyGetGoodsLuckyUsersRequest
	rushBuyId (	
issue ("@
RushBuyGetMyLuckyNumsRequest
	rushBuyId (	
issue (";
RushBuyGetBuyLogRequest
	rushBuyId (	
issue ("7
GuessCardResetRequest

activityId (	

id ("E
GuessCardOpenRequest

activityId (	

id (
index ("-
GuessCardGetInfoRequest

activityId (	"%
TurnCardRequest

activityId (	"0
NewWeekFundGetAwardRequest

awardIndex ("1
SendRemoveActivityResponse
activityIds (	"™
!GroupBuyingGetMyGoodsInfoResponse?
myGroupBuying (2(.cc.qidea.wow.protocol.PbUserGroupBuyingD
boughtGoods (2/.cc.qidea.wow.protocol.PbGroupBuyingBoughtGoods"¡
'GroupBuyingGetGoodsDiscountInfoResponseD
	discounts (21.cc.qidea.wow.protocol.PbGroupBuyingGoodsDiscount
flag (B
groupBuyingInfoList (2%.cc.qidea.wow.protocol.PbGroupBuyInfo"c
 GroupBuyingGetScoreAwardResponse?
myGroupBuying (2(.cc.qidea.wow.protocol.PbUserGroupBuying"^
GroupBuyingBuyGoodsResponse?
myGroupBuying (2(.cc.qidea.wow.protocol.PbUserGroupBuying"À
DivinationGetResponse=
divinationInfo (2%.cc.qidea.wow.protocol.DivinationInfo

centerRank (

normalRank (
activeCount (
divinationScore (
divinationScoreReward ("Ú
DivinationDivineResponse=
divinationInfo (2%.cc.qidea.wow.protocol.DivinationInfo

centerRank (

normalRank (A
divineResultList (2'.cc.qidea.wow.protocol.DivinationResult
activeCount (
divinationScore ("ù
DivinationResultF

resultType (22.cc.qidea.wow.protocol.DivinationResult.ResultType

resultInfo (	"-

ResultType
NUMBER_TYPE

AWARD_TYPE"X
DivinationResetResponse=
divinationInfo (2%.cc.qidea.wow.protocol.DivinationInfo"œ
DivinationGetAwardResponse=
divinationInfo (2%.cc.qidea.wow.protocol.DivinationInfo5
divinationAward (2.cc.qidea.wow.protocol.Award
activeCount (

centerRank (

normalRank ("~
DivinationGetRankInfoResponse-
top50 (2.cc.qidea.wow.protocol.Fighter.
myself (2.cc.qidea.wow.protocol.Fighter"@
DivinationGetScoreAwardResponse
divinationScoreReward ("Z
SendMonthFundChangeResponse;
monthFundInfo (2$.cc.qidea.wow.protocol.MonthFundInfo"ú
MonthFundGetInfoResponse;
monthFundInfo (2$.cc.qidea.wow.protocol.MonthFundInfoC
userMonthFundInfo (2(.cc.qidea.wow.protocol.UserMonthFundInfo"r
MonthFundGetAwardResponseC
userMonthFundInfo (2(.cc.qidea.wow.protocol.UserMonthFundInfo
awardStr (	"h
RushBuyGetGoodsInfoResponse9

goodsInfos (2%.cc.qidea.wow.protocol.PbRushBuyGoods
rowNum ("[
RushBuyGetBuyInfoResponse>
buyInfos (2,.cc.qidea.wow.protocol.PbRushBuyGoodsBuyInfo"k
RushBuyBuyGoodsResponse=
buyInfo (2,.cc.qidea.wow.protocol.PbRushBuyGoodsBuyInfo
	luckyNums (	"e
RushBuyGetLuckyUsersResponseE
luckyUserInfos (2-.cc.qidea.wow.protocol.PbRushBuyLuckyUserInfo"j
!RushBuyGetGoodsLuckyUsersResponseE
luckyUserInfos (2-.cc.qidea.wow.protocol.PbRushBuyLuckyUserInfo"2
RushBuyGetMyLuckyNumsResponse
	luckyNums (	"[
RushBuyGetBuyLogResponse?
pbRushBuyBuyLog (2&.cc.qidea.wow.protocol.PbRushBuyBuyLog"_
GuessCardGetInfoResponseC
userGuessCardInfo (2(.cc.qidea.wow.protocol.UserGuessCardInfo"]
GuessCardResetResponseC
userGuessCardInfo (2(.cc.qidea.wow.protocol.UserGuessCardInfo"w
GuessCardOpenResponse

id (
order (C
userGuessCardInfo (2(.cc.qidea.wow.protocol.UserGuessCardInfo"U
TurnCardResponseA
userTurnCardInfo (2'.cc.qidea.wow.protocol.UserTurnCardInfo"Ö
$LuckyDrawDirectionalGetRanksResponse-
ranks (2.cc.qidea.wow.protocol.Fighter.
myself (2.cc.qidea.wow.protocol.Fighter"¸
 SendLuckyDrawDirectionalResponse=
info (2/.cc.qidea.wow.protocol.LuckyDrawDirectionalInfoQ
type (2C.cc.qidea.wow.protocol.SendLuckyDrawDirectionalResponse.MessageType"F
MessageType
ONLINE_LUCKY_DRAW_INFO
OFFLINE_LUCKY_DRAW_INFO"b
ActivityQuestion
title (	

activityId (	
startAt (
endAt (
url (	"‚
"SendActivityQuestionChangeResponseA
activityQuestion (2'.cc.qidea.wow.protocol.ActivityQuestionT
pushType (2B.cc.qidea.wow.protocol.SendActivityQuestionChangeResponse.PushType"#
PushType

ONLINE
OFFLINE"+
ForgeGetMyInfoRequest

activityId (	"/
ForgeGetBestHammerRequest

activityId (	"5
ForgeMakeRequest

activityId (	
count ("-
ForgeGetMyInfoResponse
activeState ("1
ForgeGetBestHammerResponse
activeState ("#
ForgeMakeResponse
states ("9

StepStatus
step (
status (
isGet ("∫
SoulLetterQuestA
questRecord (2,.cc.qidea.wow.protocol.SoulLetterQuest.Quest
exp (W
Quest
type (
process (/
step (2!.cc.qidea.wow.protocol.StepStatus"
SoulLetterRewardInfoRequest"m
SoulLetterRewardInfoResponse;

rewardInfo (2'.cc.qidea.wow.protocol.SoulLetterReward
buyState ("
SoulLetterQuestInfoRequest"X
SoulLetterQuestInfoResponse9
	questInfo (2&.cc.qidea.wow.protocol.SoulLetterQuest"+
SoulLetterActiveRequest
activeId ("V
SoulLetterActiveResponse
type (
level (
exp (
buyState ("&
SoulLetterGainRequest
index ("Q
SoulLetterGainResponse
normalRewardIndexes (
eliteRewardIndexes ("3
SoulLetterQuestCompleteRequest
	questType ("å
SoulLetterQuestCompleteResponse
level (
exp (
questExp (;
quest (2,.cc.qidea.wow.protocol.SoulLetterQuest.Quest"}
PlayerComeBackQuestInfo
type (
targetId (
completeCount (
completeProcess (

awardCount ("·
PlayerComeBackUserInfo
activity_id (	
start_at (
end_at (@
taskInfo (2..cc.qidea.wow.protocol.PlayerComeBackQuestInfo
last_leave_at (
old_topn_force (

login_days (
num ("N
PlayerComeBackCompleteRequest
type (
targetId (
count ("a
PlayerComeBackUserInfoResponse?
userInfo (2-.cc.qidea.wow.protocol.PlayerComeBackUserInfo"±
UserPrizeWheelInfo

activityId (	
prizeWheelLottery (
totalDrawCount (
wheelPrizeGot (
helpPrizeGot (
boxPrizeGot (

positionId (".
PrizeWheelGetInfoRequest

activityId (	"+
PrizeWheelDrawRequest

activityId (	"Q
PrizeWheelGetPrizeRequest

activityId (	
getType (
prizeId ("Y
PrizeWheelUserInfoResponse;
userInfo (2).cc.qidea.wow.protocol.UserPrizeWheelInfo"]
PlayerComeBackCompleteResponse;
	luckyDraw (2(.cc.qidea.wow.protocol.LuckyDrawResponse"ù
UserRatFestivalInfo

activityId (	
score (
getScorePrize (
getFinalReward (
totalCompleteCount (
finalRewardCount ("0
RatFestivalLuckyDrawRequest
	drawCount ("5
 RatFestivalGetScoreRewardRequest
	rewardIds ("/
RatFestivalCombineFokaRequest
fokaId ("W
RatFestivalInfoResponse<
userInfo (2*.cc.qidea.wow.protocol.UserRatFestivalInfo"s
#FragmentActivityCompleteTaskRequest9
taskType (2'.cc.qidea.wow.protocol.FragmentTaskType
	dungeonId ("p
 FragmentActivityGetRewardRequest9
taskType (2'.cc.qidea.wow.protocol.FragmentTaskType
	dungeonId ("Y
 FragmentActivityDoCommentRequest
	dungeonId (
content (	
	createdAt (":
%FragmentActivityGetCommentListRequest
	dungeonId ("A
FragmentActivityCommentInfo
content (	
	createdAt ("A
UserFragmentInfo
completeIds (
gotTaskRewardIds ("0
FragmentActivityCompleteTask
taskType ("ú
FragmentActivityInfoResponse9
userInfo (2'.cc.qidea.wow.protocol.UserFragmentInfoA
infos (22.cc.qidea.wow.protocol.FragmentActivityCommentInfo"+
ThemePreActivityExpectRequest

id ("e
ThemePreActivityExpectResponse
alreadyExpected (
currExpectation (
	rewardIds ("4
UserSkyFallRedPackageInfo

id (
num ("6
$SkyFallActivityOpenRedPackageRequest
idList ("6
$SkyFallActivityGetScoreRewardRequest
idList ("J
UserSkyFallRankingInfo
nickname (	
getToken (
rank ("Ö
UserSkyFallInfoResponseI
packageInfoList (20.cc.qidea.wow.protocol.UserSkyFallRedPackageInfo
getPackageIdList (
getScoreIdList (
todayGetToken (
totalGetToken (?
infoList (2-.cc.qidea.wow.protocol.UserSkyFallRankingInfo"+
ThemeFormalScoreRewardRequest

id ("-
ThemeFormalPlayRewardRequest
grade ("V
ThemeFormalActivityResponse
currNum (
remainCount (
	rewardIds (".
OpenServerFundRewardRequest
awardId ("h
OpenServerFundRewardResponse
freeAwardIds (
rechargeAwardIds (
buyCountAwardIds ("2
ActivityChannelGetRewardRequest
awardId ("/
ActivityChannelResponse
getAwardList ("<
WeekPlayTeaCraftFoodRequest
itemId (
count (":
WeekPlayTeaEatFoodRequest
itemId (
count ("0
WeekPlayTeaProjectRewardRequest
level ("Ë
WeekPlayTeaResponse
nowMood (
exp (
level (/
	eatPrizes (2.cc.qidea.wow.protocol.Prize3
levelUpPrizes (2.cc.qidea.wow.protocol.Prize
levelReward (
loginReward (
freeAwardGot ("%
#NewServerRechargeGetMainInfoRequest"F
!NewServerRechargeGetRewardRequest

activityId (	
index ("ï
NewServerRechargeUserInfo

activityId (	
completeCount (
completeProgress (	
buyCount (

awardCount (
endAt ("c
NewServerRechargeResponseF
userInfoList (20.cc.qidea.wow.protocol.NewServerRechargeUserInfo"z
TreasureInfoResponse

activityId (	
	radioGrid (
theme1 (
theme2 (
free (
items (	"ã
TreasureLotteryInfo
grid (
reward (	C
lotteryInfoList (2*.cc.qidea.wow.protocol.TreasureLotteryInfo
	radioGrid ("z
TreasureLotteryResponse
theme1 (
theme2 (?
lotteryInfo (2*.cc.qidea.wow.protocol.TreasureLotteryInfo"6
TreasureChooseThemeRequest
type (

id (".
TreasureLotteryRequest
lotteryCount ("O
CustomShopChooseGiftRequest
typeId (
giftId (
currItem (	">
CustomShopReceiveGiftRequest
typeId (
giftId ("r
CustomShopInfo
giftId (
currItem (	
historyItem (	
completeCount (

awardCount ("\
CustomShopUserInfo7
giftInfo (2%.cc.qidea.wow.protocol.CustomShopInfo
items (	"U
CustomShopInfoResponse;
userInfo (2).cc.qidea.wow.protocol.CustomShopUserInfo*T
SoulLetterType

NORMAL
ELITE_LOW_ENABLE
ELITE_HIGH_ENABLE	
ELITE*Ö
SoulLetterQuestType
ARENA_FIGHT_QUEST
DRAGON_WAR_QUEST
SILVER_TIME_QUEST
SUN_WAR_PASS_QUEST
MONOPOLY_DICE_QUEST
LUCK_DRAW_NORMAL_QUEST
INTRUSION_QUEST
META_CITY_QUEST
RED_PACKET_SEND_QUEST	
CONSORTIA_ANSWER_QUEST

SILVER_HELP_QUEST
THUNDER_PASS_QUEST
ARENA_WORSHIP_QUEST
DIAMOND_CONSUME_QUEST
ENERGY_BUY_QUEST
SKIN_ACTIVE_QUEST
HEAD_DATA_UNLOCK_QUEST
MARITIME_SHIP_COLOUR_QUEST
SHOP_BUY_QUEST
FIGHT_CLUB_SUCCESS_QUEST*h
PlayerComeBackType
	LOGIN_ACT
TARGET_RECHARGE
SUM_RECHARGE

CHANGE_ACT
BACK_ACT*∞
PlayerComeBackQuestType
HERO_COME_BACK
ENTRY_CONSORTIA
CHAT_IN_WORLD

ADD_FRIEND
HERO_LEVEL_UP

HERO_BREAK

HERO_GRADE
TOPN_FORCE_IMPROVE*;
PrizeWheelPrizeType

HELP_PRIZE
DRAW_COUNT_PRIZE*W
FragmentTaskType
WATCH_DETAIL
WATCH_REPLAY
TRY_PLAY
SPECIAL_TRAINB&
cc.qidea.wow.protocolBActivityProto