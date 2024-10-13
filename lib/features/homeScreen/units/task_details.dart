part of '../view.dart';

// ignore: must_be_immutable
class TaskDetails extends StatefulWidget {
  TaskDetails(this.title, this.image, this.desc, this.date, this.priority,
      this.status, this.id,
      {super.key});
  String? title;
  String? id;
  String? image;
  String? desc;
  String? date;
  String? priority;
  String? status;
  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
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
            leadingWidth: 150.w,
            actions: [
              PopupMenuButton(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                              onTap: () {
                                MagicRouter.navigateTo(EditTask(
                                    widget.title,
                                    widget.image,
                                    widget.desc,
                                    widget.date,
                                    widget.priority,
                                    widget.status,widget.id));
                              },
                              child: CustomText(
                                  text: 'Edit',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500))),
                      PopupMenuItem(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                              onTap: () {
                                TasksCubit.get(context)
                                    .deleteTask(widget.id, context);
                              },
                              child: CustomText(
                                  text: 'Delete',
                                  color: const Color(0xFFFF7D53),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500))),
                    ];
                  })
            ],
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
                          text: "  Task Details",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: const Color(0xFF24252C)),
                    ],
                  )),
            ),
            toolbarHeight: 30.h),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  CachedNetworkImage(
                    imageUrl: 'https://todo.iraqsapp.com/images/${widget.image.toString()}',
                    imageBuilder: (context, imageProvider) => Container(
                      height: 225.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorManager.backgroundColor,
                    )),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                  SizedBox(height: 15.h),
                  CustomText(
                      text: widget.title,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: const Color(0xFF24252C)),
                  SizedBox(height: 8.h),
                  CustomText(
                      text: widget.desc,
                      fontWeight: FontWeight.w400,
                      line: 7,
                      fontSize: 14.sp,
                      color: const Color(0xFF24252C).withOpacity(.6)),
                  SizedBox(height: 5.h),
                  Expansion(
                    widget.date,
                    const Color(0xFF24252C),
                    enabled: false,
                    FontWeight.w400,
                    AppImages.calendar,
                    // column: 'yes',
                    // onTap: () async {
                    //   DateTime? newDate = await showDatePicker(
                    //     useRootNavigator: false,
                    //     context: context,
                    //     barrierDismissible: false,
                    //     firstDate: DateTime(2024),
                    //     lastDate: DateTime(3000),
                    //     initialDate: DateTime.now(),
                    //   );
                    //   if (newDate == null) {
                    //     return;
                    //   }
                    //   newDate.day.toString();
                    //   newDate.month.toString();
                    //   newDate.year.toString();
                    //
                    //   date = DateFormat('yyyy-MM-dd', 'en').format(newDate);
                    //   setState(() {
                    //     title = '$date';
                    //   });
                    // },
                    children: [],
                  ),
                  SizedBox(height: 5.h),
                  Expansion(
                    widget.status,
                    ColorManager.backgroundColor,
                    enabled: false,
                    FontWeight.w700,
                    AppImages.arrowDown,
                    children: [],
                  ),
                  SizedBox(height: 5.h),
                  Expansion(
                    widget.priority,
                    ColorManager.backgroundColor,
                    enabled: false,
                    FontWeight.w700,
                    AppImages.arrowDown,
                    flag: 'flag',
                    children: [],
                  ),
                  SizedBox(height: 5.h),
                  Image(
                    image: const AssetImage(AppImages.qr),
                    height: 326.h,
                    width: 1.sw,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
