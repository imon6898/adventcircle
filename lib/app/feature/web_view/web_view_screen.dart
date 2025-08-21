import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tests/app/utils/constants/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'controller/web_view_screen_controller.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF006466),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebViewScreenController>(
      init: Get.find<WebViewScreenController>(),
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            final canGoBack = await controller.webController.canGoBack();
            if (canGoBack) {
              await controller.webController.goBack();
              return;
            }
            return;
          },
          child: Scaffold(
            backgroundColor: CustomColors.white,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: WebViewWidget(
                        controller: controller.webController,
                      ),
                    ),
                  ),

                  if (controller.isLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
