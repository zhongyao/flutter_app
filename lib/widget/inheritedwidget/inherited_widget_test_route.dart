import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/widget/inheritedwidget/share_data_widget.dart';
import 'package:startup_namer/widget/inheritedwidget/test_widget.dart';

///InheritedWidget测试页
class InheritedWidgetTestPage extends StatefulWidget {
  const InheritedWidgetTestPage({super.key});

  @override
  State<StatefulWidget> createState() => _InheritedWidgetTestPageState();
}

class _InheritedWidgetTestPageState extends CommonPageState<InheritedWidgetTestPage> {
  int count = 0;

  @override
  Widget buildPageContent(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.w),
            const TestWidget(),
            // 点击count+1，刷新次build方法，更新ShareDataWidget中的data值，
            // ShareDataWidget中的值更新了，就会调用依赖InheritedWidget的子TestWidget中的
            // didChangeDependencies方法
            ElevatedButton(
              onPressed: () => setState(() {
                ++count;
              }),
              child: const Text("Increment"),
            )
          ],
        ),
      ),
    );
  }
}
