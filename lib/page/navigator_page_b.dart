import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/router/popup/my_dialog.dart';
import 'package:startup_namer/util/print_util.dart';
import 'package:startup_namer/util/router.dart';

import '../router/popup/my_bottom_sheet.dart';

///Navigator跳转页面B
class NavigatorPageB extends ConsumerStatefulWidget {
  const NavigatorPageB({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NavigatorPageBState();
  }
}

class _NavigatorPageBState extends CommonPageState<NavigatorPageB> {
  @override
  void initState() {
    PrintUtil.print("页面B ---- initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    PrintUtil.print("页面B ---- didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget buildPageContent(BuildContext context) {
    PrintUtil.print("页面B ---- build");
    return Material(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => {goBackToPageA(context)},
            child: const Text("点击回退到页面A"),
          ),
          SizedBox(
            height: 20.w,
          )
        ],
      ),
    );
  }

  @override
  void deactivate() {
    PrintUtil.print("页面B ---- deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    PrintUtil.print("页面B ---- dispose");
    super.dispose();
  }

  void goBackToPageA(BuildContext context) {
    Navigator.of(context).pop();
  }
}
