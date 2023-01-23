import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme() {
  return ThemeData(
      // primaryColor: AppColors.primary,
      // hintColor: AppColors.hint,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,

      //appBar
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.amberAccent,
        ),
        elevation: 0.0,
        color: Colors.amberAccent,
        titleTextStyle: TextStyle(
          color: Colors.white,
          // fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ));
}
