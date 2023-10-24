class PlaceholderModel {


    int id;
    String name;
    String username;
    String phone;
    String website;

    PlaceholderModel({
          required this.id,
          required this.name,
          required this.username,
          required this.phone,
          required this.website
    });

    factory PlaceholderModel.fromJson(Map<String, dynamic> json) => PlaceholderModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      phone: json["phone"],
      website: json["website"],
    );

    Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'username': username,
      'phone': phone,
      'website': website
    };
}