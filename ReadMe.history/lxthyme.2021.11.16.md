# 正常迭代

## 1116

- [x] [【药到家|IOS】新人券支持](http://jira.ibl.cn/browse/BYT-79351?filter=-1)「`damon/BYT-78490_更新商品样式`」

   **dependency:**

   1. `DJNewModuleHome`

- [x] [【到家/前端】商品列表页、凑单页等更新商品样式（APP/小程序/H5）](http://jira.ibl.cn/browse/BYT-78490) 「`damon/BYT-78490_更新商品样式`」

   **dependency:**

   1. `DJNewModuleHome`
   1. `DJActivityGoodsList`
   1. `BLCouponFloatingView`
   1. `BLRawAPIManager`: 搜索结果页替换热卖接口

- [x] [【到家/前端】确认订单页配送时间选择项设计优化（IOS）](http://jira.ibl.cn/browse/BYT-79341?filter=-1)「`damon/BYT-79341_配送时间`」

   **dependency:**

   1. DJOrderConfirm

- [x] [【到家/前端/中间件】联华大数据接口优化及埋点方案更新（IOS）](http://jira.ibl.cn/browse/BYT-79335?filter=-1)「`damon/bugfix_1116`」
   1. `DJHome`

- [ ] [【到家/前端】首页、商详页app下载提示跳转至门店首页（APP/H5）](http://jira.ibl.cn/browse/BYT-78940?filter=-1)


# 线上问题修复记录

- [x] [线上问题：未进过到家首页，直接从主站进到家商详页，加车后进购物车页面，购物车显示空，预期：应有加车的商品](http://jira.ibl.cn/browse/SIT-43786?filter=-1)

   **dependency:**
   1. `DJProductDetailView` 「`damon/SIT-43786\_购物车`」

- [x] [听云上两个到家的奔溃](https://report.tingyun.com/mobile-web/#/app/25370/crash)

   > `BaiLianMobileApp ___45-[DJSCMainViewController(Event) deleteGoods:]_block_invoke.257 (DJSCMainViewController+Event.m:332)`

   **dependency:**
	1. `DJShoppingCartModule`「`damon/bugfix_1116`」

- [x] [82661216](https://report.tingyun.com/mobile-web/#/detail/crashDetail?mobileAppId=25370&endTime=2021-10-25%2014:7&timePeriod=43200&crashReportId=0&mobileCrashId=82661216&mobileAppVersionId=&mobileAppVersionFilterId=&agentType=1&mobileAppVersionIdStr=)

	> `unable to dequeue a cell with identifier DJBigDataGuessLikeModelCells - must register a nib or a class for the identifier or connect a prototype cell in a storyboard`

	**dependency:**
	1. `DJNewModuleHome`「`damon/BYT-78490_更新商品样式`」

- [x] [81758031](https://report.tingyun.com/mobile-web/#/detail/crashDetail?mobileAppId=25370&endTime=2021-10-25%2014:10&timePeriod=43200&crashReportId=0&mobileCrashId=81758031&mobileAppVersionId=&mobileAppVersionFilterId=&agentType=1&mobileAppVersionIdStr=)
	> `BaiLianMobileApp -[DJClassifyListSlidingViewController selectedIndexViewController:] (DJClassifyListSlidingViewController.m:0)`

	**dependency:**
	1. `DJClassifyList`「`damon/bugfix_1116`」

- [x] [81847380](https://report.tingyun.com/mobile-web/#/detail/crashDetail?mobileAppId=25370&endTime=2021-10-25%2014:10&timePeriod=43200&crashReportId=0&mobileCrashId=81847380&mobileAppVersionId=&mobileAppVersionFilterId=&agentType=1&mobileAppVersionIdStr=)
	> `BaiLianMobileApp -[DJRegeoAddressReformer manager:reformData:] (DJRegeoAddressReformer.m:71)`

	**dependency:**
	1. `DJChooseAddressView`「`damon/bugfix_1116`」

- [x] 订单列表未登录时跳转异常情况「`damon/bugfix_1116`」

	**dependency:**
	1. `BLDaoJia`
	1. `DJOrderListView`

- [x] 印花
   1. 登录
   2. 新的配置方法

- [x] 头部四样式问题 -> `DJNewModuleHome`
- [x] 猜你喜欢大图
   1. 首页
   2. 购物车
   3. 订单

- [x] 新人券

   **dependency:**
   1. `DJNewModuleHome`「damon/优惠券添加过滤器」

- [ ] 进店逻辑「`damon/bugfix_1116_进店逻辑_v2`」

   **dependency:**
   1. `DJGlobalStoreManager`
   1. `DJNewModuleHome`

# duyingfeng

1116需求发版

1. 接口的header中的phoneid字段改为手机号的MD5

origin/master_1116_dyf_phoneid

BLRawAPIManager

2. 线上问题修复：

origin/master_1116_dyf_bugfix

DJNewModuleHome

DJProductDetailView

DJActivityGoodsList

BLDaoJia

============================

3. 购物车猜你喜欢重构

origin/master_1116_dyf_guessYouLike

DJShoppingCartModule


1. 退出登录时 token 没有失效
- [x] 首页底部 tabbar 图标跟随骨架屏一起切换
- [x] 门店 10 个字时不应该有 `...`
- [x] 头部:
   1. 三角大小不对
   2. 三角背景不显示
- [x] 骨架屏 细线
- [x] 头部组件高度(刘海)
- [x] 猜你喜欢背景
- [x] 分类球 10 个时没有新的进度条
- [x] 轮播应该没有间隔(确认)
- [x] 分类进度条没有滑到底
2. 状态栏颜色
- [x] 优惠券弹窗 - 已领取样式, plus标签「验证」
- [x] header 左右间隔 + 上下间隔
1. 价格 . = 小数样式
- [x] 导航栏 -> 右侧按钮

- [x] 头部四 -> 白背景 -> 标题颜色 + 气泡颜色
- [x] 标题>10 时, 9 个字+...
3. 瀑布流:
   1. 间隔
   2. 底色去掉
   3. 悬浮时标题居中

1. 商品组件 -> 标签底部间隔

1. 商品组件仅 3 个时自带间隔
- [x] 吉买盛 -> 5 * 2 = 2 * 2


1. 商品列表
   1. 整体居中
   1. 加号贴边
   3. 食谱
   3. 搜索图标

订单列表 - 猜你喜欢:
   1. 细线
   2. 灰底样式
1. 营业资质展示不全
1. 骨架屏: tabbar 应显示默认样式
1. tabbar: 添加细线


new:
1. BLCouponFloatingView 167
1. DJNewModuleHome 263
1. DJOrderListView 144
1. DJBusinessTools 5
1. DJActivityGoodsList 153