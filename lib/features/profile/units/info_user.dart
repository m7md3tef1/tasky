part of '../view.dart';

// ignore: must_be_immutable
class InfoUser extends StatelessWidget {
  InfoUser(this.text, this.text1, {super.key, this.isPhone});
  var text;
  var text1;
  bool? isPhone = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadiusDirectional.circular(10.r)),
        child: isPhone == true
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: text.toString().toUpperCase(),
                            color: const Color(0xFF2F2F2F).withOpacity(.4),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 3.h),
                        CustomText(
                            text: text1,
                            color: const Color(0xFF2F2F2F).withOpacity(.6),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        await Clipboard.setData(
                            ClipboardData(
                                text:text1))
                            .then(
                              (value) {
                            return ScaffoldMessenger.of(
                                context)
                                .showSnackBar(
                              const SnackBar(
                                content:
                                Text('Code Copied'),
                              ),
                            );
                          },
                        );
                      },
                      child: const Image(
                          image: AssetImage(AppImages.copy),
                          color: ColorManager.backgroundColor),
                    )
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: text,
                            color: const Color(0xFF2F2F2F).withOpacity(.4),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 3.h),
                        CustomText(
                            text: text1,
                            color: const Color(0xFF2F2F2F).withOpacity(.6),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
