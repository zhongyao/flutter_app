import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<int> counterProvider = StateProvider((ref) => 0);

class StateProviderWidget extends ConsumerWidget {
  const StateProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw UnimplementedError();
  }

}