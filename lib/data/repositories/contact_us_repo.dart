
import 'dart:developer';

import 'package:safe_trip_driver_app/data/models/contact_us_model.dart';
import '../../core/constants/app_endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class ContactUsRepo {


  Future<ContactUsModel> getContactUsData() async{
    Map<String, String> headers = {
      'app-token': AppEndPoints.appToken,
    };
    http.Response response = await http.get(
      Uri.parse(AppEndPoints.contactUs),
      headers: headers,
    );
    if(response.statusCode == 200){
      var body = convert.jsonDecode(response.body);
      log(body.toString());
      return ContactUsModel.fromJson(body['data']);
    }else{
      var body = convert.jsonDecode(response.body);
      var data = body['message'];
      log(response.statusCode.toString());
      log(data.toString());
      throw Exception();
    }
  }

}