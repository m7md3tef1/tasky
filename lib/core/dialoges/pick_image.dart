import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/layout/todo_app_cubit.dart';
import 'package:untitled/features/layout/todo_app_cubit.dart';

import '../color_manager/color_manager.dart';
import '../widgets/custom_text.dart';

// ignore: must_be_immutable
class PickImageDialog extends StatelessWidget {
  PickImageDialog({super.key, this.profile = false});
  bool profile = false;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        ('Select...'),
        style: TextStyle(
            fontFamily: 'tt',
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
      children: [
        SimpleDialogOption(
            child: Row(
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 30.sp,
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  ('Pick From Camera'),
                  style: TextStyle(
                      fontFamily: 'tt',
                      fontSize: 15.sp,
                      color: ColorManager.backgroundColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onPressed: () {
              TodoAppCubit.get(context).pickFromCamera(context);
            }),
        SimpleDialogOption(
            child: Row(
              children: [
                Icon(
                  Icons.image_outlined,
                  size: 30.sp,
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  ('Pick From Gallery'),
                  style: TextStyle(
                      fontFamily: 'tt',
                      fontSize: 15.sp,
                      color: ColorManager.backgroundColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onPressed: () async {
              TodoAppCubit.get(context).pickFromGallery(context);
            }),
      ],
    );
  }
}
