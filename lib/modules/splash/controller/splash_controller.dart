import 'dart:async';

import 'package:get/get.dart';
import 'package:safe_trip_driver_app/core/app_routes.dart';


class SplashController extends GetxController{


  @override
  void onInit() {
    Timer(
        const Duration(seconds: 3),
            () => Get.offAllNamed(Routes.loginRoute)
    );
    super.onInit();

  }

}
