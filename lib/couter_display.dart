import 'package:flutter/material.dart';

//显示 计数器
class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return new Text("Count:$count");
  }
}
//改变 计数器
class CounterIncrementer extends StatelessWidget {
  final VoidCallback onPressed;

  CounterIncrementer({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text("Increment"));
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      CounterIncrementer(onPressed: _increment),
      CounterDisplay(count: _counter),
    ]);
  }
}
