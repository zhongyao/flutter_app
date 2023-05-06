import 'package:flutter/cupertino.dart';
import 'package:startup_namer/datatransfer/transfer_data_entity.dart';

class IDataProvider extends InheritedWidget {
  final TransferDataEntity data;

  IDataProvider({Widget child, this.data}) : super(child: child);

  @override
  bool updateShouldNotify(IDataProvider oldWidget) {
    return data != oldWidget.data;
  }

  static IDataProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<IDataProvider>();
  }
}
