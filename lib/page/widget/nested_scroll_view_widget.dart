import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../delegate/sticky_tabbar_delegate.dart';

///NestedScrollView示例
///参考：https://book.flutterchina.club/chapter6/nestedscrollview.html#_6-12-1-nestedscrollview
class NestedScrollViewWidget extends StatefulWidget {
  const NestedScrollViewWidget({super.key});

  @override
  State<StatefulWidget> createState() => _NestedScrollViewWidgetState();
}

class _NestedScrollViewWidgetState extends State<NestedScrollViewWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _listCount = 20;
  int _gridCount = 20;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> _tabs = ['资讯', '技术'];
    // 构建 tabBar
    return Scaffold(
      body: EasyRefresh.builder(
        controller: EasyRefreshController(),
        header: const ClassicHeader(
          clamping: true,
          position: IndicatorPosition.locator,
          mainAxisAlignment: MainAxisAlignment.end,
          dragText: 'Pull to refresh',
          armedText: 'Release ready',
          readyText: 'Refreshing...',
          processingText: 'Refreshing...',
          processedText: 'Succeeded',
          noMoreText: 'No more',
          failedText: 'Failed',
          messageText: 'Last updated at %T',
        ),
        footer: const ClassicFooter(
          position: IndicatorPosition.locator,
          dragText: 'Pull to load',
          armedText: 'Release ready',
          readyText: 'Loading...',
          processingText: 'Loading...',
          processedText: 'Succeeded',
          noMoreText: 'No more',
          failedText: 'Failed',
          messageText: 'Last updated at %T',
        ),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                if (_tabController.index == 0) {
                  _listCount = 20;
                } else {
                  _gridCount = 20;
                }
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                if (_tabController.index == 0) {
                  _listCount += 10;
                } else {
                  _gridCount += 10;
                }
              });
            }
          });
        },
        childBuilder: (context, physics) {
          return ScrollConfiguration(
            behavior: const ERScrollBehavior(),
            // ExtendNestedScrollView
            child: NestedScrollView(
              physics: physics,
              // onlyOneScrollInBody: true,
              // pinnedHeaderSliverHeightBuilder: () {
              // return MediaQuery.of(context).padding.top + kToolbarHeight;
              // return 0;
              // },
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  const HeaderLocator.sliver(clearExtent: false),
                  //如果希望使用SliverOverlapAbsorber，那么外层嵌套的须是NestedScrollView，而不是ExtendNestedScrollView，否则会报错：
                  //NestedScrollView 报错 NestedScrollView.sliverOverlapAbsorberHandleFor must be called with a context that contains a NestedScrollView.
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      toolbarHeight: 0,
                      // title: const Text(''),
                      floating: true,
                      snap: true,
                      forceElevated: innerBoxIsScrolled,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Text('商城'),
                        Text('***'),
                        Text('哈哈'),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyTabBarDelegate(
                      child: TabBar(
                        labelColor: Colors.black,
                        controller: _tabController,
                        tabs: <Widget>[
                          Tab(text: _tabs[0]),
                          Tab(text: _tabs[1]),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: _tabs.map((String name) {
                  return Builder(
                    builder: (BuildContext context) {
                      return CustomScrollView(
                        physics: physics,
                        key: PageStorageKey<String>(name),
                        slivers: <Widget>[
                          // 将子部件同 `SliverAppBar` 重叠部分顶出来，否则会被遮挡
                          //如果希望使用SliverOverlapInjector，那么外层嵌套的须是NestedScrollView，而不是ExtendNestedScrollView，否则会报错：
                          //NestedScrollView 报错 NestedScrollView.sliverOverlapAbsorberHandleFor must be called with a context that contains a NestedScrollView.
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(8.0),
                            sliver: SliverFixedExtentList(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return Container(
                                      //创建列表项
                                      alignment: Alignment.center,
                                      color:
                                          Colors.lightBlue[100 * (index % 9)],
                                      child: Text('list item $index'),
                                    );
                                  },
                                  childCount: name == _tabs[0] ? 20 : 15,
                                ),
                                itemExtent: 50),
                          ),
                          SliverPadding(
                              padding: const EdgeInsets.all(8.0),
                              sliver: SliverGrid(
                                  //Grid
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, //Grid按两列显示
                                    mainAxisSpacing: 10.0,
                                    crossAxisSpacing: 10.0,
                                    childAspectRatio: 4.0,
                                  ),
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      //创建子widget
                                      return Container(
                                        alignment: Alignment.center,
                                        color: Colors.cyan[100 * (index % 9)],
                                        child: Text('grid item $index'),
                                      );
                                    },
                                    childCount: name == _tabs[0] ? 20 : 15,
                                  ))),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
