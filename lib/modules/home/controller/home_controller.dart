import 'package:get/get.dart';
import 'package:safe_trip_driver_app/data/repositories/placeholder_repo.dart';
import 'package:safe_trip_driver_app/data/repositories/student_repo.dart';
import '../../../data/models/placeholder_model.dart';
import '../../../data/models/student_model.dart';


class HomeController extends GetxController{

  bool loading = true;
  List<StudentModel> students = [];
  List<PlaceholderModel> placeholderList = [];
  List<PlaceholderModel> pickedUpList = [];
  List<PlaceholderModel> failureList = [];

  @override
  void onInit() async {
    placeholderList = await PlaceholderRepo().getListOfUsers();
    loading = false;
    update();
    super.onInit();
  }
  // @override
  // void onInit() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   int driverId = pref.getInt('driverId') ?? 0;
  //   if (driverId != 0){
  //     students = getAllStudents(driverId);
  //   }else{
  //     Get.offAllNamed(Routes.loginRoute);
  //   }
  //  update();
  //   super.onInit();
  // }


  getAllStudents(int driverId) async {
    StudentRepo().getStudentsList(driverId);
    update();
  }


  onPickedUpClicked(int id ){
    Get.snackbar(
      'Done !',
      'PickedUp Successfully ^_^',
    );
    PlaceholderModel placeholderModel = placeholderList.where((element) => element.id == id).first;
    placeholderList.remove(placeholderModel);
    pickedUpList.add(placeholderModel);
    update();
  }

  onFailureClicked(int id ){
        Get.snackbar(
          'Done !',
          'Failure Successfully ^_^',
        );
        PlaceholderModel placeholderModel = placeholderList.where((element) => element.id == id).first;
        placeholderList.remove(placeholderModel);
        failureList.add(placeholderModel);
    update();
  }
}
