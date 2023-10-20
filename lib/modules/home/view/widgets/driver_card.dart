import 'package:flutter/material.dart';
import 'package:safe_trip_driver_app/constants/app_paths.dart';
import 'package:safe_trip_driver_app/core/app_fonts.dart';
import 'package:safe_trip_driver_app/core/app_styles.dart';
import 'package:safe_trip_driver_app/core/app_values.dart';
import 'package:safe_trip_driver_app/utils/extensions.dart';
import '../../../../core/app_colors.dart';

class DriverCard extends StatelessWidget {
  final String driverFullName;
  final String schoolName;
  final String busNumber;
  const DriverCard({super.key, required this.driverFullName, required this.schoolName, required this.busNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
        gradient: const LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.darkPrimaryColor,
          ],
          begin: AlignmentDirectional(1, -1),
          end: AlignmentDirectional(-1, 1),
        )
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: AppPaddings.cardVerticalContentPadding,
          horizontal: AppPaddings.cardHorizontalContentPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: AppPaddings.padding4),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  /// driver image
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
                      child: Image.asset(
                        AppAssetsPaths.appLogo,
                        width: 16.w,
                        height: 16.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4,),
                  /// driver data
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      driverFullName,
                        style: regularStyle(AppFontSize.xxLarge, AppColors.whiteTextColor, AppFonts.englishFontFamily),
                      ),
                      Text(
                          schoolName,
                        style: regularStyle(AppFontSize.medium, AppColors.whiteTextColor, AppFonts.englishFontFamily),
                      ),
                      Text(
                        busNumber,
                        style: regularStyle(AppFontSize.medium, AppColors.whiteTextColor, AppFonts.englishFontFamily),
                      ),
                    ],
                  ),
                  const Spacer(),
                  /// emergency button
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.emergency_share),
                    color: AppColors.errorColor,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.scaffoldBackgroundColor),
                    ),
                  ),
                ],
              ),
            ),


            // TODO: add Divider here
            // const Divider(
            //   height: 24,
            //   thickness: 1,
            //   color: AppColors.dividerColor,
            // ),
           // TODO: add more driver information
           // TODO: add emergency button

          ],
        ),
      ),
    );
  }
}
