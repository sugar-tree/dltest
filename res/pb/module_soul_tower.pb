
�

 protocol/module_soul_tower.protocc.qidea.wow.protocolprotocol/common.proto"o
SoulTowerMyInfo
	dungeonId (
wave (
passTime (
dungeon_reward_info (	
rank ("E
SoulTowerRoundInfo
roundNo (
startAt (
endAt ("�
SoulTowerRoundEndRewardInfo
roundId (
	dungeonId (
wave (
passTime (
reward (	
rank (
envRank ("B
SoulTowerFightStartCheckRequest
	dungeonId (
wave (";
SoulTowerFightEndRequest
	dungeonId (
wave ("2
$SoulTowerGetDungeonPassRewardRequest

id ("4
!SoulTowerGetRoundEndRewardRequest
roundId ("<
SoulTowerGetReportRequest
	dungeonId (
wave ("�
SoulTowerGetInfoResponse6
myInfo (2&.cc.qidea.wow.protocol.SoulTowerMyInfo<
	roundInfo (2).cc.qidea.wow.protocol.SoulTowerRoundInfoW
soulTowerRoundEndRewardInfo (22.cc.qidea.wow.protocol.SoulTowerRoundEndRewardInfo"�
SoulTowerFightEndResponse6
myInfo (2&.cc.qidea.wow.protocol.SoulTowerMyInfo
	dungeonId (
wave (
passTime ("�
SoulTowerBattleReport
	dungeonId (
wave (/
fighter (2.cc.qidea.wow.protocol.Fighter
reportId (
fightersData (	
fightersReportData (	"\
SoulTowerGetReportsResponse=
reports (2,.cc.qidea.wow.protocol.SoulTowerBattleReportB'
cc.qidea.wow.protocolBSoulTowerProto