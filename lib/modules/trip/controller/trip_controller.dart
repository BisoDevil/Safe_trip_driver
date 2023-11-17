
import 'package:safe_trip_driver_app/index.dart';
import '../../../data/models/student_model.dart';
import '../../../data/repositories/student_repo.dart';


class TripController extends GetxController {
  bool loading = false;
  static late String driverToken;
  static late int tripId;
  late List<StudentModel> studentsInTrip;

  @override
  void onInit() async {
    loading = true;
    studentsInTrip = await StudentRepo().getStudentsInTrip(driverToken, tripId);
    loading = false;
    update();
    super.onInit();
  }



  onPickedUpClicked(int studentId , int tripId ) async {
    try {
      await StudentRepo().changeStudentState(driverToken, studentId, tripId, 'picked_up');
      Get.snackbar(
        'Done ',
        'Student status changed successfully',
      );
      update();
    }catch (e){
      String message = await StudentRepo().changeStudentState(driverToken, studentId, tripId, 'arrived');
      Get.snackbar(
        'Error !',
        message,
      );
    }
  }

  onFailureClicked( int studentId , int tripId ) async {
    try {
      await StudentRepo().changeStudentState(driverToken, studentId, tripId, 'picked_up');
      Get.snackbar(
        'Done ',
        'Student status changed successfully',
      );
      update();
    }catch (e){
      String message = await StudentRepo().changeStudentState(driverToken, studentId, tripId, 'absent');
      Get.snackbar(
        'Error !',
        message,
      );
    }
  }


}