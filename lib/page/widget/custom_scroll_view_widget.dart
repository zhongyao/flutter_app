import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/base/common_base_state.dart';

import '../delegate/sliver_header_delegate.dart';

///CustomScrollView示例
///reference:https://book.flutterchina.club/chapter6/custom_scrollview.html
class CustomScrollViewWidget extends ConsumerStatefulWidget {
  const CustomScrollViewWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<CustomScrollViewWidget> createState() {
    return _CustomScrollViewWidgetState();
  }
}

class _CustomScrollViewWidgetState
    extends CommonPageState<CustomScrollViewWidget> {
  @override
  Widget buildPageContent(BuildContext context) {
    // return Material(child: buildTwoSliverList());
    return Material(child: buildAppBarSliverList());
  }

  Widget buildTwoSliverList() {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    var listView = SliverFixedExtentList(
      itemExtent: 56, //列表项高度固定
      delegate: SliverChildBuilderDelegate(
        (_, index) => ListTile(title: Text('$index')),
        childCount: 10,
      ),
    );
    // 使用
    return CustomScrollView(
      slivers: [
        listView,
        listView,
      ],
    );
  }

  ///多个Sliver Widget组合
  Widget buildAppBarSliverList() {
    return CustomScrollView(
      slivers: <Widget>[
        //AppBar,包含一个导航栏
        SliverAppBar(
          pinned: true, // 滑动到顶端时会固定住
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("CustomScrollView示例"),
            background: Image.asset("images/pic12.jpg", fit: BoxFit.cover),
          ),
        ),
        //在实际布局中，我们通常需要往 CustomScrollView 中添加一些自定义的组件，而这些组件并非都有 Sliver 版本，
        // 为此 Flutter 提供了一个 SliverToBoxAdapter 组件，它是一个适配器：可以将 RenderBox 适配为 Sliver。
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: PageView(
              children: const [Text("page1"), Text("page2")],
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverHeaderDelegate(
            //有最大和最小高度
            maxHeight: 80,
            minHeight: 50,
            child: buildHeader(1),
          ),
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
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  //创建列表项
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
              childCount: 20,
            ),
            itemExtent: 50),
      ],
    );
  }

  // 构建 header
  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }
}
