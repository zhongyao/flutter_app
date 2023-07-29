import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCounter with ChangeNotifier {
  int _count;
  MyCounter(this._count);

  void add() {
    _count++;
    notifyListeners();
  }

  get count => _count;
}
