import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_routes.dart';


class OtpController extends GetxController{

  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();


  writeCodeEnded() async {
    /// if otp is correct
    /// save user data in local database

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuth', true);
    Get.offAllNamed(Routes.homeRoute);

    /// if otp code is wrong
    /// show dialog box with error or " resend code button "
    // todo : if otp code is wrong


    update();
  }

  resendCodeButtonClicked(){
    Get.offAllNamed(Routes.homeRoute);
    update();
  }





}
