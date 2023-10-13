import 'package:flutter/material.dart';

/// 页面导航相关方法
abstract class BaseTitleBarConfigMixin {
  // 子类重写 返回false 可隐藏titlebar
  bool isHiddenAppBar() => false;

  // 子类重写 返回当前页面标题
  String? get pageTitle => null;

  // 子类实现 可覆盖TitleBar的标题部分
  Widget? get titleWidget => null;

  // 左侧按钮样式
  Widget? leftButtonWidget() {
    return null;
  }

  // titlebar 右侧按钮
  List<Widget>? rightsButtonForTitleBar() => null;

  // leftbutton Width
  double? get leftButtonWidth => null;

  // 背景颜色
  Color? get backgroundColor => null;
}
