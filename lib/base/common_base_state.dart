import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../router/popup/my_menu.dart';
import 'common_appbar_generator.dart';
import 'normal_page_abstract.dart';
import 'normal_titlebar_abstract.dart';

abstract class CommonPageState<T extends StatefulWidget> extends State<T>
    with
        NormalPageAbstract,
        BaseTitleBarConfigMixin,
        AutomaticKeepAliveClientMixin {
  @override
  @mustCallSuper
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      getArguments(arguments);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(414, 896));

    if (wantKeepAlive) {
      super.build(context);
    }
    if (getProviders.isNotEmpty) {
      return MultiProvider(
        providers: [
          ...getProviders,
        ],
        child: _pageContent(context),
      );
    } else {
      return _pageContent(context);
    }
  }

  Widget _pageContent(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// 收起键盘
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        /// 普通自定义AppBar
        // appBar: _getTitleBar(context),
        /// 包含ShowMenu的系统AppBar示例
        appBar: AppBar(
          title: const Text("AppBar的title"),
          actions: <Widget>[showMyMenuWidget(context)],
        ),
        body: _getContent(context),
        extendBodyBehindAppBar: isExtendBodyBehindAppBar,
        bottomNavigationBar: getBottomNavigationBar(context),
        backgroundColor: pageBackgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: pageBackgroundColor,
      child: SafeArea(
        top: safeTop,
        bottom: safeBottom,
        child: buildPageContent(context),
      ),
    );
  }

  PreferredSizeWidget? _getTitleBar(BuildContext context) {
    if (isHiddenAppBar()) {
      return null;
    }
    return appBar(context);
  }

  // 重写可返回自定义的titlebar
  PreferredSizeWidget? appBar(BuildContext context) {
    // lib_uikt 下提供了一个 GTAppBar。封装的太死了不好扩展
    return AppBarGenerator.getNoramlAppBar(
      context: context,
      title: pageTitle,
      titleWidget: titleWidget,
      leadingWidth: leftButtonWidth,
      backgroundColor: backgroundColor,
      leftButton: leftButtonWidget(),
      onPreBackAction: barBackAction,
      rightButtons: rightsButtonForTitleBar(),
    );
  }

  // 导航栏返回按钮事件
  void barBackAction() {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    } else {
      SystemNavigator.pop();
    }
  }

  // 页面状态保持
  @override
  bool get wantKeepAlive => needKeepAlive;
}
