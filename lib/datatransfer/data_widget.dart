import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/datatransfer/data_provider.dart';

class IDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = IDataProvider.of(context).data;
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited方式传递数据"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 40.0,
            child: Text(data.name),
          ),
          Container(
            alignment: Alignment.center,
            height: 40.0,
            child: Text(data.id),
          ),
          Container(
            alignment: Alignment.center,
            height: 40.0,
            child: Text("${data.age}"),
          ),
          IDataChildWidget()
        ],
      ),
    );
  }
}

class IDataChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = IDataProvider.of(context).data;
    return Container(
      child: Text(data.name),
    );
  }
}
