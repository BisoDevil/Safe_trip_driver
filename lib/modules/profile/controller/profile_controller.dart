import 'package:safe_trip_driver_app/data/models/contact_us_model.dart';
import 'package:safe_trip_driver_app/data/repositories/contact_us_repo.dart';
import 'package:safe_trip_driver_app/index.dart';

import '../view/widgets/contact_bottom_sheet.dart';
import '../view/widgets/language_bottom_sheet.dart';
import '../view/widgets/notifications_bottom_sheet.dart';

class ProfileController extends GetxController{

  bool loading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  showLanguageSettings(){
    Get.bottomSheet(
      const LanguageBottomSheet(),
    );
  }

  showNotificationsSettings(){
    Get.bottomSheet(
      const NotificationsBottomSheet(),
    );
  }

  showContactUs() async {
    ContactUsModel contactUsModel = await ContactUsRepo().getContactUsData();
    Get.bottomSheet(
      ContactUsBottomSheet(contactUsModel : contactUsModel),
    );
  }

}
