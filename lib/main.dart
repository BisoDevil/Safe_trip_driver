import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/app_routes.dart';
import 'core/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
        Brightness.dark
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: getAppTheme(),
      initialRoute: Routes.splashRoute,
      getPages: AppRoutes.routes,
    );
  }
}