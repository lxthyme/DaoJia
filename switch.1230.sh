#!/usr/local/bin/bash -e

declare -A dependencyBranch

## 迭代内容

### 「`damon/BYT-79812_联华融合`」

dependencyBranch['DJNewModuleHome'] = 'damon/BYT-79812_联华融合'
dependencyBranch['DJOrderConfirm'] = 'damon/BYT-79812_联华融合'
dependencyBranch['DJProductDetailView'] = 'damon/BYT-79812_联华融合'
dependencyBranch['DJActivityGoodsList'] = 'damon/BYT-79812_联华融合'
dependencyBranch['DJOrderListView'] = 'damon/BYT-79812_联华融合'

### 「`damon/BYT-79779_广告备案号`」

# dependencyBranch['DJProductDetailView'] = 'damon/BYT-79779_广告备案号'
dependencyBranch['DJBusinessTools'] = 'damon/BYT-79779_广告备案号'

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
