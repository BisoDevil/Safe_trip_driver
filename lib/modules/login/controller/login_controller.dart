import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_trip_driver_app/data/repositories/driver_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/constants/app_translation_keys.dart';
import '../../../data/models/driver_model.dart';


class LoginController extends GetxController{
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordSecure = true;

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }


  onLoginClicked() async {
    // if(phoneController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty){
    //   // TODO: try to login
    //
    //   try{
    //     // TODO: if success
    //     // TODO: save user local data on shared preference
    //    DriverModel driverModel = await DriverRepo().login(phoneController.text.trim(), passwordController.text.trim());
    //
    //      SharedPreferences pref = await SharedPreferences.getInstance();
    //      pref.setBool('isAuth', true);
    //      pref.setInt('driverId', driverModel.id);
    //     Get.offAllNamed(Routes.homeRoute);
    //   }catch(e){
    //     Get.snackbar(
    //       AppTranslationKeys.error.tr,
    //       AppTranslationKeys.loginCredentialsRejectedMessage.tr,
    //     );
    //
    //     // TODO: remove the next line later
    //     Get.offAllNamed(Routes.homeRoute);
    //   }
    // }else{
    //   Get.snackbar(
    //     AppTranslationKeys.error.tr,
    //     AppTranslationKeys.errorEmptyFieldMessage.tr,
    //   );
    // }

    Get.offAllNamed(Routes.homeRoute); /// remove this line
    update();
  }

  changePasswordVisibility(){
    passwordSecure = !passwordSecure;
    update();
  }
}
