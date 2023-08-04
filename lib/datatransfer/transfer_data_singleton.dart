import 'package:startup_namer/datatransfer/transfer_data_entity.dart';

class TransferDataSingleton {
  static final TransferDataSingleton _instance =
      TransferDataSingleton.__internal();

  TransferDataEntity? transData;

  TransferDataSingleton.__internal();

  factory TransferDataSingleton() {
    return _instance;
  }
}

final transSingletonData = TransferDataSingleton();
