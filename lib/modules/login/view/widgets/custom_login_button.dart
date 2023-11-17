
import 'package:safe_trip_driver_app/index.dart';



class CustomLoginButton extends StatelessWidget {
  final String buttonTextLabel;
  final Color? buttonBackgroundColor;
  final VoidCallback onClick;

  const CustomLoginButton(
      {super.key,
        required this.buttonTextLabel,
        this.buttonBackgroundColor,
        required this.onClick
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackgroundColor,
      ),
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
    );
  }
}