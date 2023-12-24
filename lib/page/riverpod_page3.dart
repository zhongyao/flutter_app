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
}
