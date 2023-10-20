import 'package:flutter/material.dart';
import 'package:safe_trip_driver_app/core/app_colors.dart';
import 'package:safe_trip_driver_app/core/app_styles.dart';
import 'package:safe_trip_driver_app/modules/home/view/widgets/student_card_button.dart';
import 'package:safe_trip_driver_app/utils/extensions.dart';
import '../../../../core/app_fonts.dart';
import '../../../../core/app_values.dart';

class StudentCard extends StatelessWidget {
  final String studentName;
  final String studentImage;
  final String studentPhoneNumber;
  final String studentAddress;
  const StudentCard({super.key, required this.studentName, required this.studentPhoneNumber, required this.studentAddress, required this.studentImage});

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
                    studentImage,
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
                          studentName ,
                          style: regularStyle(AppFontSize.xLarge, AppColors.darkTextColor, AppFonts.englishFontFamily),

                        ),
                        Text(
                          studentPhoneNumber,
                          style: regularStyle(AppFontSize.small, AppColors.darkTextColor, AppFonts.englishFontFamily),
                        ),
                        Text(
                          studentAddress,
                          style: regularStyle(AppFontSize.medium, AppColors.darkTextColor, AppFonts.englishFontFamily),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.phone),
                      color: AppColors.primaryColor,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.scaffoldBackgroundColor),
                      ),
                    ),
                    IconButton(
                      onPressed: (){},
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
                      buttonTextLabel: 'failure',
                      buttonBackgroundColor: AppColors.errorColor,
                      labelColor: Colors.white,
                      onClick: (){}
                  ),
                ),
                Expanded(
                  child: StudentCardButton(
                      buttonTextLabel: 'Picked Up',
                      buttonBackgroundColor: AppColors.successColor,
                      labelColor: Colors.white,
                      onClick: (){}
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
