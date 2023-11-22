import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class LocationServices {

  Future insertDataToFirestore(String tripId , String driverToken , String lat , String lng , String speed) async {
    DateTime dateTime = DateTime.now();
    String dateString = DateFormat('dd-MM-yyyy - kk:mm').format(dateTime);
    Map<String, dynamic> map = {};
    map['TripId'] = tripId;
    map['Lat'] = lat;
    map['Lng'] = lng;
    map['Speed'] = speed;
    map['driverToken'] = driverToken;
    map['DateTime'] = dateString;

    DatabaseReference ref = FirebaseDatabase.instance.ref("location/trip $tripId tracking");
    await ref.set(map).then((value) => {
      // log('Upload Success')
    }).onError((error, stackTrace) => {
      // log('Upload Failed')
    });
  }

  updateDataToFirestore(String tripId , String lat , String lng , String speed) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("location");
    Map<String, dynamic> map = {
      'trip $tripId tracking/Lat' : lat,
      'trip $tripId tracking/Lng' : lng,
      'trip $tripId tracking/Speed' : speed
    };
    await ref.update(map).then((value) => {
      // log('Upload Success')
    }).onError((error, stackTrace) => {
      // log('Upload Failed')
    });
  }

}