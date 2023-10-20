import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';


class OtpController extends GetxController{

  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();


  writeCodeEnded(){
    Get.offAllNamed(Routes.homeRoute);
    update();
  }

  resendCodeButtonClicked(){
    Get.offAllNamed(Routes.homeRoute);
    update();
  }





}
