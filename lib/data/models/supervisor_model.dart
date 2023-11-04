class SupervisorModel {
  final int id;
  final String name;
  final String code;
  final String mobile;
  final String nationalId;
  final String logo;
  final String gander;
  final String note;

  SupervisorModel(
      {required this.id,
      required this.name,
      required this.code,
      required this.mobile,
      required this.nationalId,
      required this.logo,
      required this.gander,
      required this.note});

  // from json

  factory SupervisorModel.fromJson(Map<String, dynamic> json) {
    return SupervisorModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      mobile: json['mobile'],
      nationalId: json['national_id'],
      logo: json['logo'],
      gander: json['gander'],
      note: json['note'],
    );
  }
}
