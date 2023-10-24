import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/platform/channel.dart';
import 'package:startup_namer/platform/platform_config.dart';
import 'package:startup_namer/util/print_util.dart';
import 'my_riverpod_app.dart';

void main() {
  ///riverpod状态管理使用如下方式：
  runApp(const ProviderScope(child: MyRiverPodApp()));

  ///provider状态管理使用如下方式：
  // runApp(const MyApp());
  PrintUtil.print('main函数');
}

loadPlatformInitData(PlatformConfig config) async {
  if ("route_name_main_flutter" == config.route_name) {
    await Channel().initChannel();
  }
}

PlatformConfig parseRouteConfig(String route) {
  PrintUtil.print('route = $route');
  final parseJson = json.decode(route);
  var config = PlatformConfig.fromJson(parseJson);
  return config;
}
