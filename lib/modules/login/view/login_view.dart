import 'package:safe_trip_driver_app/core/widgets/loading.dart';
import 'package:safe_trip_driver_app/modules/login/view/widgets/custom_login_button.dart';
import 'package:safe_trip_driver_app/core/widgets/custom_text_form_field.dart';
import 'package:safe_trip_driver_app/index.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: AppPaddings.mainScreenVerticalPadding,
            horizontal: AppPaddings.mainScreenHorizontalPadding,
          ),
          child:  Form(
            key: controller.formKey,
            child: Column (
              children:[
                Image.asset('assets/images/app_logo.png' , height: 25.h,),
                SizedBox(height: 5.h),
                CustomTextFormField(
                  hintText: 'phone_field_hint'.tr,
                  isPassword: false,
                  prefixIcon: const Icon(Icons.phone),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    controller.phone = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'error_empty_field_message'.tr;
                    }else if(value.length != 11 ){ // TODO: change phone number length to Saudi arabia phone length
                      return 'Phone number is incorrect';
                    }
                    return null;
                  },
                ),

              GetBuilder<LoginController>(
                builder: (loginController) {
                  return CustomTextFormField(
                    hintText: 'password_field_hint'.tr,
                    isPassword: loginController.passwordSecure ? true : false,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      child: Icon( loginController.passwordSecure ?  Icons.visibility_off : Icons.visibility),
                      onTap: (){
                        controller.changePasswordVisibility();
                      },
                    ),
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'error_empty_field_message'.tr;
                      }else {
                        return null;
                      }
                    },
                  );

                }
              ),
                SizedBox(height: 5.h),
                GetBuilder<LoginController>(
                  builder: (loginController){ {
                    if (loginController.loading == false) {
                      return CustomLoginButton(
                          buttonTextLabel: 'login_button'.tr,
                          onClick: (){
                            final isValid = loginController.formKey.currentState?.validate();
                            loginController.formKey.currentState?.save();
                            if(isValid == true){
                              loginController.onLoginClicked();
                            }
                          },
                      );
                    }else{
                      return const Loading();
                      }
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
