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
                    children: [
                      CustomTextFormField(
                        hintText: AppTranslationKeys.passwordFieldHint.tr,
                        textEditingController: personalInfoController.nameController,
                        isPassword: personalInfoController.passwordSecure ? true : false,
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: personalInfoController.passwordSecure
                            ? InkWell(child: const Icon(Icons.visibility_off) , onTap: (){personalInfoController.changePasswordVisibility();},)
                            : InkWell(child: const Icon(Icons.visibility) , onTap: (){personalInfoController.changePasswordVisibility();},),
                        keyboardType: TextInputType.text,
                        initialValue: personalInfoController.driverModel.name,
                      )
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
