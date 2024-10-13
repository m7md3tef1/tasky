import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/app_images/app_images.dart';
import 'package:untitled/core/router/router.dart';
import 'package:untitled/features/auth/cubit/auth_cubit.dart';

import '../../core/color_manager/color_manager.dart';
import '../../core/widgets/custom_text.dart';
part 'units/info_user.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});
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
                          text: "  Profile",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: const Color(0xFF24252C)),
                    ],
                  )),
            ),
            toolbarHeight: 30.h),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 24.h),
                InfoUser('Name', AuthCubit.get(context).getUserDataModel!.displayName.toString()),
                InfoUser('Phone', AuthCubit.get(context).getUserDataModel!.username.toString(),isPhone: true),
                InfoUser('Level', AuthCubit.get(context).getUserDataModel!.level.toString()),
                InfoUser('Years of experience',AuthCubit.get(context).getUserDataModel!.experienceYears.toString()),
                InfoUser('Location', AuthCubit.get(context).getUserDataModel!.address.toString()),
              ],
            ),
          ),
        ));
  }
}
