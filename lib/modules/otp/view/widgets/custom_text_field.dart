import 'package:flutter/material.dart';



class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool isLastDigit;
  final Function? onEnded;
  const CustomTextField({super.key, required this.controller, required this.autoFocus, required this.isLastDigit, this.onEnded});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            if (isLastDigit) {
              FocusScope.of(context).unfocus();
              onEnded!();
            }else{
              FocusScope.of(context).nextFocus();
            }

          }
        },
      ),
    );
  }
}
