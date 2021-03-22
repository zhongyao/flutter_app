import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class MyCounter with ChangeNotifier {
  int _count;
  MyCounter(this._count);

  void add() {
    _count++;
    notifyListeners();
  }

  get count => _count;
}
