import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/page/widget/custom_scroll_view_widget.dart';
import 'package:startup_namer/page/widget/refresh_nested_scroll_view_widget.dart';
import 'package:startup_namer/page/widget/nested_scroll_view_widget.dart';

class ScrollPage extends ConsumerStatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScrollPageState();
}

class _ScrollPageState extends CommonPageState<ScrollPage> {
  @override
  Widget buildPageContent(BuildContext context) {
    return const RefreshNestedScrollViewWidget();
  }
}
