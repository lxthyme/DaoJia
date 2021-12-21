#!/usr/local/bin/bash -e

declare -A dependencyBranch

# iOS15 适配
dependencyBranch['BLOrder'] = 'damon/iOS15'
dependencyBranch['BLCouponFloatingView'] = 'damon/iOS15'
dependencyBranch['BLCancelOrderView'] = 'damon/iOS15'
dependencyBranch['BLOrderConfirmRuleAlertView'] = 'damon/iOS15'

dependencyBranch['DJNewModuleHome'] = 'damon/iOS15'
dependencyBranch['DJOrderConfirm'] = 'damon/iOS15'
dependencyBranch['DJProductDetailView'] = 'damon/iOS15'
dependencyBranch['DJActivityGoodsList'] = 'damon/iOS15'
dependencyBranch['DJOrderListView'] = 'damon/iOS15'
dependencyBranch['DJClassifyList'] = 'damon/iOS15'
dependencyBranch['DJShoppingCartModule'] = 'damon/iOS15'
dependencyBranch['DJHome'] = 'damon/iOS15'
dependencyBranch['DJChooseAddressView'] = 'damon/iOS15'
dependencyBranch['DJStoreList'] = 'damon/iOS15'
dependencyBranch['DJAddressManageModule'] = 'damon/iOS15'
dependencyBranch['DJScanBarcodeOrderConfirm'] = 'damon/iOS15'
dependencyBranch['DJScanBarcodeView'] = 'damon/iOS15'
dependencyBranch['DJAMapForStoreList'] = 'damon/iOS15'
dependencyBranch['DJGoodsStatusAlertView'] = 'damon/iOS15'
dependencyBranch['DJOrderChooseDeliveryTimeView'] = 'damon/iOS15'
dependencyBranch['DJPaySuccessful'] = 'damon/iOS15'
dependencyBranch['DJBusinessTools'] = 'damon/iOS15'

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
