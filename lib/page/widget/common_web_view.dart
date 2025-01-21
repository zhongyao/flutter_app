import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import '../../util/print_util.dart';

///Flutter的WebView控件
class CommonWebView extends StatefulWidget {
  final String url;
  final String? ua;
  final Function(WebViewController)? onWebViewCreated;
  final ValueChanged<bool>? clickListener;

  const CommonWebView(this.url,
      {super.key, this.ua, this.onWebViewCreated, this.clickListener});

  @override
  State<StatefulWidget> createState() => _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController(
      onPermissionRequest: (WebViewPermissionRequest request) async {
        //需要相机权限时会用到
        if (request.types.contains(WebViewPermissionResourceType.camera)) {
          PrintUtil.print("camera");
          final status = await Permission.camera.request();
          PrintUtil.print("status:$status");
          if (status.isGranted) {
            request.grant();
          } else {
            request.deny();
          }
        } else {
          request.deny();
        }
      },
    )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            PrintUtil.print("progress:$progress");
          },
          onPageStarted: (String url) {
            PrintUtil.print("onPageStarted -- url:$url");
          },
          onPageFinished: (String url) {
            PrintUtil.print("onPageFinished -- url:$url");
          },
          onWebResourceError: (WebResourceError error) {
            PrintUtil.print("onWebResourceError -- url:${error.description}");
          },
          onNavigationRequest: (NavigationRequest request) {
            PrintUtil.print("onNavigationRequest -- url:${request.url}");
            // 检查 URL 是否为重定向目标
            if (request.url.isNotEmpty && request.url.contains("****")) {
              //在这里进行重定向操作 do 301
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            PrintUtil.print("onUrlChange -- changeUrl:${change.url}");
          },
        ),
      )
      ..addJavaScriptChannel(
        //这里输入JS定义的channel name
        "*****",
        onMessageReceived: (JavaScriptMessage message) {
          String msg = message.message;
          PrintUtil.print("JS--> msg:$msg");
        },
      )
      ..loadRequest(Uri.parse(widget.url));

    // 如果外部提供了回调，调用它
    if (widget.onWebViewCreated != null) {
      widget.onWebViewCreated!(controller);
    }

    //针对Android设备
    addFileSelectionListener();

    //针对Android设备
    setMediaRequiresUserGesture();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }

  void addFileSelectionListener() async {
    if (Platform.isAndroid) {
      final androidController = controller.platform as AndroidWebViewController;
      await androidController.setOnShowFileSelector(_androidFilePicker);
    }
  }

  void setMediaRequiresUserGesture() {
    if (controller.platform is AndroidWebViewController) {
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
  }
}

//这里只适用于Android，需要考虑iOS编译问题，另外双端均使用时，可能需要考虑其他方案。
Future<List<String>> _androidFilePicker(final FileSelectorParams params) async {
  final result = await FilePicker.platform.pickFiles();

  if (result != null && result.files.single.path != null) {
    final file = File(result.files.single.path!);
    return [file.uri.toString()];
  }
  return [];
}
