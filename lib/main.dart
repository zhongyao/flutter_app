// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:startup_namer/gesture.dart';
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

void main() => runApp(ChangeNotifierProvider<MyCounter>.value(
      // notifier: MyCounter(1),
      value:  MyCounter(1),
      child: MyApp(),
    ));

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
