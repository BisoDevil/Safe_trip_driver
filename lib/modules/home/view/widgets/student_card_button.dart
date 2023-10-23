
import 'package:flutter/material.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_values.dart';

class StudentCardButton extends StatelessWidget {
  final String buttonTextLabel;
  final Color buttonBackgroundColor;
  final Color labelColor;
  final VoidCallback onClick;

  const StudentCardButton(
      {super.key,
        required this.buttonTextLabel,
        required this.buttonBackgroundColor,
        required this.labelColor,
        required this.onClick
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.padding4 , vertical: AppPaddings.inputVerticalPadding),
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