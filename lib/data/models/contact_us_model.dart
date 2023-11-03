class ContactUsModel {

  final String mobile;
  final String phone;
  final String email;
  final String facebook;
  final String instagram;
  final String twitter;
  final String linkedin;

  ContactUsModel({
    required this.mobile,
    required this.phone,
    required this.email,
    required this.facebook,
    required this.instagram,
    required this.twitter,
    required this.linkedin,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      mobile: json['mobile'],
      phone: json['phone'],
      email: json['email'],
      facebook: json['facebook'],
      instagram: json['instagram'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
    );
  }
}