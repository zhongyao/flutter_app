import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/util/print_util.dart';

import '../logic/riverpod_page3_logic.dart';

///RiverPod状态管理页 --- 【StateNotifierProvider】
class RiverPodPage3 extends ConsumerStatefulWidget {
  const RiverPodPage3({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RiverPodPage3State();
}

class _RiverPodPage3State extends ConsumerState<RiverPodPage3> {

  @override
  void initState() {
    PrintUtil.print("RiverPodPage3 --- initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    PrintUtil.print("RiverPodPage3 --- didChangeDependencies");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    PrintUtil.print("RiverPodPage3 --- build");
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(50),
      child: Column(children: [
        itemBtn(),
        itemText(ref.watch(stateChangeNotifier).id),
        itemText(ref.watch(stateChangeNotifier).name),
        itemText(ref.watch(stateChangeNotifier).age),
        itemText(
            "${ref.watch(stateChangeNotifier).gender} ${ref.watch(stateChangeNotifier).country}"),
      ]),
    );
  }

  Widget itemText(String text) {
    PrintUtil.print("RiverPodPage3 --- itemText:$text");
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(text,
          textAlign: TextAlign.start,
          style: const TextStyle(
              decoration: TextDecoration.none,
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600)),
    );
  }

  Widget itemBtn() {
    return GestureDetector(
      onTap: () => {
        /// 1、ref.read 是一种不监听provider状态的方法,它通常在用户交互触发的函数中使用。
        /// 2、应该尽量避免使用 ref.read ，因为它不是响应式的。
        /// 3、不要在build方法中使用 ref.read，它可能会导致预料之外的bug。
        // ref.read(stateChangeNotifier.notifier).updateCountry("America...."),
        ref.read(stateChangeNotifier.notifier).requestPersonalInfo()
      },
      child: const Text("点击请求数据",
          textAlign: TextAlign.start,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 18,
              color: Colors.green,
              fontWeight: FontWeight.w600)),
    );
  }

  @override
  void deactivate() {
    PrintUtil.print("RiverPodPage3 --- deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    PrintUtil.print("RiverPodPage3 --- dispose");
    super.dispose();
  }

}
