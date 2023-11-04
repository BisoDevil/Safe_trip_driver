import '../../../data/models/driver_model.dart';
import '../../../index.dart';


class HomeController extends GetxController{

  bool loading = false;
  late DriverModel currentDriver;


  @override
  void onInit() async {
    loading = true;
    final driverBox = await Hive.openBox<DriverModel>('current_driver_box');
    currentDriver = driverBox.get('current_driver')!;
    loading = false;
    update();
    super.onInit();
  }

  onPickedUpClicked(int id ){
    Get.snackbar(
      'Done !',
      'PickedUp Successfully ^_^',
    );
    update();
  }

  onFailureClicked(int id ){
        Get.snackbar(
          'Done !',
          'Failure Successfully ^_^',
        );
    update();
  }
}
