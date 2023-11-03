import 'package:flutter/cupertino.dart';
import 'package:startup_namer/page/widget/custom_scroll_view_widget.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollViewWidget();
  }
}
