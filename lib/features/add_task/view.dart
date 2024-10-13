import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/app_images/app_images.dart';
import 'package:untitled/core/dialoges/toast.dart';
import 'package:untitled/features/add_task/cubit/add_task_cubit.dart';
import 'package:untitled/features/layout/todo_app_cubit.dart';

import '../../core/color_manager/color_manager.dart';
import '../../core/dialoges/pick_image.dart';
import '../../core/router/router.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/customtextform.dart';
import '../homeScreen/view.dart';
part 'units/body.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            leadingWidth: 180.w,
            leading: InkWell(
              onTap: () {
                MagicRouter.pop();
              },
              child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.w),
                  child: Row(
                    children: [
                      const Image(
                          image: AssetImage(AppImages.arrowRight),
                          color: Colors.black),
                      CustomText(
                          text: "  Add new task",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: const Color(0xFF24252C)),
                    ],
                  )),
            ),
            toolbarHeight: 30.h),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Body()
              ],
            ),
          ),
        ));
  }
}
