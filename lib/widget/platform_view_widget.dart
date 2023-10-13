import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:startup_namer/util/print_util.dart';

class PlatformViewWidget extends StatefulWidget {
  const PlatformViewWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PlatformViewWidgetState();
}

class _PlatformViewWidgetState extends State<PlatformViewWidget> {
  ValueNotifier<bool> valueNotifier = ValueNotifier(true);
  static const String viewType = "com.hongri.platform.view1";
  final Map<String, dynamic> createParams = <String, dynamic>{};

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) => Visibility(
            visible: valueNotifier.value,
            child: Positioned(
              right: 16,
              bottom: MediaQuery.of(context).viewPadding.bottom + 16,
              child: GestureDetector(
                  onTap: () {
                    PrintUtil.print("PlatformView点击了");
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Platform.isIOS
                      ? const SizedBox(
                          height: 50,
                          width: 140,
                          child: UiKitView(
                            viewType: viewType,
                            hitTestBehavior:
                                PlatformViewHitTestBehavior.transparent,
                          ),
                        )
                      : SizedBox(
                          width: 152,
                          height: 80,
                          child: AndroidView(
                            viewType: viewType,
                            hitTestBehavior:
                                PlatformViewHitTestBehavior.transparent,
                            // layoutDirection: ,
                            creationParams: createParams,
                            creationParamsCodec: const StandardMessageCodec(),
                          ),
                        )),
            )));
  }
}
