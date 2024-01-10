import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/base/common_base_state.dart';
import 'package:startup_namer/util/print_util.dart';

///通知【也就是监听】Notification 页面2
class NotificationPage2 extends ConsumerStatefulWidget {
  const NotificationPage2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationPageState();
}

class _NotificationPageState extends CommonPageState<NotificationPage2> {
  String _msg = "";

  @override
  Widget buildPageContent(BuildContext context) {
    ///应用1：为NotificationListener指定一个模板参数
    // return notificationListenerWidget();

    ///应用2：自定义Notification
    return customNotificationWidget();
  }

  Widget notificationListenerWidget() {
    ///NotificationListener 可以指定一个模板参数，该模板参数类型必须是继承自Notification；
    ///当显式指定模板参数时，NotificationListener 便只会接收该参数类型的通知
    return NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          ///只会在滚动结束时才会触发此回调
          PrintUtil.print("ScrollEnd");

          ///如果返回 true，表示你已经处理了这个通知，不希望它继续冒泡到父级；
          ///如果返回 false，则允许通知继续冒泡。
          return true;
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(title: Text("item --- $index"));
            }));
  }

  Widget customNotificationWidget() {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += "${notification.msg}  ";
        });
        return true;
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                return ElevatedButton(
                  ///按钮点击时分发通知,需要用这里的context，不能用根Context
                  onPressed: () => MyNotification("Hi").dispatch(context),
                  child: const Text("Send Notification"),
                );
              },
            ),
            Text(_msg)
          ],
        ),
      ),
    );
  }

  @override
  String? get pageTitle => "NotificationPage2";
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
