
import 'package:safe_trip_driver_app/index.dart';

class WelcomeTitle extends StatelessWidget {
  final String driverName;
  const WelcomeTitle({super.key, required this.driverName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPaddings.verticalPaddingBetween),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${'welcome_title'.tr} , $driverName',
            style: regularStyle(AppFontSize.xLarge, AppColors.darkTextColor , getFontFamilyFromLanguageCode()),
          ),
          SizedBox(height: 2.h),
          Text(
            'welcome_subtitle'.tr,
            style: regularStyle(AppFontSize.medium, AppColors.darkTextColor , getFontFamilyFromLanguageCode()),
          )
        ]
      ),
    );
  }
}
