import 'package:flutter/material.dart';

abstract class NormalChangeNotifier extends ChangeNotifier {
  /// 提供初始化一些参数处理的函数。 需要在initState 等合适的地方调用
  void setUp() {}

  /// 页面上下文
  /// ···
  /// ChangeNotifierProvider(
  ///    create: (context) => NormalChangeNotifier()..context = context,
  /// ),
  /// ···
  BuildContext? context;

  // GTLoadingDialog? _loadingDialog;
  //
  // GTLoadingDialog get loadingDialog {
  //   _loadingDialog ??= GTLoadingDialog();
  //   return _loadingDialog!;
  // }
}
