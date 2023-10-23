import 'package:flutter/material.dart';
import 'package:safe_trip_driver_app/utils/extensions.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_values.dart';

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
            '${AppStrings.welcomeTitle} , $driverName',
            style: regularStyle(AppFontSize.xLarge, AppColors.darkTextColor , AppFonts.englishFontFamily),
          ),
          SizedBox(height: 2.h),
          Text(
            AppStrings.welcomeSubTitle,
            style: regularStyle(AppFontSize.medium, AppColors.darkTextColor , AppFonts.englishFontFamily),
          )
        ]
      ),
    );
  }
}
