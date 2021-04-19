import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_counter.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Center(
        child: Text("${Provider.of<MyCounter>(context).count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 在 build 方法中使用此代码，当 notifyListeners 被调用的时候，
          /// 并不会使 widget 被重构。
          Provider.of<MyCounter>(context, listen: false).add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
