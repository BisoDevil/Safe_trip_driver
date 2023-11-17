import 'package:safe_trip_driver_app/index.dart';

String getFontFamilyFromLanguageCode() {
  String languageCode = Get.deviceLocale!.languageCode;
  if (languageCode == 'ar') {
    return AppFonts.arabicFontFamily;
  } else {
    return AppFonts.englishFontFamily;
  }
}

ThemeData getAppTheme() {
  return ThemeData(
    /// colors theme
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.lightPrimaryColor,
    primaryColorDark: AppColors.darkPrimaryColor,
    disabledColor: AppColors.disabledColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    splashColor: AppColors.lightPrimaryColor,

    /// font family
    fontFamily: getFontFamilyFromLanguageCode(),

    /// app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: false,
      titleTextStyle: regularStyle(AppFontSize.large, AppColors.darkTextColor,
          getFontFamilyFromLanguageCode()),
      color: AppColors.appBarBackgroundColor,
      // iconTheme: const IconThemeData(
      //     color: AppColors.primaryColor,
      // ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.lightIconColor,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      // for main section title
      titleLarge: boldStyle(AppFontSize.xxxLarge, AppColors.darkTextColor,
          getFontFamilyFromLanguageCode()),
      // for subsection title
      titleMedium: regularStyle(AppFontSize.xxLarge, AppColors.darkTextColor,
          getFontFamilyFromLanguageCode()),
      // for appbar title
      titleSmall: regularStyle(AppFontSize.xLarge, AppColors.darkTextColor,
          getFontFamilyFromLanguageCode()),
      // hint text and label under subsections
      labelLarge: boldStyle(AppFontSize.large, AppColors.lightTextColor,
          getFontFamilyFromLanguageCode()),
      // very small details
      labelMedium: regularStyle(AppFontSize.large, AppColors.lightTextColor,
          getFontFamilyFromLanguageCode()),
      // for small details
      labelSmall: boldStyle(AppFontSize.small, AppColors.whiteTextColor,
          getFontFamilyFromLanguageCode()),
      // for buttons labels
      displayMedium: regularStyle(AppFontSize.xxLarge, AppColors.whiteTextColor,
          getFontFamilyFromLanguageCode()),
    ),

    /// input theme
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: AppPaddings.inputHorizontalContentPadding,
          vertical: AppPaddings.inputVerticalContentPadding),
      hintStyle: regularStyle(AppFontSize.small, AppColors.lightTextColor,
          getFontFamilyFromLanguageCode()),
      prefixIconColor: AppColors.primaryColor,
      enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
          borderSide: BorderSide.none),
      focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
          borderSide: BorderSide.none),
      errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
          borderSide: BorderSide.none),
      focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
          borderSide: BorderSide.none),
      disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
          borderSide: BorderSide.none),
    ),

    /// divider theme
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerColor,
      indent: 12,
      endIndent: 12,
      thickness: 1.4,
      space: 48,
    ),

    /// progressIndicatorTheme
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primaryColor),

    /// button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
            )),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                vertical: 4)
            ))),
  );
}
