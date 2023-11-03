import 'package:safe_trip_driver_app/core/widgets/custom_label.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/personal_info/controller/personal_info_controller.dart';

import '../../../core/widgets/custom_text_form_field.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppTranslationKeys.personalInfo.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPaddings.mainScreenVerticalPadding,
            horizontal: AppPaddings.mainScreenHorizontalPadding,
          ),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            scrollDirection: Axis.vertical,
            child: GetBuilder<PersonalInfoController>(
              builder: (personalInfoController) {
                if(personalInfoController.loading == false){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppPaddings.verticalPaddingBetween),
                        child: Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.black12,
                            child: Image.network(
                                personalInfoController.driverModel.image,
                                fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.person , size: 50,color: AppColors.primaryColor,),
                            ),
                          ),
                        ),
                      ),
                      CustomLabel(label: 'Full Name'),
                      CustomTextFormField(
                        hintText: AppTranslationKeys.passwordFieldHint.tr,
                        textEditingController: personalInfoController.nameController,
                        isPassword: personalInfoController.passwordSecure ? true : false,
                        prefixIcon: const Icon(Icons.person),
                        keyboardType: TextInputType.text,
                      ),
                      CustomLabel(label: 'Mobile'),
                      CustomTextFormField(
                        hintText: AppTranslationKeys.passwordFieldHint.tr,
                        textEditingController: personalInfoController.mobileController,
                        isPassword: personalInfoController.passwordSecure ? true : false,
                        prefixIcon: const Icon(Icons.person),
                        keyboardType: TextInputType.text,
                      ),
                      CustomLabel(label: 'Gander'),
                      CustomTextFormField(
                        hintText: AppTranslationKeys.passwordFieldHint.tr,
                        isPassword: personalInfoController.passwordSecure ? true : false,
                        prefixIcon: const Icon(Icons.person),
                        keyboardType: TextInputType.text,
                        isEnable: false,
                        initialValue: personalInfoController.driverModel.gander,
                      ),
                      CustomLabel(label: 'Code'),
                      CustomTextFormField(
                        hintText: AppTranslationKeys.passwordFieldHint.tr,
                        isPassword: personalInfoController.passwordSecure ? true : false,
                        prefixIcon: const Icon(Icons.person),
                        keyboardType: TextInputType.text,
                        isEnable: false,
                        initialValue: personalInfoController.driverModel.code,
                      ),
                      CustomLabel(label: 'National Id'),
                      CustomTextFormField(
                        hintText: AppTranslationKeys.passwordFieldHint.tr,
                        isPassword: personalInfoController.passwordSecure ? true : false,
                        prefixIcon: const Icon(Icons.person),
                        keyboardType: TextInputType.text,
                        isEnable: false,
                        initialValue: personalInfoController.driverModel.nationalId,
                      ),

                    ],
                  );
                }else{
                  return Center(
                    child: SizedBox(
                      height: 6.h,
                      width: 6.h,
                      child: const CircularProgressIndicator(strokeWidth: 1.5),
                    ),
                  );
                }
              }
            ),
          ),
        ));
  }
}
