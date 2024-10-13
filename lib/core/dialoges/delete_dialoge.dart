import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_manager/color_manager.dart';
import '../router/router.dart';
import '../widgets/custom_button.dart';

// ignore: must_be_immutable
class DeleteEditDialog extends StatelessWidget {
  DeleteEditDialog(this.name, this.name1, this.function,
      {this.message, super.key});
  Function? function;
  var message;
  String? name;
  String? name1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.start,
      actionsPadding: const EdgeInsetsDirectional.only(bottom: 0, top: 0),
      contentPadding: message != null
          ? const EdgeInsetsDirectional.only(bottom: 0, top: 0)
          : EdgeInsetsDirectional.only(bottom: 10.h, top: 20.h),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      content: message != null
          ? SizedBox(
              height: .15.sh,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$name1',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'tj',
                            fontSize: ScreenUtil().orientation ==
                                    Orientation.landscape
                                ? 7.sp
                                : 14.sp,
                            color: ColorManager.backgroundColor)),
                    Text(  'للإستمرار سيتم إفراغ السله ؟',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'tj',
                            fontSize: ScreenUtil().orientation ==
                                    Orientation.landscape
                                ? 7.sp
                                : 14.sp,
                            color: ColorManager.backgroundColor))
                  ]),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Warning! Are you sure to',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'tj',
                        fontSize:
                            ScreenUtil().orientation == Orientation.landscape
                                ? 7.sp
                                : 12.sp,
                        color: ColorManager.backgroundColor)),
                Text(' $name1',
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'tj',
                        fontSize:
                            ScreenUtil().orientation == Orientation.landscape
                                ? 7.sp
                                : 12.sp,
                        color: ColorManager.backgroundColor)),
              ],
            ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Divider(color: Colors.grey, thickness: 1, height: 5),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          text: 'Ok',
                          color: Colors.transparent,
                          colortext: Colors.black,
                          function: () {
                            function!();
                          })),
                  const VerticalDivider(
                      thickness: 1, width: 20, color: Colors.grey),
                  Expanded(
                      child: CustomButton(
                          text:'Cancel',
                          colortext: Colors.red,
                          function: () {
                            MagicRouter.pop();
                          },
                          color: Colors.transparent)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
/*
elegant_notification: ^1.14.0

ElegantNotification.info(
	title:  Text("Info"),
	description:  Text("This account will be updated once you exit")
).show(context);

 */
