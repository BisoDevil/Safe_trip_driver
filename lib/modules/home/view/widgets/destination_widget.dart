import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_styles.dart';
class Destination extends StatelessWidget {
  final String time;
  final IconData iconData;
  const Destination({super.key, required this.time, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Icon(iconData , color: AppColors.darkTextColor,),
          Text(time , style: regularStyle(AppFontSize.small, AppColors.darkTextColor, AppFonts.englishFontFamily),),
        ]
    );
  }
}