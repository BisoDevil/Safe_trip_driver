import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_styles.dart';
import 'app_values.dart';


String getFontFamily() {
  return AppFonts.englishFontFamily;
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
      fontFamily: getFontFamily(),


      /// app bar theme
      appBarTheme: AppBarTheme(
        centerTitle: false,
        titleTextStyle: regularStyle(AppFontSize.large, AppColors.darkTextColor , AppFonts.englishFontFamily),
        color: AppColors.appBarBackgroundColor,
        iconTheme: const IconThemeData(
            color: AppColors.primaryColor,
        ),
        actionsIconTheme: const IconThemeData(
          color: AppColors.lightIconColor,
        ),
      ),

      // text theme
      textTheme: TextTheme(
        // for main section title
        titleLarge: boldStyle(AppFontSize.xxxLarge, AppColors.darkTextColor , getFontFamily()),
        // for subsection title
        titleMedium: regularStyle(AppFontSize.xxLarge, AppColors.darkTextColor , getFontFamily()),
        // for appbar title
        titleSmall: regularStyle(AppFontSize.xLarge, AppColors.darkTextColor , getFontFamily()),
        // hint text and label under subsections
        labelLarge: boldStyle(AppFontSize.large, AppColors.lightTextColor , getFontFamily()),
        // very small details
        labelMedium: regularStyle(AppFontSize.large, AppColors.lightTextColor , getFontFamily()),
        // for small details
        labelSmall: boldStyle(AppFontSize.small, AppColors.whiteTextColor , getFontFamily()),
        // for buttons labels
        displayMedium: regularStyle(AppFontSize.xxLarge,
            AppColors.whiteTextColor , getFontFamily()),
      ),


      /// input theme
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppPaddings.inputHorizontalContentPadding, vertical: AppPaddings.inputVerticalContentPadding),
        hintStyle: regularStyle(AppFontSize.small, AppColors.lightTextColor , getFontFamily()),
        prefixIconColor: AppColors.primaryColor,

        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
          borderSide: BorderSide.none
        ),

        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
            borderSide: BorderSide.none
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
            borderSide: BorderSide.none
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
            borderSide: BorderSide.none
        ),
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.inputBorderRadius),
          borderSide: BorderSide.none
        ),
      ),

    /// divider theme
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerColor,
        indent: 12,
        endIndent: 12,
        thickness: 1.4,
        space: 48,
      ),

   );
}
