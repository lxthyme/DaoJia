# 1215

## 分支

1. 「` damon/轮播优化`」

	1. `DJNewModuleHome`

1: 走马灯
	1. showRadius: 0
		moduleHeight: 140.625
		f_picWidth: 375
		f_picHeight: 140.625
	1. showRadius: 1
		moduleHeight: 102.95999999999999
		f_picWidth: 351
		f_picHeight: 102.95999999999999
2. 卡片式轮播
	padding: 10
	moduleHeight: 163.80000000000001
	f_picWidth: 351
	f_picHeight: 163.80000000000001
3. 图片拨盘
	space: 10
	moduleHeight: 255.23280585551666
	f_picWidth: 175.4725540256677
	f_picHeight: 255.23280585551666

4: 影院轮播
	moduleHeight: 183.80000000000001
	f_picWidth: 341
	f_picHeight: 183.80000000000001
5: 海景下框
	space: 10
	moduleHeight: 183.80000000000001
	f_picWidth: 150.4971671388102
	f_picHeight: 70.232011331444767

1. `DJClassifyList`
1. `DJOrderListView`
1. `DJBusinessTools`
1. `DJNewModuleHome`


## 听云

## 听云 bug
1. [82786024](https://report.tingyun.com/mobile-web/#/detail/crashDetail?mobileAppId=25370&endTime=2021-12-2%2016:29&timePeriod=10080&crashReportId=0&mobileCrashId=82786024&mobileAppVersionId=&mobileAppVersionFilterId=&agentType=1&mobileAppVersionIdStr=)
	```js
	-[DJGoodDetailViewController managerCallAPIDidFailed:]: unrecognized selector sent to instance 0x1360ea800
	```
	1. `DJProductDetailView`: `damon/bugfix_20211215`




- [x] 价格左对齐
2. 商品标题高度计算
- [x] 分类页置顶
- [x] 订单列表页顺序不正确
- [x] 猜你喜欢尽在订单列表加载完后出现