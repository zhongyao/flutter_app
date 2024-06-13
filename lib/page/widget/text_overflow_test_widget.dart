import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///使用Text的overflow适配--Row中包含多个组件，且可能有越界的情况
///描述：标题和数字居左显示，其他组件居右显示，当一行内容不足以承载时，左边标题...+数字【需确保标题和数字总是紧挨着居左的】
///这里的关键就是Expanded和Flexible的区分使用
class TextOverflowTestWidget extends ConsumerWidget {
  const TextOverflowTestWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  "标=====================题",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text("(10)")
            ],
          ),
        ),

        // Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("右侧内容11111"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("右侧内容2222"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("右侧内容3333"),
        ),
      ],
    );
  }
}
