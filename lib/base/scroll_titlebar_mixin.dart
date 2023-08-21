import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 滚动视图显示titlebar标题处理 部分逻辑
mixin ScrollTitleBarShowInHiden<T extends StatefulWidget> on State<T> {
  /// 优先解决现有问题，此处直接初始化 以下两个参数，后续有需要自定义再考怎么修改
  /// 滚动控制器
  ScrollController scrollController = ScrollController();

  /// 划出屏幕后触发逻辑的控件Key 用来获取控件相对屏幕的位置使用
  GlobalKey targetWidgetKey = GlobalKey();

  /// 用来通知页面可更改状态栏文本
  ValueNotifier<bool> isShowTitle = ValueNotifier(false);

  @override
  @mustCallSuper
  void initState() {
    scrollController.addListener(_scrollDidChange);
    super.initState();
  }

  /// 目前 GTAppBar 这个类里面的高度写死了44。 有修改再说
  double get titleBarHeight => 44.w;

  /// 状态栏高度
  double get statusBarHeight =>
      ui.window.viewPadding.top / ui.window.devicePixelRatio;

  /// 滚动视图滚动回调 - 当然其他状态变化也会回调
  void _scrollDidChange() {
    RenderObject? renderObj =
        targetWidgetKey.currentContext?.findRenderObject();
    if (renderObj != null) {
      RenderBox renderBox = renderObj as RenderBox;
      Offset offset = renderBox.localToGlobal(Offset.zero);

      /// 不知道 Android 部分机型会不会有问题，这样计算处理一下～
      double height = statusBarHeight +
          titleBarHeight -
          MediaQuery.of(context).viewPadding.top;

      if (offset.dy < height) {
        if (!isShowTitle.value) {
          isShowTitle.value = true;
        }
      } else {
        if (isShowTitle.value) {
          isShowTitle.value = false;
        }
      }
    }
  }
}
