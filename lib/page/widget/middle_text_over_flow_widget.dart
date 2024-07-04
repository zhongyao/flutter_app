import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Flexible与Container的alignment及Text的overflow妙用：
///适配示例：Row中从左至右依次有三个Text组件，且三个组件紧挨着。Text1长度不变，当Text2长度很差无法容纳时设置...,Text3也需要完成展示出来。
///        且Text1 Text2 Text3 一直是紧密挨着的。
///如下代码所示，当Flexible包含的Container设置了alignment: Alignment.centerLeft，则无法满足，
///因为设置了alignment属性，Text2将占据剩余的所有空间，且靠左展示。
class MiddleTextOverflowWidget extends ConsumerWidget {
  const MiddleTextOverflowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 6),
            child: const Text(
              "TEXT1",
              maxLines: 1,
            ),
          ),
          Expanded(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Container(
                //如果想实现示例效果，改行代码不应该设置
                // alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(right: 6),
                child: const Text(
                  "TEXT2Q",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "TEXT3rergrgrg",
                  maxLines: 1,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
