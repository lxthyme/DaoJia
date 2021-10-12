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
info_NewModuleHome=(damon_dev master_1015
DJNewModuleHome BLDaoJia DJHome DJiOSAppImages BLiOSAppImages)

# BYT-78838-集字浏览任务
info_BYT_78838=(damon/BYT-78838-集字浏览任务 master_1015
DJNewModuleHome BLDaoJia DJHome
# dependency
# BLHomePageViewComponents BLAPIManagers
)

# info=(${info_ALL[@]})
# info=(${info_NewModuleHome[@]})
info=(${info_BYT_78838[@]})
branch=${info[0]}
devBranch=${info[1]}
Components=(${info[@]:2})
echo -e "\033[37m ########## branch: \033[43:37m$branch\033[0m devBranch: \033[43:37m$devBranch\033[0m \033[0m"
echo -e "\033[37m ########## Components \033[43:37m[${#Components[@]}]\033[0m${Components[@]}\n \033[0m"

for comp in ${Components[@]}
do
echo -e "\033[33m -->checkout  from $comp \033[0m"
cd $ProjectRoot/$comp

git checkout $branch
git pull origin $branch
git push origin $branch

git checkout $devBranch
git pull origin $devBranch
git merge $branch
git push origin $devBranch

git checkout $branch
git merge $devBranch
git push origin $branch
echo -e "\033[33m ########## $comp END ########## \033[0m\n"
done

echo -e "\033[37m ########## Congratulations, All done!!! ########## \033[0m\n"

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
