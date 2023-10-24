class StudentModel {

  final int id;
  final String studentName;
  final String studentId;
  final String phoneNumber1;
  final String phoneNumber2;
  final String image;
  final String address;
  final String location;
  final String studentState;

  StudentModel({
    required this.id,
    required this.studentName,
    required this.studentId,
    required this.phoneNumber1,
    required this.phoneNumber2,
    required this.image,
    required this.address,
    required this.location,
    required this.studentState,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      studentName: json['student_name'],
      studentId: json['student_id'],
      phoneNumber1: json['phone_number1'],
      phoneNumber2: json['phone_number2'],
      image: json['image'],
      address: json['address'],
      location: json['location'],
      studentState: json['student_state'],
    );
  }

  // to json
  Map<String, dynamic> toJson() => {
    'id': id,
    'student_name': studentName,
    'student_id': studentId,
    'phone_number1': phoneNumber1,
    'phone_number2': phoneNumber2,
    'image': image,
    'address': address,
    'location': location,
    'student_state': studentState,
  };
}