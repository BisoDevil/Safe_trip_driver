import 'dart:developer';
import 'package:safe_trip_driver_app/data/repositories/driver_repo.dart';
import '../../../data/models/driver_model.dart';
import 'package:safe_trip_driver_app/index.dart';

class LoginController extends GetxController{
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordSecure = true;
  bool loading = false;
  @override
  void onClose() {
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }


  onLoginClicked() async {
    loading = true;
    update();

    /// check is mobile and password is not empty
    if(mobileController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty){
      try{
         /// try to login
         DriverModel driverModel = await DriverRepo().login(mobileController.text.trim(), passwordController.text.trim());
         /// save current driver in hive
         final currentDriver = await Hive.openBox<DriverModel>('current_driver_box');
         await currentDriver.put('current_driver', driverModel);
         /// navigate to home
         Get.offAllNamed(Routes.homeRoute);
      }catch (e){
        log(e.toString());
        Get.snackbar(
          AppTranslationKeys.error.tr,
          e.toString(),
        );
      }
    }else{
      Get.snackbar(
        AppTranslationKeys.error.tr,
        AppTranslationKeys.errorEmptyFieldMessage.tr,
      );

    }
    loading = false;
    update();
  }

  changePasswordVisibility(){
    passwordSecure = !passwordSecure;
    update();
  }
}
