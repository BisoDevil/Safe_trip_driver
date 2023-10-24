class DriverModel {

  final int id;
  final String driverName;
  final String phoneNumber1;
  final String phoneNumber2;
  final String image;
  final String password;
  final String token;


  DriverModel({
    required this.id,
    required this.driverName,
    required this.phoneNumber1,
    required this.phoneNumber2,
    required this.image,
    required this.password,
    required this.token,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'],
      driverName: json['driver_name'],
      phoneNumber1: json['phone_number1'],
      phoneNumber2: json['phone_number2'],
      image: json['image'],
      password: json['password'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'driver_name': driverName,
    'phone_number1': phoneNumber1,
    'phone_number2': phoneNumber2,
    'image': image,
    'password': password,
    'token': token,
  };


}