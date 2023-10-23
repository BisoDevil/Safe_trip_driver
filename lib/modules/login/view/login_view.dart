import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_trip_driver_app/core/theme/app_colors.dart';
import 'package:safe_trip_driver_app/modules/login/view/widgets/custom_login_button.dart';
import 'package:safe_trip_driver_app/core/widgets/custom_text_form_field.dart';
import 'package:safe_trip_driver_app/utils/extensions.dart';
import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController>{
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:  Column (
                children:[
                  Image.asset('assets/images/app_logo.png' , height: 25.h,),
                  SizedBox(height: 5.h),
                  CustomTextFormField(
                    hintText: 'Phone Number ...',
                    textEditingController: controller.emailController,
                    isPassword: false,
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  CustomTextFormField(
                    hintText: 'Password ...',
                    textEditingController: controller.passwordController,
                    isPassword: true,
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  SizedBox(height: 5.h),

                  CustomLoginButton(
                      buttonTextLabel: 'Login',
                      buttonBackgroundColor: AppColors.primaryColor,
                      labelColor: Colors.white,
                      onClick: (){
                        controller.onLoginClicked();
                      }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
