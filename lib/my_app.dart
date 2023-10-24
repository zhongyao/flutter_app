import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/page/anim_page.dart';
import 'package:startup_namer/page/entrance_page.dart';
import 'package:startup_namer/page/scroll_page.dart';
import 'package:startup_namer/page/test_widget_page.dart';
import 'package:startup_namer/provider/theme_provider.dart';
import 'package:startup_namer/router/page_route.dart';
import 'package:startup_namer/util/router.dart';

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

                          /// 切换入口
                          initialRoute: RouterPath.testWidgetPage,
                          localizationsDelegates: const [
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                          ],
                          supportedLocales: const [
                            Locale('en'), // English
                            Locale('es'), // Spanish
                          ],
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

  ///各页面的路由
  Map<String, WidgetBuilder> getRouters() {
    Map<String, WidgetBuilder> routers = {
      RouterPath.entrancePage: (context) => const EntrancePage(),
      RouterPath.scrollPage: (context) => const ScrollPage(),
      RouterPath.animPage: (context) => const AnimPage(),
      RouterPath.testWidgetPage: (context) => const TestWidgetPage()
    };
    return routers;
  }
}
