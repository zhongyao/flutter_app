import 'package:flutter/cupertino.dart';
import 'package:startup_namer/util/print_util.dart';
import 'package:startup_namer/widget/inheritedwidget/share_data_widget.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    PrintUtil.print("TestWidget -- didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    PrintUtil.print("TestWidget -- build");
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

}
