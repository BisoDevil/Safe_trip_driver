import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';

late final bool isAuth;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  isAuth = pref.getBool('isAuth') ?? false ;
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ));

    return GetMaterialApp (
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: getAppTheme(),
      initialRoute: isAuth ? Routes.homeRoute : Routes.loginRoute,
      getPages: AppRoutes.routes,
    );
  }
}