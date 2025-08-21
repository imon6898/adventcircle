import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../themes/app_theme.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_fonts.dart';
import 'controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [

            Positioned.fill(
              child: Container(
                color: CustomColors.white,
              ),
            ),
            Center(
              child: ScaleTransition(
                scale: controller.scaleAnimation,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  width: 300.w,
                  height: 400.h,
                  alignment: Alignment.center,
                  child: Image.asset(
                    ImageUtils.AppVerticalWhiteLogo,
                    width: 300.w,
                    height: 400.h,
                  ),
                ),
              ),
            ),

          ],
        ),
      );
    });
  }
}
