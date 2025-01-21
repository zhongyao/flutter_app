import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/page/widget/common_web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../base/common_base_state.dart';

///Flutter WebView浏览页面
class WebViewPage extends ConsumerStatefulWidget {
  const WebViewPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends CommonPageState<WebViewPage> {
  static const String url = "https://theprogrammingway.com/html-file-upload/";
  WebViewController? webController;

  @override
  Widget buildPageContent(BuildContext context) {
    return CommonWebView(url, onWebViewCreated: (WebViewController controller) {
      webController = controller;
    });
  }

  @override
  Future<void> barBackAction() async {
    if (await canGoBack() ?? false) {
      goBack();
    } else {
      if (mounted) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          SystemNavigator.pop(animated: true);
        }
      }
    }
  }

  Future<bool?> canGoBack() async {
    return await webController?.canGoBack();
  }

  Future<void> goBack() async {
    if (await canGoBack() ?? false) {
      webController?.goBack();
    }
  }
}
