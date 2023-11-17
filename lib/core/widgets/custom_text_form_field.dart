import 'package:flutter/material.dart';
import 'package:safe_trip_driver_app/core/theme/app_values.dart';


class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final bool isPassword;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final String? initialValue;
  final Widget prefixIcon;
  final TextInputType? keyboardType;
  final bool? isEnable;
  final ValueChanged<String?>? onSaved;
  final FormFieldValidator<String>? validator;
  const CustomTextFormField({super.key, this.hintText, required this.isPassword, this.suffixIcon, required this.prefixIcon, this.suffixIconColor, this.keyboardType, this.initialValue, this.isEnable,  this.onSaved, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: AppPaddings.inputVerticalPadding),
      child: TextFormField(
        initialValue: initialValue,
        obscureText: isPassword ? true : false ,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: suffixIconColor,
          enabled: isEnable ?? true,
        ),
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        onSaved: onSaved,
        validator: validator,
        onFieldSubmitted: onSaved,

      ),
    );
  }
}
