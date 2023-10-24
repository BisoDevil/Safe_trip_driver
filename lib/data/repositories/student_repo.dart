import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:safe_trip_driver_app/data/models/student_model.dart';

import '../../core/constants/app_endpoints.dart';

class StudentRepo {
  Map<String, String> headers = {'Accept': 'application/json'};

  Future<List<StudentModel>> getStudentsList(int driverId) async {
    Map<String, dynamic> body = {'driver_id': driverId};
    http.Response response = await http.post(
      Uri.parse(AppEndPoints.getStudentList),
      headers: headers,
      body: body,
    );

    if(response.statusCode == 200){
      var body = convert.jsonDecode(response.body);
      List<StudentModel> students = [];
      for (var item in body['data']) {
        students.add(StudentModel.fromJson(item));
      }
      return students;
    }else{
      throw Exception();
    }
  }




}