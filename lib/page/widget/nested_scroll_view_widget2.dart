import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../delegate/sticky_tabbar_delegate.dart';

///NestedScrollView示例2
///参考：https://book.flutterchina.club/chapter6/nestedscrollview.html#_6-12-1-nestedscrollview
class NestedScrollViewWidget2 extends StatefulWidget {
  const NestedScrollViewWidget2({super.key});

  @override
  State<StatefulWidget> createState() => _NestedScrollViewWidget2State();
}

class _NestedScrollViewWidget2State extends State<NestedScrollViewWidget2>
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
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle:
              NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                // expandedHeight: 200,
                toolbarHeight: 200,
                // title: const Text('商城'),
                title: const Column(
                  children: [
                    Text('商城'),
                    Text('***'),
                    Text('***'),
                    Text('***'),
                    Text('***'),
                    Text('哈哈哈')
                  ],
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
                  controller: this._tabController,
                  tabs: const <Widget>[
                    Tab(text: '资讯'),
                    Tab(text: '技术'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: this._tabController,
          children: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        //创建列表项
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100 * (index % 9)],
                        child: Text('list----- item $index'),
                      );
                    },
                    childCount: 20,
                  ),
                  itemExtent: 50),
            ),
            SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverGrid(
                    //Grid
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      childCount: 20,
                    ))),
          ],
        ),
      ),
    );
  }
}
