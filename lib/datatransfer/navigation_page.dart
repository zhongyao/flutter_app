import 'package:flutter/material.dart';
import 'package:startup_namer/datatransfer/transfer_data_entity.dart';
import 'package:startup_namer/datatransfer/transfer_singleton_page.dart';
import 'package:startup_namer/datatransfer/transfer_stream_page.dart';
import 'package:startup_namer/datatransfer/transfer_stream_singleton.dart';

import 'data_provider.dart';
import 'data_transfer_by_constructor_page.dart';
import 'data_widget.dart';
import 'transfer_data_singleton.dart';

class NavigationPage extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: TextButton(
              child: Text("一、通过构造器的方式传递参数"),
              onPressed: () {
                final data = TransferDataEntity("001", "张三丰", 18);
                _transferDataByConstructor(navigatorKey, context, data);
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: TextButton(
              child: Text("二、返回上一个页面是携带数据（Navigator.pop）"),
              onPressed: () {
                final data = TransferDataEntity("001", "张三丰", 18);
                _toTransferForResult(navigatorKey, context, data);
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: TextButton(
              child: Text("三、InheritedWidget方式"),
              onPressed: () {
                final data = TransferDataEntity("001", "张三丰", 18);
                _inheritedToPage(navigatorKey, context, data);
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: TextButton(
              child: Text("四、全局的提供数据的方式[与三类似--略]"),
              onPressed: () {
                final data = TransferDataEntity("001", "张三丰", 18);
                _inheritedToPage(navigatorKey, context, data);
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: TextButton(
              child: Text("五、通过全局单例模式来使用"),
              onPressed: () {
                _singletonDataTransfer(navigatorKey, context);
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            alignment: Alignment.center,
            child: TextButton(
              child: Text("六、全局单例结合Stream的方式传递数据"),
              onPressed: () {
                _streamDataTransfer(navigatorKey, context);
              },
            ),
          )
        ],
      ),
    );
  }
}

///通过构造器的方式传递参数
_transferDataByConstructor(GlobalKey<NavigatorState> navigatorKey,
    BuildContext context, TransferDataEntity data) {
  navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => DataTransferByConstructorPage(data: data)));
}

///跳转的时候我们需要使用异步等待回调结果 dataFromOtherPage 就是返回的结果
_toTransferForResult(GlobalKey<NavigatorState> navigatorKey,
    BuildContext context, TransferDataEntity data) async {
  final dataFromOtherPage = await navigatorKey.currentState?.push(
    MaterialPageRoute(
        builder: (context) => DataTransferByConstructorPage(data: data)),
  ) as TransferDataEntity;

  print("dataFromOtherPage:" + dataFromOtherPage.toString());
}

///跳转到IDataWidget页面并携带数据
_inheritedToPage(GlobalKey<NavigatorState> navigatorKey, BuildContext context,
    TransferDataEntity data) {
  navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => IDataProvider(
            child: IDataWidget(),
            data: data,
          )));
}

///通过全局单例模式来使用
_singletonDataTransfer(
    GlobalKey<NavigatorState> navigatorKey, BuildContext context) {
  var transferData = TransferDataEntity("二汪", "002", 25);
  transSingletonData.transData = transferData;
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => TransferSingletonPage()));
}

///全局单例结合Stream的方式传递数据
_streamDataTransfer(
    GlobalKey<NavigatorState> navigatorKey, BuildContext context) {
  var transferData = TransferDataEntity("三喵", "005", 20);
  streamSingletonData.setTransferData(transferData);
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => TransferStreamPage()));
}
