// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:startup_namer/counter.dart';
import 'package:startup_namer/gesture.dart';
import 'package:startup_namer/shopping_list.dart';
import 'package:startup_namer/grid_and_list.dart';
import 'package:startup_namer/stack.dart';

import 'package:startup_namer/interact.dart';

void main() => runApp(InteractApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
      theme: new ThemeData(
        primaryColor: Colors.orange,
      ),
      home: ShoppingList(
        products: <Product>[
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate chips'),
        ],
      ),
    );
  }
}
