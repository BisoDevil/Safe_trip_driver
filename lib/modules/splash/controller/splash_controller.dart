import 'dart:async';

import 'package:get/get.dart';
import 'package:safe_trip_driver_app/core/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashController extends GetxController{


  @override
  void onInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isAuth = prefs.getBool('isAuth');

    Timer(
        const Duration(seconds: 3),
            () {
          if (isAuth == true) {
            Get.offAllNamed(Routes.homeRoute);
          }else{
            Get.offAllNamed(Routes.loginRoute);
          }
        }
    );
    super.onInit();

  }

}
