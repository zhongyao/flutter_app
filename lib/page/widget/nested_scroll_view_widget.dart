import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../delegate/sticky_tabbar_delegate.dart';

///NestedScrollView示例2
///参考：https://book.flutterchina.club/chapter6/nestedscrollview.html#_6-12-1-nestedscrollview
class NestedScrollViewWidget extends StatefulWidget {
  const NestedScrollViewWidget({super.key});

  @override
  State<StatefulWidget> createState() => _NestedScrollViewWidgetState();
}

class _NestedScrollViewWidgetState extends State<NestedScrollViewWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final _tabs = <String>['猜你喜欢','今日特价', '发现更多'];
    // 构建 tabBar
    return Material(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    // expandedHeight: 200,
                    toolbarHeight: 200,
                    // title: const Text('商城'),
                    title: const Column(
                      children: [Text('商城'), Text('***'), Text('哈哈哈')],
                    ),
                    floating: true,
                    snap: true,
                    forceElevated: innerBoxIsScrolled,
                    // bottom: TabBar(
                    //   tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                    // ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: StickyTabBarDelegate(
                    child: TabBar(
                      labelColor: Colors.black,
                      controller: _tabController,
                      tabs: const <Widget>[
                        Tab(text: '资讯'),
                        Tab(text: '技术'),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(controller: _tabController, children: <Widget>[
              ListView.builder(
                  itemCount: 17,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      alignment: Alignment.center,
                      color: Colors.cyan[100 * (index % 9)],
                      child: Text('grid item $index'),
                    );
                  }),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 15,
                      alignment: Alignment.center,
                      color: Colors.cyan[100 * (index % 9)],
                      child: Text('grid item $index'),
                    );
                  })
            ])));
  }
}
