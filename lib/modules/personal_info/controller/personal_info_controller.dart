import 'package:safe_trip_driver_app/data/repositories/driver_repo.dart';
import 'package:safe_trip_driver_app/index.dart';

import '../../../data/models/driver_model.dart';

class PersonalInfoController extends GetxController{

  String name = '';
  String mobile = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  bool passwordSecure = false;
  late DriverModel driverModel;


  @override
  void onInit() async {
    loading = true;
    final currentDriver = await Hive.openBox<DriverModel>('current_driver_box');
    String? token = currentDriver.get('current_driver')!.token;
    driverModel = await DriverRepo().getProfileData(token!);
    name = driverModel.name;
    mobile = driverModel.mobile;
    loading = false;
    update();
    super.onInit();
  }

  changePasswordVisibility(){
    passwordSecure = !passwordSecure;
    update();
  }


}
