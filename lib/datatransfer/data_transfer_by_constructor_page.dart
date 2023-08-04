import 'package:flutter/material.dart';
import 'package:startup_namer/datatransfer/transfer_data_entity.dart';

/**
 * 一、通过构造器的方式传递参数：
 * 1.提供一个final变量 final TransferDataEntity data
 * 2.提供一个构造器接收参数 DataTransferByConstructorPage({this.data});
 */
class DataTransferByConstructorPage extends StatelessWidget {
  final TransferDataEntity data;

  DataTransferByConstructorPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("构造器方式传参"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: Text(this.data.id),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: TextButton(
              child: Text("返回上个页面"),
              onPressed: () {
                _backToData(context);
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: Text("${data.age}"),
          )
        ],
      ),
    );
  }
}

//返回并携带数据
_backToData(BuildContext context) {
  var transferData = TransferDataEntity("嘻嘻哈哈", "007", 20);
  Navigator.pop(context, transferData);
}
