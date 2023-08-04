import 'package:flutter/material.dart';
import 'package:startup_namer/datatransfer/transfer_data_singleton.dart';

class TransferSingletonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransferSingletonPageState();
  }
}

class _TransferSingletonPageState extends State<TransferSingletonPage> {
  @override
  Widget build(BuildContext context) {
    var data = transSingletonData.transData;
    return Scaffold(
      appBar: AppBar(
        title: Text("全局单例传递数据"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 40.0,
            child: Text("${data?.name}"),
          ),
          Container(
            alignment: Alignment.center,
            height: 40.0,
            child: Text("${data?.id}"),
          ),
          Container(
            alignment: Alignment.center,
            height: 40.0,
            child: Text("${data?.age}"),
          ),
        ],
      ),
    );
  }
}
