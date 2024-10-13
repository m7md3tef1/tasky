part of '../view.dart';

class Expansion extends StatelessWidget {
  Expansion(this.title, this.color, this.font, this.asset,
      {super.key,
      required this.children,
      this.enabled,
      this.flag,
      this.onTap,
      this.column});
  var title;
  var color;
  var onTap;
  var flag;
  bool? enabled;
  var font;
  var asset;
  var column;
  var children = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ExpansionTile(
          initiallyExpanded: false,
          enabled: enabled!,
          collapsedTextColor: Colors.red,
          tilePadding: EdgeInsets.symmetric(horizontal: 10.w),
          collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: const BorderSide(color: Color(0xFFF0ECFF))),
          textColor: Colors.grey.withOpacity(.2),
          collapsedBackgroundColor: const Color(0xFFF0ECFF),
          backgroundColor: const Color(0xFFF0ECFF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: const BorderSide(color: Color(0xFFF0ECFF))),
          title: flag != null
              ? Row(children: [
                  const Icon(Icons.flag, color: ColorManager.backgroundColor),
                  CustomText(
                      text: title,
                      fontWeight: font,
                      fontSize:
                          ScreenUtil().orientation == Orientation.landscape
                              ? 7.sp
                              : 14.sp,
                      color: color)
                ])
              : column == null
                  ? CustomText(
                      text: title,
                      fontWeight: font,
                      fontSize:
                          ScreenUtil().orientation == Orientation.landscape
                              ? 7.sp
                              : 14.sp,
                      color: color)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                            text: 'End Date',
                            fontWeight: FontWeight.w400,
                            fontSize: ScreenUtil().orientation ==
                                    Orientation.landscape
                                ? 5.sp
                                : 9.sp,
                            color: const Color(0xFF6E6A7C)),
                        CustomText(
                            text: title,
                            fontWeight: font,
                            fontSize: ScreenUtil().orientation ==
                                    Orientation.landscape
                                ? 7.sp
                                : 14.sp,
                            color: color),
                      ],
                    ),
          trailing: Image(
              color: ColorManager.backgroundColor, image: AssetImage(asset)),
          childrenPadding: EdgeInsetsDirectional.only(start: 5.w),
          children: children),
    );
  }
}
