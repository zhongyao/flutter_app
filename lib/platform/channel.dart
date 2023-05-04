import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Channel {
  static final Channel _singleton = Channel._internal();
  static const MethodChannel interactionChannel =
      const MethodChannel('interaction_channel');

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
        return null;
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
}
