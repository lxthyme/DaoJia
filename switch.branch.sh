#!/usr/local/bin/bash -e
#!/bin/bash -e

ProjectRoot='/Users/lxthyme/Desktop/Lucky/BL-gitlab/DaoJia'
# ProjectRoot='/Users/lxthyme/Desktop/Lucky/Work/BL/DaoJia'

declare -A dependencyBranch

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

# 新首页
info_NewModuleHome=(damon_dev master_1015
DJNewModuleHome BLDaoJia DJHome BLCouponFloatingView DJStoreList
DJiOSAppImages BLiOSAppImages)

# BYT-78838-集字浏览任务
info_BYT_78838=(damon/BYT-78838-集字浏览任务 master_1015
DJNewModuleHome BLDaoJia DJHome
# dependency
# BLHomePageViewComponents BLAPIManagers
)
dependencyBranch['BaiLian']='develop'
dependencyBranch['BLHomePageViewComponents']='master'
dependencyBranch['BLAPIManagers']='master'
dependencyBranch['BLMapModule']='master'

# info=(${info_ALL[@]})
info=(${info_NewModuleHome[@]})
# info=(${info_BYT_78838[@]})
branch=${info[0]}
devBranch=${info[1]}
Components=(${info[@]:2})

read -n1 -p "是否将本地代码($branch)合并到开发分支 $devBranch?(Y | y)" needMergeToDevBranch
case $needMergeToDevBranch in
(Y | y)
  echo -e "\n\033[37m$branch => $devBranch\033[0m"
  ;;
(*)
  echo -e "\n\033[37mSkip to 更新本地代码!\033[0m"
  ;;
esac

read -n1 -p "是否拉取开发分支($devBranch)代码?(Y | y)" needMergeToBranch
case $needMergeToBranch in
(Y | y)
  echo -e "\n\033[37m$branch => $devBranch\033[0m"
  ;;
(*)
  echo -e "\n\033[37mnSkip to 拉取开发分支($devBranch)代码!\033[0m"
  ;;
esac

read -p "最后切换到分支?(default: $branch) " checkoutBranch
checkoutBranch=${checkoutBranch:-$branch}
echo -e "\n\033[37m最后切换到分支: $checkoutBranchy\033[0m"


echo -e "\033[37m\n########## branch: \033[43:37m$branch\033[0m devBranch: \033[43:37m$devBranch\033[0m11\033[0m"
echo -e "\033[37m########## Components \033[43:37m[${#Components[@]}]\033[0m${Components[@]}\033[0m"

for comp in ${Components[@]}
do
echo -e "\n\033[33m-->checkout  from $comp\033[0m"
cd $ProjectRoot/$comp
git remote set-branches origin '*'
git fetch

git checkout $branch
git pull origin $branch
git push origin $branch

case $needMergeToDevBranch in
(Y | y)
  echo -e "\033[37m\n「${comp}」$branch => $devBranch\033[0m"
  git checkout $devBranch
  git pull origin $devBranch
  git merge $branch
  git push origin $devBranch
  ;;
(*)
  ;;
esac

case $needMergeToBranch in
(Y | y)
  echo -e "\033[37m\n「${comp}」$branch => $devBranch\033[0m"
  git checkout $branch
  git merge $devBranch
  git push origin $branch
  ;;
(*)
  ;;
esac

git checkout $checkoutBranch

echo -e "\033[37m\n「${comp}」Done!\033[0m"
echo -e "\033[33mcheckout $comp Done!\033[0m"

done


for comp in $(echo ${!dependencyBranch[*]})
do
  cbranch=${dependencyBranch[$comp]}
  echo -e "\n\033[37m-->checkout dependency: $comp: $cbranch\033[0m"
  cd $ProjectRoot/$comp
  git remote set-branches origin '*'
  git fetch
  git checkout $cbranch

  echo -e "\033[37mDone!\033[0m"
done


echo -e "\033[37m\n########## Congratulations, All done!!!##########\n\033[0m"

read -n1 -p "是否执行 pod install?(Y | y)" needInstall
case $needInstall in
(Y | y)
  echo -e "\n\033[37m########## pod install\033[0m"
  cd $ProjectRoot/BaiLian
  pod install
  ;;
(*)
  echo -e "\n\033[37mSkip to execute pod install!\033[0m"
  ;;
esac
