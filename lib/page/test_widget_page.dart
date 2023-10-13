import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/router/popup/my_dialog.dart';
import 'package:startup_namer/util/print_util.dart';

import '../router/popup/my_bottom_sheet.dart';

///普通控件测试页面
class TestWidgetPage extends StatefulWidget {
  const TestWidgetPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
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
          )
        ],
      ),
    );

    // return Material(
    //     child: Container(
    //   alignment: Alignment.topCenter,
    //   child: Column(
    //     children: const [TextFieldWidget()],
    //   ),
    // ));

    // return Material(
    //   child: Stack(
    //     children: [
    //       Container(
    //         margin: const EdgeInsets.only(top: 40),
    //         alignment: Alignment.topCenter,
    //         color: Colors.white,
    //         child: const Text("哈哈哈哈哈"),
    //       ),
    //       const PlatformViewWidget()
    //     ],
    //   ),
    // );
  }
}
