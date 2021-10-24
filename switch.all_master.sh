# 更新 master 分支
info_ALL=(
  master master
  BLAPIManagers
  BLCouponCenterModule
  BLCouponFloatingView
  BLDaoJia
  BLHomeDataSource
  BLHomePageViewComponents
  BLMapModule
  BLOrder
  BLOrderConfirmBottomView
  BLRawAPIManager
  BLiOSAppImages
  BaiLian
  DJActivityGoodsList
  DJAddressManageModule
  DJClassifyList
  DJGlobalStoreManager
  DJHome
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
  DJiOSAppImages
)

info=(${info_ALL[@]})
info_str="${info[@]}"
$(
  cd "$(dirname "$0")"
  pwd
)/switch.branch.sh "$info_str" "$dependencyBranch_str"
