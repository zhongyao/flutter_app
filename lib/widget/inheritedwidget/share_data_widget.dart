import 'package:flutter/cupertino.dart';

class ShareDataWidget extends InheritedWidget {
  final int data; //需要在子树中共享的数据，保存点击次数

  const ShareDataWidget({super.key, required this.data, required super.child});

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}
