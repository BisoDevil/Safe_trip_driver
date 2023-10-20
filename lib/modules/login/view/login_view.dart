import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_trip_driver_app/core/app_colors.dart';
import 'package:safe_trip_driver_app/modules/login/view/widgets/custom_button.dart';
import 'package:safe_trip_driver_app/modules/login/view/widgets/custom_text_form_field.dart';
import 'package:safe_trip_driver_app/utils/extensions.dart';
import '../../../constants/app_paths.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (loginController) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(AppAssetsPaths.appLogo , height: 25.h,),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                            hintText: 'Phone Number ...',
                            textEditingController: loginController.emailController,
                            isPassword: false,
                            prefixIcon: const Icon(Icons.phone),
                        ),
                        CustomTextFormField(
                            hintText: 'Password ...',
                            textEditingController: loginController.passwordController,
                            isPassword: true,
                            prefixIcon: const Icon(Icons.lock),
                        ),
                        SizedBox(height: 5.h),

                        CustomButton(
                            buttonTextLabel: 'Login',
                            buttonBackgroundColor: AppColors.primaryColor,
                            labelColor: Colors.white,
                            onClick: (){
                              loginController.onLoginClicked();
                            }
                        )
                      ],
                    ),
                  ),
                ),
              )
            );
          }
      ),
    );
  }
}
