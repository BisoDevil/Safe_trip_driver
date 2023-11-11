import 'package:safe_trip_driver_app/data/models/student_model.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/student_card_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:safe_trip_driver_app/index.dart';

class StudentCard extends StatelessWidget {

  final StudentModel studentModel;
  final Function onPickedUpClicked;
  final Function onFailureClicked;
  const StudentCard({super.key, required this.onPickedUpClicked, required this.onFailureClicked, required this.studentModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: AppPaddings.cardVerticalContentPadding,
            horizontal: AppPaddings.cardHorizontalContentPadding,
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
                    child: Image.network(
                      studentModel.student.logo,
                      width: 16.w,
                      height: 16.w,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                          'assets/images/app_logo.png',
                          width: 16.w,
                          height: 16.w
                        )

                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.cardHorizontalContentPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            studentModel.student.name,
                            // placeholderModel.name,
                            style: regularStyle(AppFontSize.xLarge, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,

                          ),
                          Text(
                            studentModel.student.gender,
                            // placeholderModel.phone,
                            style: regularStyle(AppFontSize.small, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            studentModel.student.schoolModel.name,
                            // placeholderModel.website,
                            style: regularStyle(AppFontSize.small, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async
                          {
                            // TODO: open dialer and call the student
                            await launchUrl(
                            Uri(
                              scheme: 'tel',
                              path: '01023668557',
                            ),
                            mode: LaunchMode.externalApplication
                            );
                          },
                        icon: const Icon(Icons.phone),
                        color: AppColors.primaryColor,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.scaffoldBackgroundColor),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          // TODO: open student location
                          await launchUrl(Uri.parse('https://maps.app.goo.gl/ZViLAFH24GqqUyVbA?g_st=iw'),
                              mode: LaunchMode.externalApplication);
                        },
                        icon: const Icon(Icons.directions),
                        color: AppColors.primaryColor,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.scaffoldBackgroundColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 3.h,),
              Row(
                children: [
                  Expanded(
                    child: StudentCardButton(
                        buttonTextLabel: AppTranslationKeys.failureButton.tr,
                        buttonBackgroundColor: AppColors.errorColor,
                        labelColor: Colors.white,
                        onClick: (){
                          onFailureClicked();
                        }
                    ),
                  ),
                  Expanded(
                    child: StudentCardButton(
                        buttonTextLabel: AppTranslationKeys.pickedUpButton.tr,
                        buttonBackgroundColor: AppColors.successColor,
                        labelColor: Colors.white,
                        onClick: (){
                          onPickedUpClicked();
                        }
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}
