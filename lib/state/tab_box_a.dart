import 'package:flutter/material.dart';
import 'dart:developer' as developer;

///TapBoxA管理自身状态
class TapBoxA extends StatefulWidget {

  TapBoxA({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TapBoxAState();
  }
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
      logPrint();
    });
  }

  /**
   * 打印日志
   */
  void logPrint() {
    //方法1
    print("_active:$_active");
    //方法2
    /**
     * 如果您一次输出太多，Android 有时可能会丢失一些日志行。
     * 可以使用 Flutter 的 foundation 包中的 debugPrint() 方法来避免这个问题。
     * 它封装了 print 方法，通过控制输出的等级，从而避免输出内容被 Android 的内核丢弃。
     */
    debugPrint("_active:$_active");
    //方法3
    /**
     * 另一种应用日志输出的方式是使用 dart:developer 中的 log() 方法。
     * 通过这种方式，您可以在输出日志中包含更精细化的信息。
     */
    developer.log('log me', name: 'my.app.category:$_active');
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
              _active ? "Active" : "InActive",
              textDirection: TextDirection.ltr,
              style: new TextStyle(fontSize: 32.0, color: Colors.red)
          ),
        ),
        width: 20,
        height: 20,
        decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}