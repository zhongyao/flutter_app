import 'dart:io';

import 'package:flutter/material.dart';
import 'package:startup_namer/util/print_util.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget>
    with WidgetsBindingObserver {
  //输入框焦点实例
  late FocusNode _focusNode;

  //当前键盘是否是激活状态
  bool isKeyboardActived = false;

  @override
  void initState() {
    _focusNode = FocusNode();
    //监听输入框焦点变化
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        //聚焦时的操作
        return;
      }
    });
    //创建一个界面变化的观察者
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      textInputAction: TextInputAction.done,
    );
  }

  @override
  void didChangeMetrics() {
    PrintUtil.print("didChangeMetrics");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      PrintUtil.print(
          "addPostFrameCallback---_focusNode.hasFocus:${_focusNode.hasFocus}");
      //当前是安卓系统并且在焦点聚焦的情况下
      if (Platform.isAndroid && _focusNode.hasFocus) {
        if (isKeyboardActived) {
          isKeyboardActived = false;
          //使输入框失去焦点
          _focusNode.unfocus();
          return;
        }
        isKeyboardActived = true;
      }
    });
    super.didChangeMetrics();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
