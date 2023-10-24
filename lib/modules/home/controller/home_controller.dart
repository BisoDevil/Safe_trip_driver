import 'package:get/get.dart';
import 'package:safe_trip_driver_app/data/repositories/student_repo.dart';
import '../../../data/models/student_model.dart';


class HomeController extends GetxController{

  bool loading = true;
  List<StudentModel> students = [];


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
}
