import 'dart:convert';
import 'dart:developer';
import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import 'package:safe_trip_driver_app/index.dart';
import '../../core/constants/app_endpoints.dart';
import 'package:http/http.dart' as http;

class TripsRepo {

  /// get working now trips "started trips"
  ///
  Future<List<TripModel>> getWorkingNowTrip (String driverToken) async {
    Map<String, String> headers = {
      'app-token': AppEndPoints.appToken,
      'Accept': 'application/json',
      'Authorization': 'Bearer $driverToken'
    };
    http.Response response = await http.get(
      Uri.parse(AppEndPoints.workingNowTrip),
      headers: headers,
    );
    if(response.statusCode == 200){
      final List result = json.decode(response.body)['data'];
      return result.map((e) => TripModel.fromJson(e)).toList();
    }else if (response.statusCode == 401){
      Get.offAllNamed(Routes.loginRoute);
      Get.snackbar(
        'Error !',
        'session expired',
      );
      throw Exception();
    }
    else{
      log(json.decode(response.body)['message']);
      throw Exception();
    }
  }


  /// get today's trips " not started yet "
  ///

  Future<List<TripModel>> getTodayNotStartedYetTrips (String driverToken) async {
    Map<String, String> headers = {
      'app-token': AppEndPoints.appToken,
      'Accept': 'application/json',
      'Authorization': 'Bearer $driverToken'
    };
    http.Response response = await http.get(
      Uri.parse(AppEndPoints.todayNotStartedTrips),
      headers: headers,
    );
    if(response.statusCode == 200){
      final List result = json.decode(response.body)['data'];
      return result.map((e) => TripModel.fromJson(e)).toList();
    }else if (response.statusCode == 401){
      Get.offAllNamed(Routes.loginRoute);
      Get.snackbar(
        'Error !',
        'session expired',
      );
      throw Exception();
    }
      else{
      log(json.decode(response.body)['message']);
      throw Exception();
    }
  }

  /// get finished today's trips "started and finished "
  ///
  Future<List<TripModel>> getStartedAndFinishedTrips (String driverToken) async {
    Map<String, String> headers = {
      'app-token': AppEndPoints.appToken,
      'Accept': 'application/json',
      'Authorization': 'Bearer $driverToken'
    };
    http.Response response = await http.get(
      Uri.parse(AppEndPoints.tripsFinishedToday),
      headers: headers,
    );
    if(response.statusCode == 200){
      final List result = json.decode(response.body)['data'];
      return result.map((e) => TripModel.fromJson(e)).toList();
    }else{
      log(json.decode(response.body)['message']);
      throw Exception();
    }
  }

  /// get tomorrow's trips " not started yet "
  ///

  // Future<List<TripModel>> getTomorrowNotStartedYetTrips (String driverToken) async {
  //   Map<String, String> headers = {
  //     'app-token': AppEndPoints.appToken,
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $driverToken'
  //   };
  //   http.Response response = await http.get(
  //     Uri.parse(AppEndPoints.tomorrowNotStartedTrips),
  //     headers: headers,
  //   );
  //   if(response.statusCode == 200){
  //     final List result = json.decode(response.body)['data'];
  //     return result.map((e) => TripModel.fromJson(e)).toList();
  //   }else{
  //     log(json.decode(response.body)['message']);
  //     throw Exception();
  //   }
  // }


}