import 'package:flutter/services.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/translation/tranlation_controller.dart';

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
      title: 'SafeTrip Driver App',
      theme: getAppTheme(),
      initialRoute: isAuth ? Routes.homeRoute : Routes.loginRoute,
      getPages: AppRoutes.routes,
      locale: Get.deviceLocale,
      translations: TranslationController(),
    );
  }
}