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
          Provider.of<MyCounter>(context, listen: false).add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
