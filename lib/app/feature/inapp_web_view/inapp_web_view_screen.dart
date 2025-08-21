import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tests/app/utils/constants/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'controller/inapp_web_view_screen_controller.dart';

class InappWebViewScreen extends StatelessWidget {
  const InappWebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InappWebViewScreenController>(
      // Use Get.find if you registered the controller in a Binding.
      // Otherwise, replace with: init: Get.put(WebViewScreenController()),
      init: Get.find<InappWebViewScreenController>(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            final canGoBack = await controller.webController.canGoBack();
            if (canGoBack) {
              await controller.webController.goBack();
              return false; // don't pop route, just go back in web history
            }
            return true; // no web history -> pop route
          },
          child: Scaffold(
            backgroundColor: CustomColors.white,

          ),
        );
      },
    );
  }
}
