import 'package:safe_trip_driver_app/modules/login/view/widgets/custom_login_button.dart';
import 'package:safe_trip_driver_app/core/widgets/custom_text_form_field.dart';
import 'package:safe_trip_driver_app/index.dart';

class LoginView extends GetView<LoginController>{
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
              CustomTextFormField(
                hintText: AppTranslationKeys.phoneFieldHint.tr,
                textEditingController: controller.emailController,
                isPassword: false,
                prefixIcon: const Icon(Icons.phone),
              ),
              CustomTextFormField(
                hintText: AppTranslationKeys.passwordFieldHint.tr,
                textEditingController: controller.passwordController,
                isPassword: true,
                prefixIcon: const Icon(Icons.lock),
              ),
              SizedBox(height: 5.h),

              CustomLoginButton(
                  buttonTextLabel: AppTranslationKeys.loginButton.tr,
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
    );
  }
}
