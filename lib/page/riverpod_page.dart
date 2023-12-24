import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///RiverPod状态管理页 --- 【StateProvider】

/// 1、Providers are declared globally and specify how to create a state
final counterProvider = StateProvider((ref) => 0);

class RiverPodPage extends ConsumerWidget {
  const RiverPodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("riverpod counter example"),
      ),
      body: Center(
        /// 2、Consumer is a builder widget that allows you to read providers.
        child: Consumer(builder: (context, ref, _) {
          final count = ref.watch(counterProvider);
          return Text('$count');
        }),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),

          /// 3、The read method is a utility to read a provider without listening to it
          onPressed: () => ref.read(counterProvider.notifier).state++),
    );
  }
}
