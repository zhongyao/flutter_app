import 'package:flutter/material.dart';

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
    });
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