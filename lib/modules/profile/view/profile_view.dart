import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/profile/controller/profile_controller.dart';
import 'package:safe_trip_driver_app/core/widgets/custom_label.dart';
import 'package:safe_trip_driver_app/modules/profile/view/widgets/custom_list_tile.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('profile_screen_appBar_title'.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPaddings.mainScreenVerticalPadding,
            horizontal: AppPaddings.mainScreenHorizontalPadding,
          ),
          child: ListView(children: [
            CustomLabel(label: 'account_setting_label'.tr),
            CustomListTile(
              leadingIcon: Icons.person_4_outlined,
              title: 'personal_info'.tr,
              onTap: () {
                Get.toNamed(Routes.personalInfoRoute);
              },
              color: Colors.white,
              logout: true,
            ),
            CustomLabel(label: 'preferences_setting_label'.tr),
            CustomListTile(
              leadingIcon: Icons.language_rounded,
              title: 'language'.tr,
              onTap: () {
                controller.showLanguageSettings();
              },
              color: Colors.white,
              logout: true,
            ),
            CustomListTile(
              leadingIcon: Icons.notifications_none_rounded,
              title: 'notifications'.tr,
              onTap: () {
               controller.showNotificationsSettings();
              },
              color: Colors.white,
              logout: true,
            ),
            CustomLabel(label: 'support_setting_label'.tr),
            CustomListTile(
              leadingIcon: Icons.chat_outlined,
              title: 'contact_us'.tr,
              onTap: () {
                controller.showContactUs();
              },
              color: Colors.white,
              logout: true,
            ),
            CustomListTile(
              leadingIcon: Icons.help_outline_outlined,
              title: 'about'.tr,
              onTap: () {},
              color: Colors.white,
              logout: true,
            ),

            GetBuilder<LoginController>(
              init: LoginController(),
                builder: (loginController) {
                  return CustomListTile(
                    leadingIcon: Icons.logout,
                    title: 'logout'.tr,
                    onTap: () {
                      loginController.onLogoutClicked();
                    },
                    color: Colors.white,
                    logout: false,
                  );
                }),
          ]),
        ));
  }
}
