import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import 'package:safe_trip_driver_app/data/repositories/trips_repo.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/driver_model.dart';
import '../../../index.dart';


class HomeController extends GetxController{

  bool loading = false;
  late DriverModel currentDriver;
  late List<TripModel> todayNotStartedTrip;

  @override
  void onInit() async {
    loading = true;
    final driverBox = await Hive.openBox<DriverModel>('current_driver_box');
    currentDriver = driverBox.get('current_driver')!;
    todayNotStartedTrip = await TripsRepo().getTodayNotStartedYetTrips(currentDriver.token!);
    loading = false;
    update();
    super.onInit();
  }

  openGoogleMaps(double lat, double lng) async {
      final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
      try {
        launchUrl(Uri.parse(url));
      }catch (e) {
        throw 'Could not launch $url';
    }
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
