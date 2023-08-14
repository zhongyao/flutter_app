import 'package:flutter/material.dart';
import 'package:startup_namer/widget/text_field_widget.dart';

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
    return const Material(child: TextFieldWidget());
  }
}
