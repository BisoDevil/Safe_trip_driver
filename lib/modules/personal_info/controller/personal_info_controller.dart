import 'dart:developer';

import 'package:safe_trip_driver_app/data/repositories/driver_repo.dart';
import 'package:safe_trip_driver_app/index.dart';

import '../../../data/models/driver_model.dart';

class PersonalInfoController extends GetxController{

  bool loading = false;
  bool passwordSecure = false;
  late DriverModel driverModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();


  @override
  void onInit() async {
    loading = true;
    final currentDriver = await Hive.openBox<DriverModel>('current_driver_box');
    String? token = currentDriver.get('current_driver')!.token;
    driverModel = await DriverRepo().getProfileData(token!);
    nameController.text = driverModel.name;
    mobileController.text = driverModel.mobile;
    loading = false;
    update();
    super.onInit();
  }

  changePasswordVisibility(){
    passwordSecure = !passwordSecure;
    update();
  }


}
