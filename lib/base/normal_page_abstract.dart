import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

mixin NormalPageAbstract {
  // 状态管理注入
  // Provider 使用参考:https://flutter.cn/docs/development/data-and-backend/state-mgmt/simple
  List<SingleChildWidget> get getProviders => [];

  // 防止页面被键盘等底部空间遮挡 为true时键盘弹出 整体页面会重绘保证页面不被键盘遮挡
  bool get resizeToAvoidBottomInset => true;

  // 返回 true 则页面高度会扩展到 titlebar 与 bottombar 区域
  bool get isExtendBodyBehindAppBar => false;

  // 是否保持页面状态，即页面调用deactivity后再次添加到Element中后状态是否保持
  bool get needKeepAlive => false;

  // 底部导航
  Widget? getBottomNavigationBar(BuildContext context) {
    return null;
  }

  // 可以在子类必须重写此方法来构建页面内容
  Widget buildPageContent(BuildContext context);

  // 顶部是否保持安全间距
  bool get safeTop => true;

  // 页面底部安全距离是否保持
  bool get safeBottom => true;

  // 页面背景颜色 默认bg3
  Color get pageBackgroundColor => Colors.white;

  // 获取到页面传递的参数
  void getArguments(Object? arguments) {}
}
