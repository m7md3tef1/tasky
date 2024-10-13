import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/app_images/app_images.dart';
import 'package:untitled/core/color_manager/color_manager.dart';
import 'package:untitled/features/homeScreen/view.dart';
import '../../core/const/utils.dart';
import '../introduction/view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorManager.backgroundColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            leading: const SizedBox(),
            toolbarHeight: 0),
        body: AnimatedSplashScreen(
            duration: 0,
            splash: Image.asset(AppImages.logo,
                fit: BoxFit.contain, height: 45.h, width: 124.w),
            animationDuration: const Duration(milliseconds: 3000),
            nextScreen: token == '' ?const ViewIntro():const HomeScreen(),
            // splashTransition: SplashTransition.fadeTransition,
            backgroundColor: ColorManager.backgroundColor));
  }
}
