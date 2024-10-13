import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_manager/color_manager.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  var function;
  String? text;
  double? width;
  double? height;
  var color;
  var colorborder;
  var colortext;
  double? font;
  var icon;
  var image;
  var color2;
  CustomButton(
      {super.key,
      this.color2,
      this.image,
      this.function,
      this.colorborder,
      this.colortext,
      required this.text,
      this.font,
      this.width,
      this.height,
      this.icon,
      this.color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Container(
            width: width ?? 1.sw,
            height: height ??
                (ScreenUtil().orientation == Orientation.landscape
                    ? 45.h
                    : 45.h),
            decoration: BoxDecoration(
                color: color ?? ColorManager.backgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      blurRadius: 0,
                      color: color2 == null
                          ? Colors.transparent
                          : color2.withOpacity(.2)),
                ],
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: colorborder ?? Colors.transparent)),
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: text,
                        align: TextAlign.center,
                        color: colortext ?? Colors.white,
                        fontSize: font ??
                            (ScreenUtil().orientation == Orientation.landscape
                                ? 10.sp
                                : 19.sp),
                        fontWeight: FontWeight.w700),
                    icon == null ? const SizedBox() : SizedBox(width: 5.w),
                    icon == null ? const SizedBox() : Image(image: icon)
                  ],
                ))),
      ),
    );
  }
}
