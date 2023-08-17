import 'package:flutter/material.dart';
import 'package:startup_namer/widget/platform_view_widget.dart';

///普通控件测试页面
class TestWidgetPage extends StatefulWidget {
  const TestWidgetPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestWidgetPageState();
  }
}

class _TestWidgetPageState extends State<TestWidgetPage> {
  @override
  Widget build(BuildContext context) {
    // return Material(
    //     child: Container(
    //   alignment: Alignment.topCenter,
    //   child: Column(
    //     children: const [TextFieldWidget()],
    //   ),
    // ));

    return Material(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            alignment: Alignment.topCenter,
            color: Colors.white,
            child: const Text("哈哈哈哈哈"),
          ),
          const PlatformViewWidget()
        ],
      ),
    );
  }
}
