// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:ui';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:startup_namer/gesture.dart';
import 'package:startup_namer/platform/channel.dart';
import 'package:startup_namer/platform/platform_config.dart';
import 'package:startup_namer/state/parent_box.dart';
import 'package:startup_namer/state/parent_box_mixed.dart';
import 'package:startup_namer/state/tab_box_a.dart';
import 'package:startup_namer/ui/view_pager.dart';
import 'datatransfer/navigation_page.dart';
import 'http/http_delete.dart';
import 'http/http_gridview.dart';
import 'http/http_network_update.dart';
import 'http/web_socket.dart';
import 'provider/home_page.dart';
import 'provider/my_counter.dart';
import 'package:startup_namer/shopping_list.dart';
import 'package:startup_namer/grid_and_list.dart';
import 'package:startup_namer/stack.dart';

import 'package:startup_namer/interact.dart';

import 'anim/AnimatedContainer.dart';
import 'anim/ImplicitlyAnim.dart';
import 'anim/anim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Future<void> main() async {
//   FlutterError.onError = (FlutterErrorDetails details) async {
//     FlutterError.dumpErrorToConsole(details);
//   };
//   runZonedGuarded<Future<void>>(() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     PlatformConfig config = parseRouteConfig(window.defaultRouteName);
//     await loadPlatformInitData(config);
//     runApp(ViewPager());
//   }, (error, stackTrace) async {
//
//   });
// }

loadPlatformInitData(PlatformConfig config) async {
  if("route_name_main_flutter" == config.route_name) {
    await Channel().initChannel();
  }

}

PlatformConfig parseRouteConfig(String route) {
  debugPrint('route = ' + route);
  final parseJson = json.decode(route);
  var config = PlatformConfig.fromJson(parseJson);
  return config;
}

void main() {
  runApp(NavigationPage());
  print('===main====');
}

// void main() => runApp(ChangeNotifierProvider<MyCounter>.value(
//       // notifier: MyCounter(1),
//       value:  MyCounter(1),
//       child: MyApp(),
//     ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider',
      theme: new ThemeData(
        primaryColor: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}
