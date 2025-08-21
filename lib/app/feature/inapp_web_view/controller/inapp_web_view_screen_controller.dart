import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InappWebViewScreenController extends GetxController {
  late final WebViewController webController;
  late String title;
  late String url;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as List<String>;
    title = args[0];
    url = args[1];

    // Initialize WebViewController
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }
}
