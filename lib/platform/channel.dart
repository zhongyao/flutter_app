import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Channel {
  static final Channel _singleton = Channel._internal();
  static const MethodChannel interactionChannel =
      MethodChannel('interaction_channel');

  //flutter端创建一个BasicMessageChannel通道
  static var basicChannel = const BasicMessageChannel(
      "interaction_basic_message_channel", StandardMessageCodec());

  factory Channel() {
    return _singleton;
  }

  Channel._internal();

  initChannel() async {
    try {
      /**
       * 【MethodChannel】Native --> Flutter
       */
      interactionChannel.setMethodCallHandler((call) {
        debugPrint("flutter -- setMethodCallHandler回调");
        if (call.method == "interaction_method_one_flutter") {
          var nativeData = call.arguments["invoke_name"];
          debugPrint("invoke_name $nativeData");
        }
        return Future(() => null);
      });

      /**
       * 【MethodChannel】Flutter --> Native
       */
      String data =
          await interactionChannel.invokeMethod("interaction_method_one");
      debugPrint('data:$data');
      final parseJson = json.decode(data);
      debugPrint('config = $parseJson');
    } catch (e) {
      print(e);
    }
  }

  initBasicMessageChannel() async {
    /**
     * 【BasicMessageChannel】Native --> Flutter
     */
    basicChannel.setMessageHandler((message) async {
      debugPrint('message：$message');
      return null;
    });

    /**
     * 【BasicMessageChannel】Flutter --> Native[且有数据返回]
     */
    Object? result = await basicChannel.send({'name': 'azy', 'age': 19});
    debugPrint('result:$result');
  }

  initEventChannel() async {
    var eventChannel = const EventChannel("interaction_event_channel");
    eventChannel.receiveBroadcastStream().listen((event) {
      print("event " + event.toString());
    }, onDone: () {
      print("done");
    }, onError: (object) {
      print("on error $object");
    });
  }
}
