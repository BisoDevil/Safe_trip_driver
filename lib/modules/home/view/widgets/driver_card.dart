import 'package:safe_trip_driver_app/data/models/driver_model.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_styles.dart';
import 'package:safe_trip_driver_app/index.dart';

class DriverCard extends StatelessWidget {
  final DriverModel driver;
  final String tripStartTime;
  final String tripEndTime;
  const DriverCard({super.key, required this.tripStartTime, required this.tripEndTime, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPaddings.verticalPaddingBetween),
      child: Container(
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
                padding: const EdgeInsetsDirectional.symmetric(horizontal: AppPaddings.cardHorizontalContentPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    /// driver data
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          driver.name,
                            style: regularStyle(AppFontSize.xxLarge, AppColors.whiteTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                              driver.nationalId,
                            style: regularStyle(AppFontSize.medium, AppColors.whiteTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            driver.code,
                            style: regularStyle(AppFontSize.medium, AppColors.whiteTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

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

              // const Divider( color: AppColors.whiteTextColor,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Destination(time: tripStartTime, iconData:Icons.home_filled),
              //     const Icon(Icons.arrow_forward_sharp , color: AppColors.whiteTextColor,),
              //     Transform.flip(
              //       flipX: (Get.deviceLocale == const Locale('en', 'US')) ? false : true,
              //       child: Image.asset('assets/images/school-bus.png', height: 8.h , width: 12.w, ),
              //     ),
              //     const Icon(Icons.arrow_forward_sharp , color: AppColors.whiteTextColor,),
              //     Destination(time: tripEndTime, iconData: Icons.school),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
