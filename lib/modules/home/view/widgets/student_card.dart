import 'package:safe_trip_driver_app/modules/home/view/widgets/student_card_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_styles.dart';
import 'package:safe_trip_driver_app/index.dart';

class StudentCard extends StatelessWidget {
  //final PlaceholderModel placeholderModel;
  final Function onPickedUpClicked;
  final Function onFailureClicked;
  const StudentCard({super.key, required this.onPickedUpClicked, required this.onFailureClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    'https://placehold.co/600x400/png',
                    width: 16.w,
                    height: 16.w,
                    fit: BoxFit.cover,
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
                          'student name',
                          // placeholderModel.name,
                          style: regularStyle(AppFontSize.xLarge, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),
                          overflow: TextOverflow.ellipsis,

                        ),
                        Text(
                          'student phone',
                          // placeholderModel.phone,
                          style: regularStyle(AppFontSize.small, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'student email',
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
            const Divider(
              height: 24,
              thickness: 1,
              color: AppColors.dividerColor,
            ),
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
    );

  }
}
