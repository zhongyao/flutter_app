## Flutter布局【UI】
#### 1、使用PageView控件 实现仿ViewPager的滑动效果。
#### 2、PageView滑动属性【physics】设置：   
#####       BouncingScrollPhysics	允许滚动出边界，超过边界时会有回弹效果，会响应滚动事件
#####       ClampingScrollPhysics	不允许滚动出边界，会响应滚动事件
#####       AlwaysScrollableScrollPhysics	一直响应滚动事件
#####       NeverScrollableScrollPhysics	禁止滚动，不响应滚动事件
#####       FixedExtentScrollPhysics	ListWheelScrollView滚轮使用时，item都会停止在中间位置，不会停在分割线
#####       PageScrollPhysics	PageView滚轮使用时，item都会停止在一页，不会停止在分割线位置
#####       RangeMaintainingScrollPhysics	当内容突然改变尺寸时，试图将滚动位置保持在范围内的滚动物理

#### 3、[页面跳转](https://flutter.cn/docs/development/ui/navigation)：

## Flutter/Native通信：
#### 【以下是Native传值到Flutter】
#### 1、BaseFlutterActivity类实现provideFlutterEngine方法
#### 2、创建FlutterEngine实例，并将routeNameJson【json数据】通过setInitialRoute赋值【对于flutter中的window.defaultRouteName】
#### 3、通过window.defaultRouteName获取数据获取真实route数据
#### 【以下是Flutter传值到Native】
#### 4、通过定义的interaction_channel【举例】映射获取MethodChannel实例
#### 5、调用以上实例的invokeMethod(...【对应native定义的映射方法】)方法获取Native的数据。
#### [Flutter与Android通信的三种方式](https://www.jianshu.com/p/331cf2742cc6)


## Flutter页面间数据传递(共享)的几种方式：
#### 一、通过构造器的方式传递参数
#### 二、返回上一个页面是携带数据（Navigator.pop）
#### 三、InheritedWidget方式
#### 四、全局的提供数据的方式[与三类似]
#### 五、通过全局单例模式来使用
#### 六、全局单例结合Stream的方式传递数据
#### [页面数据传递参考](https://segmentfault.com/a/1190000020007938)


#### [Navigator路由跳转](https://www.cnblogs.com/mingfeng002/category/1578213.html)

#### [Flutter软键盘打开收起监听](https://pub.dev/packages/flutter_keyboard_visibility)


#### [riverpod状态管理](https://pub.dev/packages/flutter_riverpod)
#### [重走Flutter状态管理之路—Riverpod入门篇](https://cloud.tencent.com/developer/article/2004658)
#### [StateNotifierProvider举例](https://github.com/zhongyao/flutter_app/blob/master/lib/page/riverpod_page3.dart)
#### [AutoDisposeNotifierProvider举例](https://github.com/zhongyao/flutter_app/blob/master/lib/page/riverpod_page4.dart)

#### [Flutter国际化](https://www.jianshu.com/p/dd7862e8ae66)

#### [CustomScrollView + TabBar + TabBarView](https://github.com/zhongyao/flutter_app/blob/master/lib/page/widget/custom_scroll_view_widget.dart)
#### [NestedScrollView + TabBar + TabBarView](https://github.com/zhongyao/flutter_app/blob/master/lib/page/widget/nested_scroll_view_widget.dart)
#### [EasyRefresh(有注释) + NestedScrollView + TabBar + TabBarView](https://github.com/zhongyao/flutter_app/blob/master/lib/page/widget/refresh_nested_scroll_view_widget.dart)

#### [滑动事件监听NotificationListener](https://github.com/zhongyao/flutter_app/blob/master/lib/page/notification_page.dart)
#### [自定义Notification + 通知冒泡](https://github.com/zhongyao/flutter_app/blob/master/lib/page/notification_page2.dart)
#### [FittedBox适配](https://github.com/zhongyao/flutter_app/blob/master/lib/page/widget/fittedbox_test_widget.dart)
#### [Text的overflow适配--Expanded与Flexible的区别](https://github.com/zhongyao/flutter_app/blob/master/lib/page/widget/text_overflow_test_widget.dart)
#### [Text的overflow适配--Flexible与Container的aliment的使用注意事项](https://github.com/zhongyao/flutter_app/blob/master/lib/page/widget/middle_text_over_flow_widget.dart)
#### [Navigator的使用优化-PageA-打开-MyDialog-打开-PageB，然后使用popUntil导致黑屏的问题](https://github.com/zhongyao/flutter_app/blob/master/lib/router/popup/my_dialog.dart)

#### [Flutter WebView实例]