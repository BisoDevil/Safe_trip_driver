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
      Uri.parse('${AppEndPoints.studentsInTrip}/3'), // TODO: change trip_id value from 3 to tripId variable
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

  Future<String> changeStudentState (String driverToken , int studentId , int tripId , String status ) async {
    headers['authorization'] = 'Bearer $driverToken';
    Map<String, dynamic> body = {'student_id': '1', 'trip_id': '3' , 'status': status}; // TODO: change student_id and trip_id values from 1 & 3 to studentId & tripId
    http.Response response = await http.post(
      Uri.parse(AppEndPoints.changeStudentState),
      headers: headers,
      body: body,
    );
    if(response.statusCode == 200){
      return (json.decode(response.body)['message']);
    }else{
      return ('error');
    }

  }
}