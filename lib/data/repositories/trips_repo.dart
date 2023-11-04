import 'dart:convert';
import 'dart:developer';
import 'package:safe_trip_driver_app/data/models/trip_model.dart';
import '../../core/constants/app_endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TripsRepo {

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
      var body = convert.jsonDecode(response.body);
      log(body['data'].toString());
      final List result = json.decode(response.body)['data'];
      return result.map((e) => TripModel.fromJson(e)).toList();
    }else{
      throw Exception();
    }

  }
}