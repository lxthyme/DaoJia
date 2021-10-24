#!/usr/local/bin/bash -e

info="$1"
info=(${info[0]})
dependencyBranch_str="$2"
dependencyBranch_str=(${dependencyBranch_str[0]})

declare -A dependencyBranch
for i in "${dependencyBranch_str[@]}"; do
  key=$(echo $i | awk -F'=' '{print $1}')
  value=$(echo $i | awk -F'=' '{print $2}')
  dependencyBranch[$key]=$value
done

branch=${info[0]}
devBranch=${info[1]}
# branch=$1
# Components=("$2")
Components=(${info[@]:2})

ProjectRoot=$(
  cd "$(dirname "$0")"
  pwd
)

echo "ProjectRoot: $ProjectRoot"

echo -e "\ninfo: ${info[@]}"
echo -e "\ndependencyBranch_str: ${dependencyBranch_str[@]}"
echo -e "dependencyBranch: ${dependencyBranch[@]}"
for comp in $(echo ${!dependencyBranch[*]}); do
  value=${dependencyBranch[$comp]}
  echo "$comp: $value"
done
echo -e "\nbranch: ${branch}"
echo -e "devBranch: ${devBranch}"
echo -e "Components: ${Components[@]}"

read -n1 -p "❓是否合并到开发分支($branch => $devBranch)?(Y | y)" needMergeToDevBranch
case $needMergeToDevBranch in
Y | y)
  echo -e "\n\033[37m👉合并到开发分支($branch => $devBranch)!\033[0m"
  ;;
*)
  echo -e "\n\033[37m❗Skip to 合并到开发分支($branch => $devBranch)!\033[0m"
  ;;
esac

read -n1 -p "❓是否更新 $branch 代码($branch <= $devBranch)?(Y | y)" needMergeToBranch
case $needMergeToBranch in
Y | y)
  echo -e "\n\033[37m👉更新 $branch 代码($branch <= $devBranch)\033[0m"
  ;;
*)
  echo -e "\n\033[37m❗Skip to 更新 $branch 代码($branch <= $devBranch)!\033[0m"
  ;;
esac

read -p "❓最后切换到分支?(default: $branch) " checkoutBranch
checkoutBranch=${checkoutBranch:-$branch}
echo -e "\033[37m👉最后切换到分支: ${checkoutBranch}\033[0m"

echo -e "\033[37m\n########## branch: \033[43:37m$branch\033[0m devBranch: \033[43:37m$devBranch\033[0m11\033[0m"
echo -e "\033[37m########## Components \033[43:37m[${#Components[@]}]\033[0m${Components[@]}\033[0m"

for comp in ${Components[@]}; do
  echo -e "\n\033[33m👍-->checkout  from $comp\033[0m"
  cd $ProjectRoot/$comp
  git remote set-branches origin '*'
  git fetch

  git checkout $branch
  git pull origin $branch
  git push origin $branch

  case $needMergeToDevBranch in
  Y | y)
    echo -e "\033[37m\n「${comp}」$branch => $devBranch\033[0m"
    git checkout $devBranch
    git pull origin $devBranch
    git merge $branch
    git push origin $devBranch
    echo -e "\033[37mDone!\033[0m"
    ;;
  *) ;;

  esac

  case $needMergeToBranch in
  Y | y)
    echo -e "\033[37m\n「${comp}」$branch <= $devBranch\033[0m"
    git checkout $branch
    git merge $devBranch
    git push origin $branch
    echo -e "\033[37mDone!\033[0m"
    ;;
  *) ;;

  esac

  echo -e "\n\033[37mCheckout to $checkoutBranch...\033[0m"
  git checkout $checkoutBranch

  echo -e "\033[37m\n「${comp}」Done!\033[0m"
  echo -e "\033[33mcheckout $comp Done!\033[0m"

done

for comp in $(echo ${!dependencyBranch[*]}); do
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
Y | y)
  echo -e "\n\033[37m########## pod install\033[0m"
  cd $ProjectRoot/BaiLian
  pod install
  ;;
*)
  echo -e "\n\033[37mSkip to execute pod install!\033[0m"
  ;;
esac
