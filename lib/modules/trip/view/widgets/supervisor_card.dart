import 'package:safe_trip_driver_app/data/models/supervisor_model.dart';
import 'package:safe_trip_driver_app/index.dart';

import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_styles.dart';
class SupervisorCard extends StatelessWidget {
  final SupervisorModel supervisorModel;
  const SupervisorCard({super.key, required this.supervisorModel});

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
                            supervisorModel.name,
                            style: regularStyle(AppFontSize.xxLarge, AppColors.whiteTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            supervisorModel.nationalId,
                            style: regularStyle(AppFontSize.medium, AppColors.whiteTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            supervisorModel.mobile,
                            style: regularStyle(AppFontSize.medium, AppColors.whiteTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    CircleAvatar(
                      radius: 10.w,
                      backgroundColor: AppColors.whiteTextColor,
                      backgroundImage:NetworkImage(supervisorModel.logo),
                      onBackgroundImageError: (exception, stackTrace) => Container(),
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
