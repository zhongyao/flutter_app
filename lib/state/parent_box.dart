import 'package:flutter/material.dart';

///父Widget管理子Widget的状态
///ParentWidget 为 TapBoxB 管理状态.
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBoxB(active: _active, onChanged: _handleTapBoxChanged);
  }
}

class TabBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TabBoxB({Key? key, this.active: false, required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(active ? 'Active' : "InActive",
              textDirection: TextDirection.ltr,
              style: const TextStyle(fontSize: 32, color: Colors.red)),
        ),
      ),
    );
  }
}
