import 'package:safe_trip_driver_app/core/theme/app_fonts.dart';
import 'package:safe_trip_driver_app/core/theme/app_styles.dart';
import 'package:safe_trip_driver_app/index.dart';
import 'package:safe_trip_driver_app/modules/profile/view/widgets/custom_selectable_list_tile.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 30.h,
      color: AppColors.scaffoldBackgroundColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppTranslationKeys.language.tr , style: regularStyle(AppFontSize.large, AppColors.inactiveTextColor, getFontFamilyFromLanguageCode()),),
          CustomSelectableListTile(
              title: 'English',
              onTap: (){},
              color: Colors.white,
              active: false,
          ),
          CustomSelectableListTile(
            title: 'عربي',
            onTap: (){},
            color: Colors.white,
            active: true,
          )
        ],
      ),
    );
  }
}
