import 'package:safe_trip_driver_app/core/constants/app_endpoints.dart';
import 'package:safe_trip_driver_app/data/models/driver_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;



class DriverRepo {
  Map<String, String> headers = {'Accept': 'application/json'};

  Future<DriverModel> login(String phoneNumber, String password) async {
    Map<String, String> body = {'email': phoneNumber, 'password': password};
    http.Response response = await http.post(
      Uri.parse(AppEndPoints.login),
      headers: headers,
      body: body,
    );

    if(response.statusCode == 200){
      var body = convert.jsonDecode(response.body);
      var data = body['data'];
      return DriverModel.fromJson(data);
    }else{
      throw Exception();
    }
  }
}