import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import 'package:safe_trip_driver_app/data/repositories/trips_repo.dart';
import 'package:safe_trip_driver_app/modules/trip/controller/trip_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/driver_model.dart';
import '../../../index.dart';


class HomeController extends GetxController{

  bool loading = false;
  late DriverModel currentDriver;
  late List<TripModel> todayNotStartedTrip;
  late List<TripModel> tripWorkingNow;
  late List<TripModel> tripFinishedToday;


  @override
  void onInit() async {
    loading = true;
    final driverBox = await Hive.openBox<DriverModel>('current_driver_box');
    currentDriver = driverBox.get('current_driver')!;
    todayNotStartedTrip = await TripsRepo().getTodayNotStartedYetTrips(currentDriver.token!);
    tripWorkingNow = await TripsRepo().getWorkingNowTrip(currentDriver.token!);
    tripFinishedToday = await TripsRepo().getStartedAndFinishedTrips(currentDriver.token!);
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


  onTripCardClicked( TripModel trip) async {

    TripController.driverToken = currentDriver.token!;
    TripController.tripId = trip.id;
    Get.toNamed(Routes.tripRoute , arguments: trip);
    update();
  }
}
