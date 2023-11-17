import 'dart:developer';
import 'package:safe_trip_driver_app/core/constants/app_endpoints.dart';
import 'package:safe_trip_driver_app/data/models/driver_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;



class DriverRepo {
  Map<String, String> headers = {
    'app-token': AppEndPoints.appToken,
    'Accept': 'application/json',
  };

  Future<DriverModel> login(String account, String password) async {
    Map<String, String> body = {'account': account, 'password': password};
    http.Response response = await http.post(
      Uri.parse(AppEndPoints.login),
      headers: headers,
      body: body,
    );
    if(response.statusCode == 200){
      var body = convert.jsonDecode(response.body);
      return DriverModel.fromJson(body);
    }else{
      var body = convert.jsonDecode(response.body);
      var data = body['message'];
      log(response.statusCode.toString());
      log(data.toString());
      throw Exception();
    }
  }



  Future<DriverModel> getProfileData(String driverToken) async{
    headers['authorization'] = 'Bearer $driverToken';
    http.Response response = await http.get(
      Uri.parse(AppEndPoints.profile),
      headers: headers,
    );
    if(response.statusCode == 200){
      var body = convert.jsonDecode(response.body);
      return DriverModel.fromJson(body['data']);
    }else{
      throw Exception();
    }
  }
}