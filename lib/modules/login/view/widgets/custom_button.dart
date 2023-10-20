import 'package:flutter/material.dart';
import 'package:safe_trip_driver_app/core/app_fonts.dart';
import 'package:safe_trip_driver_app/core/app_styles.dart';

import '../../../../core/app_values.dart';

class CustomButton extends StatelessWidget {
  final String buttonTextLabel;
  final Color buttonBackgroundColor;
  final Color labelColor;
  final VoidCallback onClick;

  const CustomButton(
      {super.key,
        required this.buttonTextLabel,
        required this.buttonBackgroundColor,
        required this.labelColor,
        required this.onClick
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.inputHorizontalPadding , vertical: AppPaddings.inputVerticalPadding),
      child: MaterialButton(
        onPressed: onClick,
        color: buttonBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius)),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    buttonTextLabel,
                  style: regularStyle(AppFontSize.medium, Colors.white, AppFonts.englishFontFamily)
                )
            ),
          ],
        ),
      ),
    );
  }
}