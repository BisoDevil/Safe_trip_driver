import 'package:safe_trip_driver_app/core/constants/app_endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:safe_trip_driver_app/data/models/placeholder_model.dart';



class PlaceholderRepo {
  Map<String, String> headers = {'Accept': 'application/json'};

  Future<List<PlaceholderModel>> getListOfUsers() async {
    http.Response response = await http.get(Uri.parse(AppEndPoints.placeholderJson));

    if(response.statusCode == 200){
      var body = convert.jsonDecode(response.body);
      List<PlaceholderModel> placeholderList = [];
      for (var item in body) {
        placeholderList.add(PlaceholderModel.fromJson(item));
      }
      return placeholderList;
    }else{
      throw Exception();
    }
  }
}