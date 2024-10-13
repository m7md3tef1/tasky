import 'package:flutter/material.dart';

import '../../core/color_manager/color_manager.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String? text;
  Color? color;
  double? fontSize;
  var fontWeight;
  var align;
  var colordir;
  var space;
  var height;
  var textHeight;
  var textDirection;
  var width;
  var line;
  var thick;
  TextDecoration? textDecoration;

  CustomText(
      {super.key,
      this.space,
      this.textDecoration,
      this.textDirection,
      this.width,
      this.thick,
      this.colordir,
      this.height,
      this.align,
      this.line,
      this.textHeight,
      required this.text,
      this.color = ColorManager.blackColor,
      this.fontSize,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        style: TextStyle(
            letterSpacing: space,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: textHeight,
            fontFamily: 'tj',
            decoration: textDecoration,
            decorationThickness: thick ?? 1.5,
            decorationColor: colordir ?? ColorManager.backgroundColor),
        maxLines: line ?? 1,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        textAlign: align);
  }
}
