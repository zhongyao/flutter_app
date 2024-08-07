import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/page/widget/fittedbox_test_widget.dart';
import 'package:startup_namer/page/widget/middle_text_over_flow_widget.dart';
import 'package:startup_namer/page/widget/text_overflow_test_widget.dart';
import 'package:startup_namer/router/popup/my_dialog.dart';
import 'package:startup_namer/util/print_util.dart';
import 'package:startup_namer/util/router.dart';

import '../router/popup/my_bottom_modalpopup.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          onTap: () => {showBottomModalPopup(context)},
          child: const Text("点击弹出showCupertinoModalPopup【包含键盘遮挡输入框适配】"),
        ),
        SizedBox(
          height: 20.w,
        ),
        GestureDetector(
          onTap: () => {goToInheritedWidgetPage(context)},
          child: const Text("点击进入测试InheritedWidget页面"),
        ),
        SizedBox(
          height: 20.w,
        ),
        const FittedBoxTestWidget(),
        SizedBox(
          height: 20.w,
        ),
        const TextOverflowTestWidget(),
        const MiddleTextOverflowWidget()
      ],
    );
  }

  void goToInheritedWidgetPage(BuildContext context) {
    Navigator.of(context).pushNamed(RouterPath.inheritedWidgetPage);
  }
}
