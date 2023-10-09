import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_gpt/util/hex_to_color.dart';

class AppTheme {
  static final BrightnessModel lightModel = LightBrightnessModel();
  static final BrightnessModel darkModel = DarkBrightnessModel();

  static final Color expenseColor = hexToColor("#FF9A9A");
  static final Color incomeColor = hexToColor("#9AB8FF");
  static final Color brandColor = hexToColor("#31C66D");

  static MaterialColor _hexToMaterialColor(int hexColor) {
    return MaterialColor(
      hexColor,
      <int, Color>{
        50: Color(hexColor),
        100: Color(hexColor),
        200: Color(hexColor),
        300: Color(hexColor),
        400: Color(hexColor),
        500: Color(hexColor), // 主要色
        600: Color(hexColor),
        700: Color(hexColor),
        800: Color(hexColor),
        900: Color(hexColor),
      },
    );
  }

  static ThemeData themeData({bool isLightModel = true}) {
    BrightnessModel model = isLightModel ? lightModel : darkModel;
    return ThemeData(
        primarySwatch: _hexToMaterialColor(0xFFE0008D),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              color: model.primaryTextColor(),
              fontSize: 56.sp,
              fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              color: model.primaryTextColor(),
              fontSize: 32.sp,
              fontWeight: FontWeight.w300),
          displaySmall: TextStyle(
              color: model.primaryTextColor(),
              fontSize: 24.sp,
              fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
              color: model.primaryTextColor(),
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
          titleSmall: TextStyle(
              color: model.primaryTextColor(),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(
              color: model.primaryTextColor(),
              fontSize: 16.sp,
              fontWeight: FontWeight.w300),
          bodySmall: TextStyle(
              color: model.primaryTextColor(),
              fontSize: 12.sp,
              fontWeight: FontWeight.w300),
          labelLarge: TextStyle(
              color: model.primaryTextColor(),
              fontSize: 10.sp,
              fontWeight: FontWeight.w300),
        ));
  }
}

abstract class BrightnessModel {
  Color primaryTextColor();
  Color secondTextColor();
  Color grayColor();
  Color backgroundColor();
  Color modelColor();
}

class LightBrightnessModel extends BrightnessModel {
  @override
  Color backgroundColor() {
    return hexToColor("#F5F5F5");
  }

  @override
  Color grayColor() {
    return hexToColor("#D9D9D9");
  }

  @override
  Color primaryTextColor() {
    return hexToColor("#404040");
  }

  @override
  Color secondTextColor() {
    return hexToColor("#A6A6A6");
  }

  @override
  Color modelColor() {
    return hexToColor("#FCFCFC");
  }
}

class DarkBrightnessModel extends BrightnessModel {
  @override
  Color backgroundColor() {
    return hexToColor("#595968");
  }

  @override
  Color grayColor() {
    return hexToColor("#898A93");
  }

  @override
  Color primaryTextColor() {
    return hexToColor("#EAEAEA");
  }

  @override
  Color secondTextColor() {
    return hexToColor("#BABABF");
  }

  @override
  Color modelColor() {
    return hexToColor("#28293D");
  }
}
