import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreenController extends GetxController {
  late WebViewController webController;
  bool isLoading = true;
  String title = '';

  @override
  void onInit() {
    super.onInit();
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setUserAgent(
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
              "AppleWebKit/537.36 (KHTML, like Gecko) "
              "Chrome/116.0.0.0 Safari/537.36"
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            isLoading = true;
            update();
          },
          onPageFinished: (_) {
            isLoading = false;
            update();
          },
          onWebResourceError: (error) {
            debugPrint("Web error: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse("https://adventcircle.com/auth/login"));

  }

  Future<void> navigateBack() async {
    if (await webController.canGoBack()) {
      await webController.goBack();
    } else {
      Get.back();
    }
  }

  Future<void> navigateForward() async {
    if (await webController.canGoForward()) {
      await webController.goForward();
    }
  }

  @override
  void onClose() {
    webController.clearCache();
    super.onClose();
  }
}
