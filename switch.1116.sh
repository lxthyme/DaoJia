#!/usr/local/bin/bash -e

declare -A dependencyBranch

# 1116
## 1. [【到家/前端】商品列表页、凑单页等更新商品样式（APP/小程序/H5）](http://jira.ibl.cn/browse/BYT-78490) 「`damon/BYT-78490_更新商品样式`」
# info_BYT_78490=(damon/BYT-78490_更新商品样式 damon/BYT-78490_更新商品样式
#   DJNewModuleHome
#   DJActivityGoodsList
#   BLCouponFloatingView)
dependencyBranch['DJNewModuleHome']='damon/BYT-78490_更新商品样式'
dependencyBranch['DJActivityGoodsList']='damon/BYT-78490_更新商品样式'
dependencyBranch['BLCouponFloatingView']='damon/BYT-78490_更新商品样式'

## 1. [【到家/前端】确认订单页配送时间选择项设计优化（IOS）](http://jira.ibl.cn/browse/BYT-79341?filter=-1)「`damon/BYT-79341_配送时间`」
# info_BYT_79341=(damon/BYT-79341_配送时间
#   DJOrderConfirm)
dependencyBranch['DJOrderConfirm']='damon/BYT-79341_配送时间'

## 1. [线上问题：未进过到家首页，直接从主站进到家商详页，加车后进购物车页面，购物车显示空，预期：应有加车的商品](http://jira.ibl.cn/browse/SIT-43786?filter=-1)
# info_=(damon/SIT-43786\_购物车
#   DJProductDetailView)
# dependencyBranch['DJProductDetailView']='damon/SIT-43786_购物车'
dependencyBranch['DJProductDetailView']='master'
dependencyBranch['BLDaoJia']='damon/bugfix_1116'
dependencyBranch['DJClassifyList']='damon/bugfix_1116'
dependencyBranch['DJChooseAddressView']='damon/bugfix_1116'
dependencyBranch['DJShoppingCartModule']='damon/bugfix_1116'
dependencyBranch['DJOrderListView']='damon/bugfix_1116'
dependencyBranch['DJHome']='damon/bugfix_1116'
dependencyBranch['DJGlobalStoreManager']='damon/bugfix_1116_进店逻辑_v2'

params=""
for comp in $(echo ${!dependencyBranch[*]}); do
  cbranch=${dependencyBranch[$comp]}
  params+="$comp=$cbranch "
done

# info=(${info_NewModuleHome[@]})
# info_str="${info[@]}"
info="()"
dependencyBranch_str="$params"
$(
  cd "$(dirname "$0")"
  pwd
)/switch.branch.sh "$info_str" "$dependencyBranch_str"
