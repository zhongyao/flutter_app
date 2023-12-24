import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///RiverPod状态管理页 --- 【FutureProvider】
final configProvider = FutureProvider<String>((ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/configurations.json'),
  ) as String;

  print("content:" + content);
  return content;
});

class RiverPodPage2 extends ConsumerStatefulWidget {
  const RiverPodPage2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RiverPodPage2State();
}

class _RiverPodPage2State extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    AsyncValue<String> user = ref.watch(configProvider);
    return user.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (config) {
        return Text(config);
      },
    );
  }
}
