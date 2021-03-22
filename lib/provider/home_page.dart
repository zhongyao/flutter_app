import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/provider/second_page.dart';
import 'my_counter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            child: Text("下一页"),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondPage();
            })),
          ),
        ],
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
