import 'package:safe_trip_driver_app/data/models/driver_model.dart';
import 'package:safe_trip_driver_app/index.dart';

class DriverCard extends StatelessWidget {
  final DriverModel driver;

  const DriverCard({super.key, required this.driver});

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
            ],
          ),
        ),
      ),
    );
  }
}
