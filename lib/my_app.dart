import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/my_router.dart';
import 'package:startup_namer/page/test_page.dart';
import 'package:startup_namer/provider/theme_provider.dart';
import 'package:startup_namer/router/page_route.dart';
import 'package:startup_namer/util/print_util.dart';
import 'package:startup_namer/util/router.dart';

import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //屏幕适配：https://github.com/OpenFlutter/flutter_screenutil/blob/master/README_CN.md
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        //是否根据宽度/高度中的最小值适配文字
        minTextAdapt: true,
        //支持分屏尺寸
        splitScreenMode: true,
        builder: (context, child) {
          return FutureBuilder(
              future: init(),
              builder: (context, snapshot) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(create: (BuildContext context) {
                          ThemeProvider.instance.setDark(false);
                          return ThemeProvider.instance;
                        })
                      ],
                      child: Consumer<ThemeProvider>(builder:
                          (BuildContext context, ThemeProvider themeProvider,
                              Widget? child) {
                        return MaterialApp(
                          debugShowCheckedModeBanner: true,
                          /// 入口
                          initialRoute: RouterPath.testPage,
                          localizationsDelegates: const [
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                            S.delegate
                          ],
                          supportedLocales: S.delegate.supportedLocales,
                          localeListResolutionCallback:
                              (locales, supportedLocales) {
                            PrintUtil.print('当前系统语言环境$locales');
                            return;
                          },
                          onGenerateRoute: (RouteSettings settings) {
                            final Map<String, WidgetBuilder> routers =
                                getRouters();
                            final WidgetBuilder? builder =
                                routers[settings.name];
                            if (builder != null) {
                              return PageRouter(
                                  settings: settings, child: builder(context));
                            }
                            return null;
                          },
                          theme: ThemeData(
                            primaryColor: Colors.orange,
                          ),
                          home: child,
                          themeMode: themeProvider.getThemeMode(),
                        );
                      })));
        });
  }

  init() {
    //初始化
  }

  Map<String, WidgetBuilder> getRouters() {
    Map<String, WidgetBuilder> routers = {
      RouterPath.testPage: (context) => const TestPage(),
      ...MyRouter.instance.routers()
    };
    return routers;
  }
}
