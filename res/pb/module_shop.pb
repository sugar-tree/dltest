
þ
protocol/module_shop.protocc.qidea.wow.protocolprotocol/common.proto"¥
	ShelfItem

id (
count (
cost (3
	moneyType (2 .cc.qidea.wow.protocol.AwardType
	buy_count (
good_group_id (
itemType (	"^

SelectItem
itemType (	

id (
	moneyType (	
moneyNum (
count ("]
ShopQuickBuyList
	rushIndex (6
selectItems (2!.cc.qidea.wow.protocol.SelectItem"ø

ShopStatus

id (1
shelves (2 .cc.qidea.wow.protocol.ShelfItem
buyRefreshCount (
refreshedAt (
openedAt (
freeRefreshedAt (
freeRefreshedCount (
award_buy_pos (	
last_call_get_shop_time	 ("z
ExchangeShopStatus

id (
buy_info (	
buy_at (
last_call_get_shop_time (
buy_once_info (	"s
CrystalShop
shopId (3
	goodsList (2 .cc.qidea.wow.protocol.GoodsInfo
last_call_get_shop_time ("e
	GoodsInfo
goodId (
goodInfo (	
costInfo (	
discount (

hasbrought ("z
ShopBuyRequest
shopId (
pos (
itemId (
count (
buyCount (
isSecretary (:false"r
ShopOneKeyBuyRequest>
shopBuyRequests (2%.cc.qidea.wow.protocol.ShopBuyRequest
isSecretary (:false"Ž
ShopQuickBuyRequest
shopId (
refushCount (6
selectItems (2!.cc.qidea.wow.protocol.SelectItem
isSecretary (:false"K
ExchangeShopBuyRequest
shopId (
grid_id (
buyCount ("‰
ExchangeShopQuickBuyRequest
shopId (>
	gridInfos (2+.cc.qidea.wow.protocol.ExchangeShopGridInfo
isSecretary (:false"8
ExchangeShopGridInfo
gridId (
buyCount (" 
ShopGetRequest
shopId ("$
ShopRefreshRequest
shopId ("'
CrystalShopGetRequest
shopId ("7
CrystalShopBuyRequest
shopId (
goodId ("Y
CrystalShopGetListResponse;
crystalShopList (2".cc.qidea.wow.protocol.CrystalShop"Q
CrystalShopGetResponse7
crystalShop (2".cc.qidea.wow.protocol.CrystalShop"Q
CrystalShopBuyResponse7
crystalShop (2".cc.qidea.wow.protocol.CrystalShop"”
ShopQuickBuyResponse
	stop_type (A
ShopQuickBuyList (2'.cc.qidea.wow.protocol.ShopQuickBuyList
refreshCount (
buyCount (B"
cc.qidea.wow.protocolB	ShopProto