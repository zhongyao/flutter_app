import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showBottomModalPopup(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return Material(
        child: SingleChildScrollView(
          padding: MediaQuery.of(context).viewInsets, // 这里是关键
          child: CupertinoActionSheet(
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: const TextField(
                  autofocus: true, // 自动获取焦点
                  decoration: InputDecoration(
                    hintText: '请输入内容',
                  ),
                ),
                onPressed: () {
                  // 处理点击事件
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      );
    },
  );
}
