import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_routes.dart';


class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }


  onLoginClicked() async {
    /// on login clicked function
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isAuth', true);
    Get.offAllNamed(Routes.homeRoute);
    update();
  }
}
