#!/usr/local/bin/bash -e

declare -A dependencyBranch

# 新首页
info_NewModuleHome=(damon_dev master_1015
  DJNewModuleHome BLDaoJia DJHome BLCouponFloatingView DJStoreList BLRawAPIManager
  DJiOSAppImages BLiOSAppImages)

# BYT-78838-集字浏览任务
info_BYT_78838=(damon/BYT-78838-集字浏览任务 master_1015
  DJNewModuleHome BLDaoJia DJHome

  # dependency
  # BLHomePageViewComponents BLAPIManagers
)
# dependencyBranch['BaiLian']='develop'
dependencyBranch['BaiLian']='master'
dependencyBranch['BLHomePageViewComponents']='master'
dependencyBranch['BLAPIManagers']='master'
dependencyBranch['BLMapModule']='master'
dependencyBranch_str="BaiLian=master BLHomePageViewComponents=master BLAPIManagers=master BLMapModule=master"

# info=(${info_ALL[@]})
# info=(${info_NewModuleHome[@]})
# info=(${info_BYT_78838[@]})
# branch=${info[0]}
# devBranch=${info[1]}
# Components=(${info[@]:2})

params=""
for comp in $(echo ${!dependencyBranch[*]}); do
  cbranch=${dependencyBranch[$comp]}
  params+="$comp=$cbranch "
done

# info_str="${info[@]}"
info_str="${info_NewModuleHome[@]}"
dependencyBranch_str="$params"
$(
  cd "$(dirname "$0")"
  pwd
)/switch.branch.sh "$info_str" "$dependencyBranch_str"
