import 'package:safe_trip_driver_app/core/widgets/custom_label.dart';
import 'package:safe_trip_driver_app/core/widgets/loading.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/personal_info/controller/personal_info_controller.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class PersonalInfoView extends GetView<PersonalInfoController> {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('personal_info'.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPaddings.mainScreenVerticalPadding,
            horizontal: AppPaddings.mainScreenHorizontalPadding,
          ),
          child: SingleChildScrollView(
            child: GetBuilder<PersonalInfoController>(
                builder: (personalInfoController) {
              if (personalInfoController.loading == false) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppPaddings.verticalPaddingBetween),
                      child: Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.black12,
                          backgroundImage: NetworkImage(
                            personalInfoController.driverModel.image,
                          ),
                          onBackgroundImageError: (exception, stackTrace) =>
                              const Icon(
                            Icons.person,
                            size: 50,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const CustomLabel(label: 'Full Name'),
                    CustomTextFormField(
                      isPassword: personalInfoController.passwordSecure ? true : false,
                      prefixIcon: const Icon(Icons.person),
                      initialValue: personalInfoController.driverModel.name,
                      onSaved: (value) {
                        personalInfoController.name = value!;
                      },
                    ),
                    const CustomLabel(label: 'Mobile'),
                    CustomTextFormField(
                      isPassword: personalInfoController.passwordSecure ? true : false,
                      prefixIcon: const Icon(Icons.phone_android),
                      initialValue: personalInfoController.driverModel.mobile,
                      keyboardType: TextInputType.number,
                    ),
                    const CustomLabel(label: 'Gander'),
                    CustomTextFormField(
                      isPassword: false,
                      prefixIcon: const Icon(Icons.perm_contact_calendar_sharp),

                      isEnable: false,
                      initialValue: personalInfoController.driverModel.gander,
                    ),
                    const CustomLabel(label: 'Code'),
                    CustomTextFormField(
                      isPassword:
                          personalInfoController.passwordSecure ? true : false,
                      prefixIcon: const Icon(Icons.code_off),
                      isEnable: false,
                      initialValue: personalInfoController.driverModel.code,
                    ),
                    const CustomLabel(label: 'National Id'),
                    CustomTextFormField(
                      isPassword:
                          personalInfoController.passwordSecure ? true : false,
                      prefixIcon: const Icon(Icons.numbers),
                      isEnable: false,
                      initialValue:
                          personalInfoController.driverModel.nationalId,
                    ),
                  ],
                );
              } else {
                return const Center(child: Loading(),);
              }
            }),
          ),
        ));
  }
}
