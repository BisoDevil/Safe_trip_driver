import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';


class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  onLoginClicked() {
    /// on login clicked function
    Get.offAllNamed(Routes.otpRoute);
    update();
  }
}
