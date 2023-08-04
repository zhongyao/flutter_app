import 'dart:async';

import 'package:flutter/material.dart';
import 'package:startup_namer/datatransfer/transfer_data_entity.dart';
import 'package:startup_namer/datatransfer/transfer_stream_singleton.dart';

class TransferStreamPage extends StatefulWidget {
  @override
  _TransferStreamPageState createState() => _TransferStreamPageState();
}

class _TransferStreamPageState extends State<TransferStreamPage> {
  StreamController? _streamController = streamSingletonData.streamController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("全局单例结合Stream"),
        ),
        body: StreamBuilder(
            stream: _streamController?.stream,
            initialData: TransferDataEntity("", "", 0),
            builder: (context, snapshot) {
              return Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    child: Text(snapshot.data.name),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    child: Text(snapshot.data.id),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    child: Text("${snapshot.data.age}"),
                  ),
                ],
              );
            }));
  }

  @override
  void dispose() {
    _streamController?.close();
    super.dispose();
  }
}
