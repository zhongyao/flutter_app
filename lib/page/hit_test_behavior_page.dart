import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/util/print_util.dart';

///HitTest事件分发
class HitTestBehaviorPage extends ConsumerStatefulWidget {
  const HitTestBehaviorPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HitTestBehaviorPageState();
}

class _HitTestBehaviorPageState extends CommonPageState<HitTestBehaviorPage> {
  @override
  Widget buildPageContent(BuildContext context) {
    return Column(
      children: [getHitTestBehaviorRow(), getWaterMaskTest()],
    );
  }

  //HitTestBehavior:
  // 它有三个取值，分析一下不同取值的作用：
  // 1、behavior 为 deferToChild 时，hitTestSelf 返回 false，
  // 当前组件是否能通过命中测试完全取决于 hitTestChildren 的返回值。
  // 也就是说只要有一个子节点通过命中测试，则当前组件便会通过命中测试。

  // 2、behavior 为 opaque 时，hitTestSelf 返回 true，hitTarget 值始终为 true，当前组件通过命中测试。

  // 3、behavior 为 translucent 时，hitTestSelf 返回 false，
  // hitTarget 值此时取决于 hitTestChildren 的返回值，但是无论 hitTarget 值是什么，
  // 当前节点都会被添加到 HitTestResult 中。

  // 注意，behavior 为 opaque 和 translucent 时当前组件都会通过命中测试，
  // 它们的区别是 hitTest() 的返回值（hitTarget ）可能不同，所以它们的区别就看 hitTest() 的返回值会影响什么。
  Widget getHitTestBehaviorRow() {
    return GestureDetector(
      onTap: () => {PrintUtil.print("onTap")},
      behavior: HitTestBehavior.translucent,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "   子View1",
            style: TextStyle(fontSize: 14),
          ),
          Text("子View2  ", style: TextStyle(fontSize: 14))
        ],
      ),
    );
  }

  Widget getWaterMaskTest() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          wChild(1),
          wChild(2),
        ],
      ),
    );
  }

  Widget wChild(int index) {
    return Listener(
      //behavior: HitTestBehavior.opaque, // 放开此行，点击只会输出 2
      behavior: HitTestBehavior.translucent, // 放开此行，点击会同时输出 2 和 1
      onPointerDown: (e) => PrintUtil.print(index.toString()),
      child: SizedBox.expand(),
      // child: Container(
      //   width: 100,
      //   height: 100,
      //   color: Colors.grey,
      // ),
    );
  }
}
