import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_trip_driver_app/core/app_colors.dart';
import 'package:safe_trip_driver_app/core/app_fonts.dart';
import 'package:safe_trip_driver_app/core/app_styles.dart';
import 'package:safe_trip_driver_app/modules/otp/controller/otp_controller.dart';
import 'package:safe_trip_driver_app/modules/otp/view/widgets/custom_text_field.dart';
import 'package:safe_trip_driver_app/utils/extensions.dart';


class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      init: OtpController(),
      builder: (otpController) {
        return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Otp'.toUpperCase(),
                        style: boldStyle( AppFontSize.xxxLarge, AppColors.primaryColor, AppFonts.englishFontFamily)
                      ),

                      SizedBox(height: 10.h,),
                      Text(
                          'A 4 Digit Code Has Been Sent To +201023668557',
                          style: boldStyle( AppFontSize.medium, AppColors.lightTextColor, AppFonts.englishFontFamily),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(controller: otpController.fieldOne, autoFocus: true, isLastDigit: false,),
                          CustomTextField(controller: otpController.fieldTwo, autoFocus: false, isLastDigit: false,),
                          CustomTextField(controller: otpController.fieldThree, autoFocus: false, isLastDigit: false,),
                          CustomTextField(
                            controller: otpController.fieldFour,
                            autoFocus: false, isLastDigit: true,
                            onEnded: (){
                              otpController.writeCodeEnded();
                            }
                          ),
                        ]
                      ),
                      SizedBox(height: 4.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Didn\'t Receive The code  ? '),
                          InkWell(
                            onTap: () {
                              otpController.resendCodeButtonClicked();
                            },
                            child: const Text(
                              '  Resend Code',
                              style: TextStyle(
                                  color: AppColors.primaryColor
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        );
      }
    );
  }
}
