import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/util/print_util.dart';

///手势事件页
class TouchEventPage extends StatefulWidget {
  const TouchEventPage({super.key});

  @override
  State<StatefulWidget> createState() => _TouchEventPageState();
}

class _TouchEventPageState extends CommonPageState<TouchEventPage> {
  String _operation = "No Gesture detected!"; //保存事件名
  double top = 0.0; //距顶部的偏移
  double left = 0.0; //距左边的偏移
  double _width = 200.0; //通过修改图片宽度来达到缩放效果
  bool _toggle = false; //变色开关
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  Widget buildPageContent(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          //点击事件
          // getGestureDetectorWidget(context),
          // GestureRecognizer: GestureDetector的内部实现类
          getGestureRecognizer(context)
        ],
      ),
    );
    //滑动事件
    // return getGestureDetectorDrag(context);
  }

  Widget getGestureDetectorWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 200.0,
        height: 100.0,
        child: Text(
          _operation,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      // 当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，会有200毫秒左右的延时，
      // 这是因为当用户点击完之后很可能会再次点击以触发双击事件，所以GestureDetector会等一段时间来确定是否为双击事件。
      // 如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时。
      onTap: () => refreshText("onTap"),
      onDoubleTap: () => refreshText("onDoubleTap"),
      onLongPress: () => refreshText("onLongPress"),
    );
  }

  refreshText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

  Widget getGestureDetectorDrag(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: top,
            left: left,
            child: GestureDetector(
              // child: const CircleAvatar(child: Text("A")),
              //手指按下时会触发此回调
              // onPanDown: (DragDownDetails e) =>
              //     PrintUtil.print("用户手指按下：${e.globalPosition}"),
              // //手指滑动时会触发此回调
              // onPanUpdate: (DragUpdateDetails e) {
              //   setState(() {
              //     left += e.delta.dx;
              //     top += e.delta.dy;
              //     PrintUtil.print("用户手指移动：${e.globalPosition}");
              //   });
              // },
              // onPanEnd: (DragEndDetails e) {
              //   //打印滑动结束时在x、y轴上的速度
              //   PrintUtil.print("用户手指抬起：${e.velocity}");
              // },

              //只在水平方向拖动
              // onHorizontalDragUpdate: (DragUpdateDetails e) {
              //   setState(() {
              //     left += e.delta.dx;
              //   });
              // },
              //只在垂直方向拖动
              // onVerticalDragUpdate: (DragUpdateDetails e) {
              //   setState(() {
              //     top += e.delta.dy;
              //   });
              // },

              //缩放
              child: Image.asset("images/pic12.jpg", width: _width),
              onScaleUpdate: (ScaleUpdateDetails e) {
                setState(() {
                  //缩放倍数在0.8到3倍之间
                  _width = 200 * e.scale.clamp(.8, 3);
                });
              },

            ))
      ],
    );
  }

  Widget getGestureRecognizer(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(
          children: <TextSpan>[
            const TextSpan(text: "哈哈哈"),
            TextSpan(text: "点我变色",
                style: TextStyle(color: _toggle ? Colors.blue : Colors.green),
                recognizer: _tapGestureRecognizer
                  ..onTap = () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  }),
            const TextSpan(text: "呵呵呵")
          ]
      )),
    );
  }

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源（主要是取消内部的计时器）
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
}
