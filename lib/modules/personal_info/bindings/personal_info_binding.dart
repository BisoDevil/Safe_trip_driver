
import 'package:get/get.dart';
import 'package:safe_trip_driver_app/modules/personal_info/controller/personal_info_controller.dart';

class PersonalInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PersonalInfoController>(
      PersonalInfoController(),
    );
  }
}
