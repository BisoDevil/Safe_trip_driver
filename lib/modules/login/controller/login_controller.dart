import 'package:safe_trip_driver_app/data/repositories/driver_repo.dart';
import '../../../data/models/driver_model.dart';
import 'package:safe_trip_driver_app/index.dart';

class LoginController extends GetxController{

  String phone = '';
  String password = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passwordSecure = true;
  bool loading = false;




  onLoginClicked() async {
    loading = true;
    update();
    /// check is mobile and password is not empty
    try{
      /// try to login
      DriverModel driverModel = await DriverRepo().login(phone.trim(), password.trim());
      /// save current driver in hive
      final currentDriver = await Hive.openBox<DriverModel>('current_driver_box');
      await currentDriver.put('current_driver', driverModel);
      /// navigate to home
      Get.offAllNamed(Routes.homeRoute);
    }catch (e){
      Get.snackbar(
        'login_credential_error'.tr,
        e.toString(),
      );
    }

    loading = false;
    update();
  }

  onLogoutClicked() async{
    final currentDriver = await Hive.openBox<DriverModel>('current_driver_box');
    await currentDriver.delete('current_driver');
    Get.offAllNamed(Routes.loginRoute);
  }

  changePasswordVisibility(){
    passwordSecure = !passwordSecure;
    update();
  }
}
