import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/core/color_manager/color_manager.dart';

showToast(
    {required String msg,
    required state,
    ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 2,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.sp);
}

enum ToastedStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastedStates states) {
  Color color;
  switch (states) {
    case ToastedStates.SUCCESS:
      color = ColorManager.backgroundColor;
      break;
    case ToastedStates.ERROR:
      color = Colors.red;
      break;
    case ToastedStates.WARNING:
      color = const Color(0xFF545F71);
      break;
  }
  return color;
}
