import 'package:safe_trip_driver_app/data/models/student_model.dart';
import 'package:safe_trip_driver_app/core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:safe_trip_driver_app/index.dart';

class StudentCard extends StatelessWidget {
  final StudentModel studentModel;
  final Function onPickedUpClicked;
  final Function onFailureClicked;
  const StudentCard(
      {super.key,
      required this.onPickedUpClicked,
      required this.onFailureClicked,
      required this.studentModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.cardBackgroundColor,
              borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 16,
                horizontal: AppPaddings.cardHorizontalContentPadding,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppRadius.cardBorderRadius),
                        child: Image.network(studentModel.student.logo,
                            width: 16.w,
                            height: 16.w,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset('assets/images/app_logo.png',
                                    width: 16.w, height: 16.w)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal:
                                  AppPaddings.cardHorizontalContentPadding),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                studentModel.student.name,
                                // placeholderModel.name,
                                style: regularStyle(
                                    AppFontSize.xLarge,
                                    AppColors.darkTextColor,
                                    getFontFamilyFromLanguageCode()),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                studentModel.student.gender,
                                // placeholderModel.phone,
                                style: regularStyle(
                                    AppFontSize.small,
                                    AppColors.darkTextColor,
                                    getFontFamilyFromLanguageCode()),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                studentModel.student.schoolModel.name,
                                // placeholderModel.website,
                                style: regularStyle(
                                    AppFontSize.small,
                                    AppColors.darkTextColor,
                                    getFontFamilyFromLanguageCode()),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              await launchUrl(
                                  Uri(
                                    scheme: 'tel',
                                    path:
                                        '01023668557', // TODO: change my phone number to student phone number
                                  ),
                                  mode: LaunchMode.externalApplication);
                            },
                            icon: const Icon(Icons.phone),
                            color: AppColors.primaryColor,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.scaffoldBackgroundColor),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              if (!studentModel.student.location!
                                  .contains(',')) {
                                Get.snackbar(
                                  'Error :',
                                  'location not found',
                                );
                              } else {
                                String location = studentModel
                                            .student.location !=
                                        null
                                    ? studentModel.student.location!
                                    : '29.972780616663897,32.538301871939105';
                                var lat = location.substring(
                                    location.indexOf('', 0),
                                    location.lastIndexOf(','));
                                var lon = location.substring(
                                    location.lastIndexOf(',') + 1,
                                    location.length);
                                await launchUrl(
                                    Uri.parse(
                                        'https://www.google.com/maps/search/?api=1&query=$lat,$lon'),
                                    mode: LaunchMode.externalApplication);
                              }
                            },
                            icon: const Icon(Icons.directions),
                            color: AppColors.primaryColor,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.scaffoldBackgroundColor),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  studentModel.status != 'waiting'
                      ? Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                  buttonTextLabel: 'failure_button'.tr,
                                  buttonBackgroundColor: AppColors.errorColor,
                                  onClick: () {
                                    onFailureClicked();
                                  }),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Expanded(
                              child: CustomButton(
                                  buttonTextLabel: 'picked_up_button'.tr,
                                  buttonBackgroundColor: AppColors.successColor,
                                  onClick: () {
                                    onPickedUpClicked();
                                  }),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
          studentModel.status != 'waiting'
              ? Positioned(
                  top: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                        color: studentModel.status == 'on_the_way'
                            ? AppColors.successColor
                            : studentModel.status == 'absent'
                                ? AppColors.errorColor
                                : AppColors.primaryColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(AppRadius.cardBorderRadius),
                          bottomLeft: Radius.circular(AppRadius.cardBorderRadius),
                        ) // green shaped
                        ),
                    child: Text(
                        studentModel.status == 'on_the_way'
                            ? 'On The Way'
                            : studentModel.status == 'absent'
                                ? 'Absent'
                                : 'Arrived',
                        style:
                            const TextStyle(color: AppColors.whiteTextColor)),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
