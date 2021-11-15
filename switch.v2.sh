#!/usr/local/bin/bash -e

declare -A dependencyBranch

# 首页改版
dependencyBranch['DJNewModuleHome']='damon/v4'
dependencyBranch['BLDaoJia']='damon/v4'
dependencyBranch['DJGlobalStoreManager']='damon/v3'
dependencyBranch['DJHome']='damon/v4'





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
