# 2021-12-30

## 迭代内容

### 「`damon/BYT-79812_联华融合`」

1. `DJNewModuleHome`
2. `DJOrderConfirm`
3. `DJProductDetailView`
4. `DJActivityGoodsList`
5. `DJOrderListView`

### 「`damon/BYT-79779_广告备案号`」

1. `DJProductDetailView`
2. `DJBusinessTools`

## 线上问题

### [线上问题：骑手地图问题汇总](http://jira.ibl.cn/browse/SIT-44818)

CustomCalloutView
待商家拣货

DJOrderDetailController
BLGoodsDeliveryMapViewController
DJNewOrderListDetailBottomView

### 历史订单

> 1. `DJOrderListView`
> 1. `BLOrder` `damon/bugfix_20211230`

https://wiki.ibl.cn/pages/viewpage.action?pageId=47384977

跳转到家订单详情页 scheme 更新：
子单详情页：blmodule://quickHome/orderDetail?orderNo=LAZ20190709214103&oneYearAgoFlag=0

oneYearAgoFlag: 查询一年前订单标识，传 1 使用历史订单详情接口

### 券适用商品页
tdType = 1

### 订单确认页券查询优化
// TODO:「lxthyme」💊orderSubTypeCode
1. `BLBusinessCategoryRouterCenter`
1. `BLFlutterRouterManager`


#### backup
https://dj.st.bl.com/dj-api/kdj/djcart/calDelivery.htm 计算运费
https://dj.st.bl.com/dj-api/kdj/djcart/queryCouponsV2.htm 查券

计算运费的返回：deliveryInfoList 大于等于2

![](media/16400840984152/16400841155754.jpg)

```java
private String initialWeight;baseGroupFreight
private String deliveryCharge;groupFreight
private String groupId;  groupId
```

### 支付成功后"查看订单"跳转错误
支付成功
DJNormalPaySuccessViewController
DJPaySuccessTopCell
DJPaySuccessDetailCell
DJPaySuccessResourceCollectionViewCell

DJPrescriptionMedicinePaySuccessVC

DJPaySuccessViewControllerWithOrderType

## 优化

### tabbar 无模板时不隐藏

1. `BLDaoJia` ` damon/bugfix_20211230`

### 分类页左侧列表背景测调整

1. `DJClassifyList` `damon/bugfix_20211230`

### 头部四: B2C&O2O, All&O2O, 各间隔调整为 20px

## iOS15 适配

DJOrderChooseDeliveryTimeView.m
DJStockoutAlertView.m
DJAmapForMapTypeSelectedView.m

DJCancelOrderView.m
DJOrderConfirmRuleAlertView.m

```objc

#import <DJBusinessTools/UITableView+Adapter.h>

[_tableView adapterWithParentVC:self];


import: 68
fun: 74

```

DJCouponTableView
DJBaseTableView
DJPageListMainTableView
DJScanBarcideShoppingCartTableView

DJCouponTableView
DJBaseTableView
DJPageListMainTableView
DJScanBarcideShoppingCartTableView

「`damon/iOS15`」

1. `BLOrder`
1. `BLCouponFloatingView`
1. `BLCancelOrderView`
1. `BLOrderConfirmRuleAlertView`

1. `DJNewModuleHome`
1. `DJOrderConfirm`
1. `DJProductDetailView`
1. `DJActivityGoodsList`
1. `DJOrderListView`
1. `DJClassifyList`
1. `DJShoppingCartModule`
1. `DJHome`
1. `DJChooseAddressView`
1. `DJStoreList`
1. `DJAddressManageModule`
1. `DJScanBarcodeOrderConfirm`
1. `DJScanBarcodeView`
1. `DJAMapForStoreList`
1. `DJGoodsStatusAlertView`
1. `DJOrderChooseDeliveryTimeView`
1. `DJPaySuccessful`
1. `DJBusinessTools`

## TODO

更新地址，电话时要更新发票信息

- [x] 发票信息最多 2 行
- [x] 分类页头部, All + O2O 时, 隐藏顶部 tab
- [x] tabbar 无模板时也要展示
- [ ] 药到家半小时达???
	> DJGoodsDetailDeliveryCell
- [x] 登录二次不出现
- [x] 添加托底商品提示已下架

DJNoLocationView
DJBottomBarView
shopTempletQueryAPIManager
templetQueryByIdAPIManager



## Record
