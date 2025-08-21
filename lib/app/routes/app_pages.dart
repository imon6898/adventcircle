
import 'package:get/get.dart';
import 'package:tests/app/feature/getstarted/getstarted_screen.dart';
import 'package:tests/app/feature/web_view/web_view_screen.dart';
import 'package:tests/app/feature/splash_views/splash_screen.dart';



import '../feature/inapp_web_view/inapp_web_view_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SplashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: AppRoutes.GetstartedScreen,
      page: () => GetstartedScreen(),
      transition: Transition.upToDown,
      transitionDuration: Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.WebViewScreen,
      page: () => WebViewScreen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: AppRoutes.InappWebViewScreen,
      page: () => InappWebViewScreen(),
      transition: Transition.rightToLeft,
    ),


  ];
}
