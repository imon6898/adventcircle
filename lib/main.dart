import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/bindings/view_model_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/services/cache_manager.dart';
import 'app/themes/app_theme.dart';
import 'app/utils/constants/app_text.dart';



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFFFFF),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  if (Platform.isIOS || Platform.isAndroid) {
    HttpOverrides.global = MyHttpOverrides();
  }

  await CacheManager.init();
  runApp(const MyApp());
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              translations: TextConst(),
              locale: Locale('en', 'US'),
              fallbackLocale: const Locale('en', 'US'),
              initialBinding: ViewModelBinding(),
              title: 'AC',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              //themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
              initialRoute: AppRoutes.SplashScreen,
              getPages: AppPages.list,
            ),
          );
        },
      );
    //});
  }
}


