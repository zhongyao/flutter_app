import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/router/popup/my_dialog.dart';
import 'package:startup_namer/util/print_util.dart';
import 'package:startup_namer/util/router.dart';

import '../router/popup/my_bottom_sheet.dart';

///Navigator跳转页面
class NavigatorPage extends ConsumerStatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NavigatorPageState();
  }
}

class _NavigatorPageState extends CommonPageState<NavigatorPage> {
  @override
  void initState() {
    PrintUtil.print("页面A -- initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    PrintUtil.print("页面A -- didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget buildPageContent(BuildContext context) {
    PrintUtil.print("页面A -- build");
    return Material(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => {goToPageB(context)},
            /// 跳转A-B-A生命周期：
            /// HongRi --> 页面A -- initState
            /// HongRi --> 页面A -- didChangeDependencies
            /// HongRi --> 页面A -- build
            /// HongRi --> 页面B ---- initState
            /// HongRi --> 页面B ---- didChangeDependencies
            /// HongRi --> 页面B ---- build
            /// HongRi --> 页面B ---- deactivate
            /// HongRi --> 页面B ---- dispose
            child: const Text("点击跳到页面B"),
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
    PrintUtil.print("页面A -- deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    PrintUtil.print("页面A -- dispose");
    super.dispose();
  }

  void goToPageB(BuildContext context) {
    Navigator.of(context).pushNamed(RouterPath.navigatorPageB);
  }
}
