import 'dart:developer';
import 'dart:convert';
import 'package:safe_trip_driver_app/data/models/student_model.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/app_endpoints.dart';

class StudentRepo {

  Map<String, String> headers = {
    'app-token': AppEndPoints.appToken,
    'Accept': 'application/json',
  };

  Future<List<StudentModel>> getStudentsInTrip (String driverToken , int tripId) async {
    headers['authorization'] = 'Bearer $driverToken';
    http.Response response = await http.get(
      Uri.parse('${AppEndPoints.studentsInTrip}/3'),
      headers: headers,
    );

    if(response.statusCode == 200){
      final List result = json.decode(response.body)['data'];
      return result.map((e) => StudentModel.fromJson(e)).toList();
    }else{
      log(json.decode(response.body)['message']);
      throw Exception();
    }
  }

}