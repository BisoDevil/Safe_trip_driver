import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/profile/view/widgets/custom_label.dart';
import 'package:safe_trip_driver_app/modules/profile/view/widgets/custom_list_tile.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslationKeys.profileScreenAppBarTitle.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPaddings.mainScreenVerticalPadding,
          horizontal: AppPaddings.mainScreenHorizontalPadding,
        ),
        child: ListView(
          children: [
            CustomLabel(label: AppTranslationKeys.accountSettingLabel.tr),
            CustomListTile(
                leadingIcon: Icons.person_4_outlined,
                title: AppTranslationKeys.personalInfo.tr,
                onTap: (){
                  Get.toNamed(Routes.personalInfoRoute);
                },
                color: Colors.white,
              logout: true,
            ),
            CustomLabel(label: AppTranslationKeys.preferencesSettingLabel.tr),
            CustomListTile(
                leadingIcon: Icons.language_rounded,
                title: AppTranslationKeys.language.tr,
                onTap: (){

                },
                color: Colors.white,
              logout: true,
            ),
            CustomListTile(
                leadingIcon: Icons.notifications_none_rounded,
                title: AppTranslationKeys.notifications.tr,
                onTap: (){

                },
                color: Colors.white,
              logout: true,
            ),
            CustomLabel(label: AppTranslationKeys.supportSettingLabel.tr),
            CustomListTile(
                leadingIcon: Icons.chat_outlined,
                title: AppTranslationKeys.contactUs.tr,
                onTap: (){

                },
                color: Colors.white,
              logout: true,
            ),
            CustomListTile(
                leadingIcon: Icons.help_outline_outlined,
                title: AppTranslationKeys.about.tr,
                onTap: (){

                },
                color: Colors.white,
              logout: true,
            ),
            CustomListTile(
                leadingIcon: Icons.logout,
                title: AppTranslationKeys.logout.tr,
                onTap: (){

                },
                color: Colors.white,
              logout: false,
            ),
          ]
        ),
      )
    );
  }
}
