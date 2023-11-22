import 'dart:developer';

import 'package:safe_trip_driver_app/data/models/contact_us_model.dart';
import 'package:safe_trip_driver_app/data/repositories/contact_us_repo.dart';
import 'package:safe_trip_driver_app/index.dart';

import '../view/widgets/contact_bottom_sheet.dart';
import '../view/widgets/language_bottom_sheet.dart';
import '../view/widgets/notifications_bottom_sheet.dart';

class ProfileController extends GetxController{

  bool loading = false;
  Locale? language;



  showLanguageSettings()async{
    loading = true;
    language = await getLanguage();
    Get.bottomSheet(
      const LanguageBottomSheet(),
      backgroundColor: AppColors.scaffoldBackgroundColor,
    );
    log(language!.languageCode.toString());
    loading = false;
    update();
  }

  Future<Locale?> getLanguage()async{
    var languageBox = await Hive.openBox('app-language');
    if(languageBox.containsKey('language')){
      language = Locale(languageBox.get('language'));
    }else{
      language = Get.deviceLocale;
    }
    return language;
  }

  updateLanguage(Locale locale) async {
    var languageBox = await Hive.openBox('app-language');
    languageBox.put('language', locale.languageCode);
    Get.back();
    Get.updateLocale(locale);
  }


  showNotificationsSettings(){
    Get.bottomSheet(
      const NotificationsBottomSheet(),
      backgroundColor: AppColors.scaffoldBackgroundColor,
    );
  }

  showContactUs() async {
    ContactUsModel contactUsModel = await ContactUsRepo().getContactUsData();
    Get.bottomSheet(
      ContactUsBottomSheet(contactUsModel : contactUsModel),
      backgroundColor: AppColors.scaffoldBackgroundColor,

    );
  }

}
