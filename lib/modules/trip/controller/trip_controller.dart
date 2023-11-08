
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


}