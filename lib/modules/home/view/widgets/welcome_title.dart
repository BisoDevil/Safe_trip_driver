import 'package:safe_trip_driver_app/core/constants/app_translation_keys.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_styles.dart';
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
            '${AppTranslationKeys.welcomeTitle.tr} , $driverName',
            style: regularStyle(AppFontSize.xLarge, AppColors.darkTextColor , getFontFamilyFromLanguageCode()),
          ),
          SizedBox(height: 2.h),
          Text(
            AppTranslationKeys.welcomeSubTitle.tr,
            style: regularStyle(AppFontSize.medium, AppColors.darkTextColor , getFontFamilyFromLanguageCode()),
          )
        ]
      ),
    );
  }
}
