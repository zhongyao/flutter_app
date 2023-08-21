import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/util/print_util.dart';

Widget showMyMenuWidget(BuildContext context) {
  return PopupMenuButton<String>(
    initialValue: "音乐",
    elevation: 5,
    padding: const EdgeInsets.all(5),
    color: Colors.orange,
    icon: const Icon(Icons.add),
    // child: Text("学科"),
    itemBuilder: (context) {
      return <PopupMenuEntry<String>>[
        const PopupMenuItem(
            value: "语文",
            textStyle: TextStyle(color: Colors.red),
            child: Text("语文")),
        PopupMenuDivider(height: 1.w),
        const PopupMenuItem(value: "数学", child: Text("数学")),
        PopupMenuDivider(height: 1.w),
        const PopupMenuItem(value: "音乐", child: Text("音乐"))
      ];
    },
    onSelected: (value) {
      PrintUtil.print("Menu--onSelected:$value");
    },
    onCanceled: () {
      PrintUtil.print("Menu--onCanceled");
    },

    ///...按钮 长按时提示
    tooltip: "PopupMenuButton",
  );
}
