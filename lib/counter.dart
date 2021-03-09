import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/// StatefulWidget与State是独立的对象：
/// 其中Widget时临时对象，用于构造应用当前状态的展示；
/// 而 State 对象在调用 build() 之间是持久的，以此来存储信息。
class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ElevatedButton(onPressed: _increment, child: Text("Increment")),
        Text('Count:$_counter'),
      ],
    );
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }
}
