import 'package:safe_trip_driver_app/data/repositories/trips_repo.dart';
import 'package:safe_trip_driver_app/index.dart';
import '../../../data/models/student_model.dart';
import '../../../data/repositories/student_repo.dart';


class TripController extends GetxController {
  bool loading = false;
  static late String driverToken;
  static late int tripId;
  late List<StudentModel> studentsInTrip;
  bool studentCardButtonEnabled = true;

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
      loading = true;
      await StudentRepo().changeStudentState(driverToken, studentId, tripId, 'on_the_way');
      studentsInTrip = await StudentRepo().getStudentsInTrip(driverToken, tripId);
      loading = false;
      Get.snackbar(
        'Done ',
        'Student status changed successfully',
      );

    }catch (e){
      String message = await StudentRepo().changeStudentState(driverToken, studentId, tripId, 'on_the_way');
      Get.snackbar(
        'Error !',
        message,
      );
    }
    update();
  }

  onFailureClicked( int studentId , int tripId ) async {
    try {
      loading = true;
      await StudentRepo().changeStudentState(driverToken, studentId, tripId, 'absent');
      studentsInTrip = await StudentRepo().getStudentsInTrip(driverToken, tripId);
      loading = false;
      Get.snackbar(
        'Done ',
        'Student status changed successfully',
      );

    }catch (e){
      String message = await StudentRepo().changeStudentState(driverToken, studentId, tripId, 'absent');
      studentsInTrip.where((element) => element.id == studentId).first.status = 'absent';
      Get.snackbar(
        'Error !',
        message,
      );
    }
    update();
  }

  changeTripStatus(String status,String tripId) async {
    loading = true;
    await TripsRepo().changeTripState(driverToken, status, tripId);
    loading = false;
    update();
  }

}