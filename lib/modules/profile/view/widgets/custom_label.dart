import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_theme.dart';
class CustomLabel extends StatelessWidget {
  final String label;
  const CustomLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
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
