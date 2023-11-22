import 'dart:async';
import 'dart:developer';
import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import 'package:safe_trip_driver_app/data/repositories/location_serveces.dart';
import 'package:safe_trip_driver_app/index.dart';
import '../../../data/models/student_model.dart';
import '../../../data/repositories/student_repo.dart';
import 'package:location/location.dart';

import '../../../data/repositories/trips_repo.dart';

class TripController extends GetxController {
  bool loading = false;
  static late String driverToken;
  static late int tripId;
  Location location = Location();
  StreamSubscription<LocationData>? locationSubscription;
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
  @override
  void onClose() {
    locationSubscription?.cancel();
    super.onClose();
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

  changeTripStatus(String status,TripModel tripModel) async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    var locationData = await location.getLocation();

    log('latitude : ${locationData.latitude.toString()}');
    log('longitude : ${locationData.longitude.toString()}');
    log('speed : ${locationData.speed.toString()} ');
    await TripsRepo().changeTripState(driverToken, status, tripModel.id.toString());


    if(status == 'working'){

      LocationServices().insertDataToFirestore( tripModel.id.toString(), driverToken, locationData.latitude.toString(), locationData.longitude.toString() , locationData.speed.toString());
      log('data inserted successfully - first time');
      locationSubscription = location.onLocationChanged.listen((event) {
        LocationServices().updateDataToFirestore(tripModel.id.toString() , event.latitude.toString(), event.longitude.toString() , event.speed.toString());
        log('data updated successfully');
      });

    }else {
      locationSubscription?.cancel();
    }
    update();
  }

}