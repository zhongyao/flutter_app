import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_namer/base/common_base_state.dart';

import '../my_router.dart';

///测试页
class TestPage extends ConsumerStatefulWidget {
  const TestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestPageState();
}

class _TestPageState extends CommonPageState<TestPage> {
  final myRouteKeyList = {...MyRouter.instance.routers()}.keys.toList();

  @override
  Widget buildPageContent(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            var text = myRouteKeyList[index];
            Navigator.of(context).pushNamed(text);
          },
          child: Container(
            color: Colors.blue,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(18),
            height: 45.w,
            child: Text(
              myRouteKeyList[index],
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
      itemCount: myRouteKeyList.length,
    );
  }
  @override
  String? get pageTitle => "测试入口页";
}
