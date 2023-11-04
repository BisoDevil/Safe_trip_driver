
import 'package:safe_trip_driver_app/index.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_styles.dart';


class CustomLoginButton extends StatelessWidget {
  final String buttonTextLabel;
  final Color buttonBackgroundColor;
  final Color labelColor;
  final VoidCallback onClick;

  const CustomLoginButton(
      {super.key,
        required this.buttonTextLabel,
        required this.buttonBackgroundColor,
        required this.labelColor,
        required this.onClick
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: AppPaddings.inputVerticalPadding),
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
                  style: regularStyle(AppFontSize.medium, Colors.white, getFontFamilyFromLanguageCode())
                )
            ),
          ],
        ),
      ),
    );
  }
}