import 'dart:convert';
import 'dart:developer';
import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import 'package:safe_trip_driver_app/index.dart';
import '../../core/constants/app_endpoints.dart';
import 'package:http/http.dart' as http;

class TripsRepo {

  Map<String, String> headers = {
    'app-token': AppEndPoints.appToken,
    'Accept': 'application/json',
  };


  /// get working now trips "started trips"
  ///
  Future<List<TripModel>> getWorkingNowTrip (String driverToken) async {
    headers['authorization'] = 'Bearer $driverToken';
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
    headers['authorization'] = 'Bearer $driverToken';
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
    headers['authorization'] = 'Bearer $driverToken';
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

  /// change trip status
  ///

  Future<String> changeTripState (String driverToken , String status , String tripId ) async {
    headers['authorization'] = 'Bearer $driverToken';
    Map<String, dynamic> body = {'status': status , 'trip_id' : tripId.toString()};
    http.Response response = await http.post(
      Uri.parse(AppEndPoints.changeTripStatus),
      headers: headers,
      body: body,
    );
    if(response.statusCode == 200){
      return (json.decode(response.body)['message']);
    }else{
      log(response.statusCode.toString());
      log(json.decode(response.body)['message']);
      return (json.decode(response.body)['message']);
    }

  }



}