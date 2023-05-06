import 'dart:async';

import 'package:startup_namer/datatransfer/transfer_data_entity.dart';

/**
 * 全局单例结合Stream的方式传递数据
 * 1、创建一个接受全局的单例对象，并把传递值转成Stream方式
 * 2、在接收数据可以使用StreamBuilder直接接收并处理
 */
class TransferStreamSingleton {
  static final TransferStreamSingleton _instance =
      TransferStreamSingleton.__internal();
  StreamController streamController;

  void setTransferData(TransferDataEntity transData) {
    streamController = StreamController<TransferDataEntity>();
    streamController.sink.add(transData);
  }

  factory TransferStreamSingleton() {
    return _instance;
  }

  TransferStreamSingleton.__internal();
}

final streamSingletonData = TransferStreamSingleton();
