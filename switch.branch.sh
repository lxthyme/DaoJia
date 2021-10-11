#!/bin/bash -e

ProjectRoot='/Users/lxthyme/Desktop/Lucky/BL-gitlab/DaoJia'

# 更新 master 分支
info_ALL=(
  master
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

# 新首页
info_NewModuleHome=(damon_dev
DJNewModuleHome BLDaoJia DJHome DJiOSAppImages)

# BYT-78838-集字浏览任务
info_BYT_78838=(damon/BYT-78838-集字浏览任务
BaiLian DJNewModuleHome BLDaoJia DJHome
## dependency
BLHomePageViewComponents BLAPIManagers)

# info=(${info_ALL[@]})
# info=(${info_NewModuleHome[@]})
info=(${info_BYT_78838[@]})
branch=${info[0]}
Components=(${info[@]:1})
echo -e "\033[37m ########## branch ${branch} \033[0m"
echo -e "\033[37m ########## Components \033[43:37m[${#Components[@]}]\033[0m${Components[@]}\n \033[0m"

echo -e "\033[37m ########## $branch Begin ########## \033[0m"
for comp in ${Components[@]}
do
echo -e "\033[33m -->checkout $branch from $comp \033[0m"
cd $ProjectRoot/$comp
git checkout $branch
git pull origin $branch
done

echo -e "\n\033[37m ########## $branch END ########## \033[0m\n"

# echo -n "是否执行 pod install?(Y | y)"
read -n1 -p "是否执行 pod install?(Y | y)" needInstall
case $needInstall in
(Y | y)
  echo -e "\n\033[37m ########## pod install \033[0m"
  cd $ProjectRoot/BaiLian
  pod install
  ;;
(N | n)
  echo "\n\033[37mSkip to execute pod install!\033[0m\n"
  ;;
(*)
  echo -e "\n\033[37mError choice!\033[0m\n"
  ;;
esac
