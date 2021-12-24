#!/usr/local/bin/bash -e

# 更新 master 分支
info_ALL=(
  master master
  BaiLian
  BLAPIManagers
  BLBusinessCategoryRouterCenter
  BLCancelOrderView
  BLCouponFloatingView
  BLDaoJia
  BLFlutterRouterManager
  BLiOSAppImages
  BLMapModule
  BLNetworking
  BLOrder
  BLOrderConfirmBottomView
  BLOrderConfirmRuleAlertView
  BLRawAPIManager
  DJActivityGoodsList
  DJAddressManageModule
  DJAMapForStoreList
  djbusinesstools
  DJChooseAddressView
  DJClassifyList
  DJGlobalStoreManager
  DJGoodsStatusAlertView
  DJHome
  DJHomeDataSource
  DJiOSAppImages
  DJNavigationView
  DJNewModuleHome
  DJOrderChooseDeliveryTimeView
  DJOrderConfirm
  DJOrderListView
  DJPaySuccessful
  DJProductDetailView
  DJResourceJumpManager
  DJScanBarcodeOrderConfirm
  DJScanBarcodeView
  DJSearchHistoryManger
  DJShoppingCartModule
  DJStoreList
)

# info=(${info_ALL[@]})
# info_str="${info[@]}"
info_str="${info_ALL[@]}"
$(
  cd "$(dirname "$0")"
  pwd
)/switch.branch.sh "$info_str" "$dependencyBranch_str"
