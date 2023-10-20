import 'package:flutter/material.dart';

import 'app_fonts.dart';


TextStyle _getTextStyle (double fontSize, Color color, FontWeight fontWeight , String fontFamily) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
  }


/// regular style
TextStyle regularStyle (double fontSize , Color fontColor ,String fontFamily) {
  return _getTextStyle(
    fontSize,
    fontColor,
    AppFontWeight.regular,
    fontFamily,
  );
}

/// semi bold style
TextStyle semiBoldStyle (double fontSize , Color fontColor ,String fontFamily) {
  return _getTextStyle(
    fontSize,
    fontColor,
    AppFontWeight.semiBold,
    fontFamily,
  );
}

/// bold style
TextStyle boldStyle (double fontSize , Color fontColor ,String fontFamily) {
  return _getTextStyle(
    fontSize,
    fontColor,
    AppFontWeight.bold,
    fontFamily,
  );
}
