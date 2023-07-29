import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  static final ThemeProvider _instance = ThemeProvider._internal();

  static ThemeProvider get instance => _instance;

  //私有命名构造函数
  ThemeProvider._internal();

  //是否是深色模式
  bool _isDark = false;

  bool isDark() => _isDark;

  void setDark(bool isDark) {
    _isDark = isDark;
    notifyListeners();
  }

  //获取主题模式
  ThemeMode getThemeMode() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
