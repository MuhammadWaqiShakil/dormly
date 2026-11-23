import 'package:dormly/app/app_theme.dart';
import 'package:dormly/constant/app_route.dart';
import 'package:dormly/controller/auth_controller.dart';
import 'package:dormly/controller/theme_controller.dart';
import 'package:dormly/view/login_screen.dart';
import 'package:dormly/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());
  Get.put(ThemeController(),permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
debugShowCheckedModeBanner: false,
      title: 'Dormly',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: AppRoute.splashRoute,
          page: () => SplashScreen(),
          transition: Transition.fadeIn,
        ),

        GetPage(
          name: AppRoute.loginRoute,
          page: () => LoginScreen(),
        ),
      ],
      home: const SplashScreen(),
    );
  }
}


