import 'package:flutter/services.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/translation/translation_controller.dart';
import 'data/models/driver_model.dart';

late final bool isAuth;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DriverModelAdapter());
  final currentDriver = await Hive.openBox<DriverModel>('current_driver_box');
  isAuth = currentDriver.containsKey('current_driver');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  build(BuildContext context) {


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