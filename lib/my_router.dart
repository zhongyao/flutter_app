
import 'package:flutter/cupertino.dart';
import 'package:startup_namer/page/anim_page.dart';
import 'package:startup_namer/page/entrance_page.dart';
import 'package:startup_namer/page/hit_test_behavior_page.dart';
import 'package:startup_namer/page/navigator_page.dart';
import 'package:startup_namer/page/navigator_page_b.dart';
import 'package:startup_namer/page/notification_page.dart';
import 'package:startup_namer/page/notification_page2.dart';
import 'package:startup_namer/page/riverpod_page.dart';
import 'package:startup_namer/page/riverpod_page2.dart';
import 'package:startup_namer/page/riverpod_page3.dart';
import 'package:startup_namer/page/riverpod_page4.dart';
import 'package:startup_namer/page/scroll_page.dart';
import 'package:startup_namer/page/tab_bar_view_page.dart';
import 'package:startup_namer/page/test_widget_page.dart';
import 'package:startup_namer/page/touch_event_page.dart';
import 'package:startup_namer/page/video_player_page.dart';
import 'package:startup_namer/page/web_view_page.dart';
import 'package:startup_namer/page/widget/custom_scroll_view_widget.dart';
import 'package:startup_namer/page/widget/nested_scroll_view_widget.dart';
import 'package:startup_namer/page/widget/video_player_full_screen.dart';
import 'package:startup_namer/util/router.dart';
import 'package:startup_namer/widget/inheritedwidget/inherited_widget_test_route.dart';

class MyRouter {
  ///私有构造函数
  MyRouter._internal();

  ///单例
  static final MyRouter _instance = MyRouter._internal();

  static MyRouter get instance => _instance;

  ///各页面的路由
  Map<String, WidgetBuilder> routers() {
    Map<String, WidgetBuilder> routers = {
      RouterPath.entrancePage: (context) => const EntrancePage(),
      RouterPath.navigatorPage: (context) => const NavigatorPage(),
      RouterPath.navigatorPageB: (context) => const NavigatorPageB(),
      RouterPath.customScrollView: (context) => const CustomScrollViewWidget(),
      RouterPath.notificationPage: (context) => const NotificationPage(),
      RouterPath.notificationPage2: (context) => const NotificationPage2(),
      RouterPath.nestedScrollViewWidget: (context) => const NestedScrollViewWidget(),
      RouterPath.easyRefreshNestedScrollViewPage: (context) => const ScrollPage(),
      RouterPath.animPage: (context) => const AnimPage(),
      RouterPath.testWidgetPage: (context) => const TestWidgetPage(),
      RouterPath.inheritedWidgetPage: (context) =>
          const InheritedWidgetTestPage(),
      RouterPath.touchEventPage: (context) => const TouchEventPage(),
      RouterPath.videoPlayerPage: (context) => const VideoPlayerPage(),
      RouterPath.videoPlayerFullPage: (context) => const VideoPlayerFullScreen(),
      RouterPath.tabBarViewPage: (context) => const TabBarViewPage(),
      RouterPath.hitTestBehaviorPage: (context) => const HitTestBehaviorPage(),
      RouterPath.riverPodPage: (context) => const RiverPodPage(),
      RouterPath.riverPodPage2: (context) => const RiverPodPage2(),
      RouterPath.riverPodPage3: (context) => const RiverPodPage3(),
      RouterPath.riverPodPage4: (context) => const RiverPodPage4(),
      RouterPath.webViewPage: (context) => const WebViewPage(),
    };
    return routers;
  }
}
