import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../theme/app_styles.dart';
import '../theme/app_theme.dart';
import '../theme/app_values.dart';
class CustomLabel extends StatelessWidget {
  final String label;
  const CustomLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPaddings.mainScreenHorizontalPadding,
      ),
      child: Text(
        label,
        style: regularStyle(
            AppFontSize.large,
            AppColors.darkTextColor,
            getFontFamilyFromLanguageCode()
        ),
      ),
    );
  }
}
