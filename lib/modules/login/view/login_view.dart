import 'package:safe_trip_driver_app/modules/login/view/widgets/custom_login_button.dart';
import 'package:safe_trip_driver_app/core/widgets/custom_text_form_field.dart';
import 'package:safe_trip_driver_app/index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.vertical,
          child:  Column (
            children:[
              Image.asset('assets/images/app_logo.png' , height: 25.h,),
              SizedBox(height: 5.h),
              GetBuilder<LoginController>(
                builder: (loginController) {
                  {
                    return CustomTextFormField(
                      hintText: AppTranslationKeys.phoneFieldHint.tr,
                      textEditingController: loginController.phoneController,
                      isPassword: false,
                      prefixIcon: const Icon(Icons.phone),
                      keyboardType: TextInputType.phone,
                    );
                  }
                }
              ),
              GetBuilder<LoginController>(
                builder: (loginController){ {
                  return CustomTextFormField(
                    hintText: AppTranslationKeys.passwordFieldHint.tr,
                    textEditingController: loginController.passwordController,
                    isPassword: loginController.passwordSecure ? true : false,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: loginController.passwordSecure
                        ? InkWell(child: const Icon(Icons.visibility_off) , onTap: (){loginController.changePasswordVisibility();},)
                        : InkWell(child: const Icon(Icons.visibility) , onTap: (){loginController.changePasswordVisibility();},),
                    keyboardType: TextInputType.text,
                  );
                }}
              ),
              SizedBox(height: 5.h),

              GetBuilder<LoginController>(
                builder: (loginController){ {
                  return CustomLoginButton(
                      buttonTextLabel: AppTranslationKeys.loginButton.tr,
                      buttonBackgroundColor: AppColors.primaryColor,
                      labelColor: Colors.white,
                      onClick: (){
                        loginController.onLoginClicked();
                      }
                  );
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
