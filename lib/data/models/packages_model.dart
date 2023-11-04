// class PackageModel {
//
//   final int id;
//   final String name;
//   final String countOfTrip;
//   final String price;
//   final String note;
//
//   PackageModel({
//     required this.id,
//     required this.name,
//     required this.countOfTrip,
//     required this.price,
//     required this.note,
//   });
//
//   factory PackageModel.fromJson(Map<String, dynamic> json) {
//     return PackageModel(
//       id: json['id'],
//       name: json['name'],
//       countOfTrip: json['count_of_trip'],
//       price: json['price'],
//       note: json['note'],
//     );
//   }
// }