import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/util/print_util.dart';

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
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {PrintUtil.print("click my Dialog")},
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
}
