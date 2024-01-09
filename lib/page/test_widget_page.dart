import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/router/popup/my_dialog.dart';
import 'package:startup_namer/util/print_util.dart';
import 'package:startup_namer/util/router.dart';

import '../router/popup/my_bottom_sheet.dart';

///普通控件测试页面
class TestWidgetPage extends ConsumerStatefulWidget {
  const TestWidgetPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TestWidgetPageState();
  }
}

class _TestWidgetPageState extends CommonPageState<TestWidgetPage> {
  @override
  Widget buildPageContent(BuildContext context) {
    return Material(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => {
              showMyDialog(context, (value) {
                PrintUtil.print("Dialog内容被点击了");
              })
            },
            child: const Text("点击弹出Dialog"),
          ),
          SizedBox(
            height: 20.w,
          ),
          GestureDetector(
            onTap: () => {showMyBottomSheet(context)},
            child: const Text("点击弹出BottomSheet"),
          ),
          SizedBox(
            height: 20.w,
          ),
          GestureDetector(
            onTap: () => {showMyBottomSheet(context)},
            child: const Text("点击弹出Menu"),
          ),
          SizedBox(
            height: 20.w,
          ),
          GestureDetector(
            onTap: () => {goToInheritedWidgetPage(context)},
            child: const Text("点击进入测试InheritedWidget页面"),
          )
        ],
      ),
    );
  }

  void goToInheritedWidgetPage(BuildContext context) {
    Navigator.of(context).pushNamed(RouterPath.inheritedWidgetPage);
  }
}
