class RouteModel {

  final int id;
  final String name;
  final String addressFrom;
  final String addressTo;
  final String locationFrom;
  final String locationTo;
  final String dateFrom;
  final String dateTo;

  RouteModel({
    required this.id,
    required this.name,
    required this.addressFrom,
    required this.addressTo,
    required this.locationFrom,
    required this.locationTo,
    required this.dateFrom,
    required this.dateTo,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      id: json['id'],
      name: json['name'],
      addressFrom: json['address_from'],
      addressTo: json['address_to'],
      locationFrom: json['location_from'],
      locationTo: json['location_to'],
      dateFrom: json['date_from'],
      dateTo: json['date_to'],
    );
  }

}