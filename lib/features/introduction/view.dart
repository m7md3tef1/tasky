import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/app_images/app_images.dart';
import 'package:untitled/core/router/router.dart';
import 'package:untitled/core/widgets/custom_button.dart';
import 'package:untitled/core/widgets/custom_text.dart';
import 'package:untitled/features/auth/view/login.dart';
part 'units/page_contant.dart';

class ViewIntro extends StatelessWidget {
  const ViewIntro({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            leading: const SizedBox(),
            toolbarHeight: 0),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Image(
                    image: const AssetImage(AppImages.constImage),
                    fit: BoxFit.contain,
                    height: 482.h),
                const PageContent(),
                CustomButton(
                    text: 'Let’s Start',
                    function: () {
                      MagicRouter.navigateAndPopAll(TodoAppLogin());
                    },
                    icon: const AssetImage(AppImages.arrowLeft))
              ],
            ),
          ),
        ));
  }
}
