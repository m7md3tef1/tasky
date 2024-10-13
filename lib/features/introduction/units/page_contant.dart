part of '../view.dart';

class PageContent extends StatelessWidget {
  const PageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 24.h),
          CustomText(
              text: 'Task Management & To-Do List',
              line: 2,
              align: TextAlign.center,
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700),
          SizedBox(height: 16.h),
          CustomText(
              text:
                  'This productive tool is designed to help you better manage your task project-wise conveniently!',
              line: 3,
              align: TextAlign.center,
              color: const Color(0xFF6E6A7C),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          SizedBox(height: 30.h)
        ],
      ),
    );
  }
}
