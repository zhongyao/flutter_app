import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/util/print_util.dart';

import '../../util/router.dart';

Future<T?> showMyDialog<T>(BuildContext context, ValueChanged<bool>? listener) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: MyWidget(listener: listener),
        );
      });
}

class MyWidget extends StatefulWidget {
  final ValueChanged<bool>? listener;

  const MyWidget({super.key, this.listener});

  @override
  State<StatefulWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    PrintUtil.print("MyDialog ---- initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    PrintUtil.print("MyDialog ---- didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    PrintUtil.print("MyDialog ---- build");
    return GestureDetector(
        // onTap: () => {PrintUtil.print("click my Dialog")},
        onTap: () => {
              ///方法一：
              ///如下代码的意思是：跳转到navigatorPageB，然后从navigatorPageB返回后，如果允许的话，关闭当前弹框MyDialog【避免了黑屏】。
              Navigator.of(context)
                  .pushNamed(RouterPath.navigatorPageB)
                  .then((value) {
                ///注意：这里最好用maybePop(),而不是pop,尤其是你与:
                ///Navigator.of(context).popUntil((route) => route.settings.name == RouterPath.navigatorPage);
                ///一起使用的时候，要不然可能导致黑屏。
                Navigator.of(context).maybePop();
                //或
                // if (Navigator.of(context).canPop()) {
                //   Navigator.of(context).pop();
                // }
                //不要用
                // Navigator.of(context).pop();
              })

              ///方法二：如果希望实现方法一的需求，其实方法二才是最优解--这种方法直接将路由堆栈中MyDialog的路由替换成navigatorPageB。
              ///Navigator.of(context).pushReplacementNamed(RouterPath.navigatorPageB)
            },
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          width: 300.w,
          height: 200.w,
          child: Text(
            textAlign: TextAlign.center,
            "This is my Dialog",
            style: TextStyle(fontSize: 16.sp, decoration: TextDecoration.none),
          ),
        ));
  }

  @override
  void deactivate() {
    PrintUtil.print("MyDialog ---- deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    PrintUtil.print("MyDialog ---- dispose");
    super.dispose();
  }
}
