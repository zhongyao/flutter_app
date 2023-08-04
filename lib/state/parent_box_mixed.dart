import 'package:flutter/material.dart';

/// 混合状态管理:
/// 对于一些组件来说，混合管理的方式会非常有用。
/// 在这种情况下，组件自身管理一些内部状态，而父组件管理一些其他外部状态。
class ParentWidgetC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ParentWidgetCState();
  }
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxC(
      active: _active,
      onChanged: _handleTapBoxChanged,
    );
  }
}

class TapBoxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxC({Key? key, this.active: false, required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TapBoxCState();
  }
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      onTapUp: _handleTapUp,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border:
                _highlight ? Border.all(color: Colors.red, width: 10) : null),
        child: Center(
          child: Text(widget.active ? "Active" : "InActive",
              textDirection: TextDirection.ltr,
              style: const TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
      ),
    );
  }
}
