import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/logic/riverpod_page4_logic.dart';

///RiverPod状态管理页 --- 【AutoDisposeNotifierProvider】
class RiverPodPage4 extends ConsumerStatefulWidget {
  const RiverPodPage4({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RiverPodPage4State();
}

class _RiverPodPage4State extends CommonPageState<RiverPodPage4> {
  bool isRed = false;

  @override
  Widget buildPageContent(BuildContext context) {
    ///通过ref.watch监听data，当接口数据请求成功后，会自动刷新build方法，更细UI。
    String data = ref.watch(riverPodPage4LogicProvider).data;

    ///通过ref.watch监听isRed变量，当通过如下点击方法更新Model中其值时，由于这里使用了watch方法，也会自动更新build方法，刷新UI展示。
    isRed = ref.watch(riverPodPage4LogicProvider).isRed;
    return GestureDetector(
      onTap: () {
        ///通过ref.read方法读取notifier，并通过内部updateBgColor方法更新其值
        ref.read(riverPodPage4LogicProvider.notifier).updateBgColor(!isRed);
      },
      child: Container(
        alignment: Alignment.center,

        ///展示背景值
        decoration: BoxDecoration(color: isRed ? Colors.red : Colors.white),

        ///展示数据
        child: Text(
          "show Data:$data isRed:$isRed",
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
    );
  }
}
