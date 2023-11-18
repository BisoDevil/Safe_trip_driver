
import 'package:safe_trip_driver_app/data/models/school_model.dart';

class StudentModel {
  final int id;
  final int studentId;
  late final String status;
  final Student student;

  StudentModel({
    required this.id,
    required this.studentId,
    required this.status,
    required this.student
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      studentId: json['student_id'],
      status: json['status'],
      student: Student.fromJson(json['student']),
    );
  }
}


class Student {
  final int id;
  final String logo;
  final String name;
  final String gender;
  final String address;
  final String? location;
  final SchoolModel schoolModel;

  Student({
    required this.id,
    required this.logo,
    required this.name,
    required this.gender,
    required this.address,
    this.location,
    required this.schoolModel,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      logo: json['logo'],
      name: json['name'],
      gender: json['gander'],
      address: json['address'],
      location: json['location'] ?? 'location not found',
      schoolModel: SchoolModel.fromJson(json['school']),
    );
  }

}