import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/widgets/custom_text.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  var label;
  var icondata;
  var suffix;
  var hint;
  var height;
  var style;
  var title;
  var lines;
  var auto;
  var secure;
  var colorBorder;
  var inputFormatters;
  var enable;
  var TextInputAction;
  var iS = true;
  var iN = false;
  var Dir = false;
  Function(String)? onSubmit;
  var type;
  var prefixIcon;
  var border;
  void Function(String?)? onsaved;
  void Function(String?)? onChanged;
  void Function()? onTap;
  String? Function(String?)? validator;
  TextEditingController? controller;
  CustomTextFormField({
    super.key,
    this.onSubmit,
    this.onTap,
    this.height,
    this.type,
    this.hint,
    this.style,
    this.title,
    this.controller,
    this.onChanged,
    this.label,
    this.icondata,
    this.secure,
    this.colorBorder,
    this.onsaved,
    this.validator,
    this.lines,
    this.auto,
    this.inputFormatters,
    this.enable,
    this.prefixIcon,
    this.TextInputAction,
    this.suffix,
    this.border,
    this.iS = true,
    this.iN = false,
    this.Dir = false,
  });
  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.label == null
            ? const SizedBox()
            : Column(
                children: [
                  CustomText(
                      text: widget.label,
                      color: const Color(0xFF6E6A7C),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                  SizedBox(height: 3.h)
                ],
              ),
        InkWell(
          onTap: widget.onTap,
          child: TextFormField(
              inputFormatters: widget.inputFormatters,
              enabled: widget.enable,
              controller: widget.controller,
              onSaved: widget.onsaved,
              validator: widget.validator,
              onFieldSubmitted: widget.onSubmit,
              obscureText: widget.secure!,
              obscuringCharacter: '*',
              textInputAction: widget.TextInputAction,
              keyboardType: widget.type,
              onChanged: widget.onChanged,
              maxLines: widget.lines ?? 1,
              onTap: widget.onTap,
              autovalidateMode: widget.auto,
              style: TextStyle(
                  fontFamily: 'tj',
                  color: const Color(0xFF2E2B2B),
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil().orientation == Orientation.landscape
                      ? 8.sp
                      : 16.sp),
              decoration: InputDecoration(
                  errorStyle: TextStyle(
                      fontFamily: 'tj',
                      color: Colors.red,
                      fontSize:
                          ScreenUtil().orientation == Orientation.landscape
                              ? 10.sp
                              : 12.sp),
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(15.w, 10.h, 0.0, 10.h),
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                      color: const Color(0xFFD6D6D6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                  suffixIcon: widget.suffix,
                  prefixIcon: widget.prefixIcon,
                  enabledBorder: widget.border ??
                      OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                              color: Color(0xFFBABABA), width: 1)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          const BorderSide(color: Color(0xFFBABABA), width: 1)),
                  border: widget.border ??
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFBABABA), width: 1)),
                  suffixIconColor: const Color(0xFFBABABA))),
        ),
      ],
    );
  }
}
