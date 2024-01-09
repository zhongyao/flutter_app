import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/util/print_util.dart';

///通知【也就是监听】Notification 页面
class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationPageState();
}

class _NotificationPageState extends CommonPageState<NotificationPage> {
  @override
  Widget buildPageContent(BuildContext context) {
    return NotificationListener(
        onNotification: (notification) {
          switch (notification.runtimeType) {
            case ScrollStartNotification:
              PrintUtil.print("开始滚动");
              break;

            case ScrollUpdateNotification:
              PrintUtil.print("正在滚动");
              break;

            case ScrollEndNotification:
              PrintUtil.print("停止滚动");
              break;

            case OverscrollNotification:
              PrintUtil.print("滚动到边界");
              break;
          }

          ///如果返回 true，表示你已经处理了这个通知，不希望它继续冒泡到父级；
          ///如果返回 false，则允许通知继续冒泡。
          return true;
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(title: Text("item-$index"));
            }));
  }
}
