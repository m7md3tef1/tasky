import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xFFFB990D),
  appBarTheme: const AppBarTheme(
      titleSpacing: 20,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontFamily: 'tj',
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold)),
  iconTheme: const IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontFamily: 'tj',
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.black),
    titleMedium: TextStyle(
        fontFamily: 'tj',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.black,
        height: 1.3),
  ),
  buttonTheme: const ButtonThemeData(buttonColor: Color(0xFFFB990D)),
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFB990D)),
);

ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFFFB990D),
    appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Colors.black,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontFamily: 'tj',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontFamily: 'tj',
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.white),
        titleLarge: TextStyle(
            fontFamily: 'tj',
            fontWeight: FontWeight.w400,
            fontSize: 22.sp,
            color: Colors.white,
            height: 1.3),
        titleMedium: TextStyle(
            fontFamily: 'tj',
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: Colors.white,
            height: 1.3)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFB990D),
        unselectedItemColor: Colors.white,
        elevation: 20,
        selectedLabelStyle: TextStyle(fontFamily: 'tj', fontSize: 15.sp),
        unselectedLabelStyle: TextStyle(fontFamily: 'tj', fontSize: 15.sp)),
    checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.white;
      }
      return Colors.white;
    })),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFB990D))
);
