
class AppEndPoints {
  static const String baseUrl = 'https://safetrip.inhouse.sa';
  static const String appToken = "\$2y\$10\$Bfo8UEn2Yf84SU3B0s2/9OWXkZdTLLMU5iDbtldjRvQl/neQRV.mC";


  // auth endpoints
  static const String login = '$baseUrl/api/sign-in';
  static const String profile = '$baseUrl/api/profile';

  // settings endpoints
  static const String contactUs = '$baseUrl/api/settings/contact-us';



  // trips endpoints

  static const String workingNowTrip = '$baseUrl/api/trips/today/working';
  static const String todayNotStartedTrips = '$baseUrl/api/trips/tomorrow/not_yet'; // todo: change endpoint url from  tomorrow/not_yet to today/not_yet
  static const String tripsFinishedToday = '$baseUrl/api/trips/today/finished';

  static const String tomorrowNotStartedTrips = '$baseUrl/api/trips/tomorrow/not_yet';


  // students endpoints

  static const String studentsInTrip = '$baseUrl/api/students/trip';
  static const String changeStudentState = '$baseUrl/api/students/change-status';
}