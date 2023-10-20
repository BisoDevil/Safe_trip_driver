import 'package:flutter/material.dart';
import 'package:safe_trip_driver_app/constants/app_strings.dart';
import 'package:safe_trip_driver_app/utils/extensions.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_fonts.dart';
import '../../../../core/app_styles.dart';

class WelcomeTitle extends StatelessWidget {
  final String driverName;
  const WelcomeTitle({super.key, required this.driverName});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
