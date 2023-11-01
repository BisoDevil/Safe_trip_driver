import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_styles.dart';
import 'package:safe_trip_driver_app/index.dart';

class DriverCard extends StatelessWidget {
  final String driverFullName;
  final String driverImage;
  final String schoolName;
  final String busNumber;
  final String tripStartTime;
  final String tripEndTime;
  const DriverCard({super.key, required this.driverFullName, required this.schoolName, required this.busNumber, required this.tripStartTime, required this.tripEndTime, required this.driverImage});

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
                padding: const EdgeInsetsDirectional.only(top: AppPaddings.padding4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [


                    /// driver image
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppPaddings.padding4),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
                          child: Image.network(
                            driverImage,
                            width: 16.w,
                            height: 16.w,
                            fit: BoxFit.cover,
                            errorBuilder: (context , error , stackTrace){
                              return Image.asset(
                                'assets/images/app_logo.png',
                                width: 16.w,
                                height: 16.w,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                    ),



                    /// driver data
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          driverFullName,
                            style: regularStyle(AppFontSize.xxLarge, AppColors.whiteTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                              schoolName,
                            style: regularStyle(AppFontSize.medium, AppColors.whiteTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            busNumber,
                            style: regularStyle(AppFontSize.medium, AppColors.whiteTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
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

              const Divider( color: AppColors.whiteTextColor,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Destination(time: tripStartTime, iconData:Icons.home_filled),

                  const Icon(Icons.arrow_forward_sharp , color: AppColors.whiteTextColor,),
                  Transform.flip(
                    flipX: (Get.deviceLocale == const Locale('en', 'US')) ? false : true,
                    child: Image.asset('assets/images/school-bus.png', height: 8.h , width: 12.w, ),
                  ),
                  const Icon(Icons.arrow_forward_sharp , color: AppColors.whiteTextColor,),
                  Destination(time: tripEndTime, iconData: Icons.school),
                ],
              )

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
      ),
    );
  }
}

class Destination extends StatelessWidget {
  final String time;
  final IconData iconData;
  const Destination({super.key, required this.time, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Icon(iconData , color: AppColors.whiteTextColor,),
          Text(time , style: regularStyle(AppFontSize.small, AppColors.whiteTextColor, AppFonts.englishFontFamily),),
        ]
    );
  }
}
