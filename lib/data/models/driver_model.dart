import 'package:hive_flutter/hive_flutter.dart';
part 'generated/driver_model.g.dart';
@HiveType(typeId: 1)
class DriverModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String code;
  @HiveField(2)
  final String mobile;
  @HiveField(3)
  final String nationalId;
  @HiveField(4)
  final String gander;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final String type;
  @HiveField(7)
  final String? token;


  DriverModel({
    required this.name,
    required this.code,
    required this.mobile,
    required this.nationalId,
    required this.gander,
    required this.image,
    required this.type,
    required this.token,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      name: json['name'],
      code: json['code'],
      mobile: json['mobile'],
      nationalId: json['national_id'],
      gander: json['gander'],
      image: json['image'],
      type: json['type'],
      token: json['token'],
    );
  }
}