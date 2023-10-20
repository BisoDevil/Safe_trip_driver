import 'package:flutter/material.dart';
import 'package:safe_trip_driver_app/core/app_values.dart';


class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  const CustomTextFormField({super.key, required this.hintText, required this.textEditingController, required this.isPassword, this.suffixIcon, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.inputHorizontalPadding , vertical: AppPaddings.inputVerticalPadding),
      child: TextFormField(
        controller: textEditingController,
        obscureText: isPassword ? true : false ,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,

        ),
      ),
    );
  }
}
