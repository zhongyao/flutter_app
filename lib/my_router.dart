
import 'package:flutter/cupertino.dart';
import 'package:startup_namer/page/anim_page.dart';
import 'package:startup_namer/page/entrance_page.dart';
import 'package:startup_namer/page/hit_test_behavior_page.dart';
import 'package:startup_namer/page/scroll_page.dart';
import 'package:startup_namer/page/tab_bar_view_page.dart';
import 'package:startup_namer/page/test_page.dart';
import 'package:startup_namer/page/test_widget_page.dart';
import 'package:startup_namer/page/touch_event_page.dart';
import 'package:startup_namer/page/video_player_page.dart';
import 'package:startup_namer/page/widget/custom_scroll_view_widget.dart';
import 'package:startup_namer/page/widget/nested_scroll_view_widget.dart';
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
      RouterPath.customScrollView: (context) => const CustomScrollViewWidget(),
      RouterPath.nestedScrollViewWidget: (context) => const NestedScrollViewWidget(),
      RouterPath.easyRefreshNestedScrollViewPage: (context) => const ScrollPage(),
      RouterPath.animPage: (context) => const AnimPage(),
      RouterPath.testWidgetPage: (context) => const TestWidgetPage(),
      RouterPath.inheritedWidgetPage: (context) =>
          const InheritedWidgetTestPage(),
      RouterPath.touchEventPage: (context) => const TouchEventPage(),
      RouterPath.videoPlayerPage: (context) => const VideoPlayerPage(),
      RouterPath.tabBarViewPage: (context) => const TabBarViewPage(),
      RouterPath.hitTestBehaviorPage: (context) => const HitTestBehaviorPage()
    };
    return routers;
  }
}
