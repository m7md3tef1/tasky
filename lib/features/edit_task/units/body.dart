part of '../view.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  Body(this.title, this.image, this.desc, this.date, this.priority, this.status,
      this.id,
      {super.key});
  String? title;
  var id;
  String? image;
  String? desc;
  String? date;
  String? priority;
  String? status;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var dateController = TextEditingController();
  var levelController = TextEditingController();
  var descriptionController = TextEditingController();
  var titleController = TextEditingController();
  String? priority = 'low';
  String? status = 'InProgress';
  var formKey = GlobalKey<FormState>();
  List<String> names = ["low", "medium", "high"];
  List<String> statusNames = ["inProgress", "Waiting", "Finished"];
  var image;
  bool? isEditImage = false;
  @override
  void initState() {
    isEditImage = false;
    TodoAppCubit.get(context).image = null;
    dateController.text = widget.date!;
    priority = widget.priority!;
    descriptionController.text = widget.desc!;
    levelController.text = widget.status!;
    titleController.text = widget.title!;
    image = widget.image;
    status = widget.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoAppCubit, TodoAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ImageCamera || state is ImageGallery) {
          image = TodoAppCubit.get(context).image;
          isEditImage = true;
        }
        return BlocConsumer<EditTaskCubit, EditTaskState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                TodoAppCubit.get(context).image != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24.h),
                            InkWell(
                              onTap: () {
                                setState(() {});
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    useRootNavigator: false,
                                    builder: (context) => PickImageDialog());
                              },
                              child: Image(
                                image:
                                    FileImage(TodoAppCubit.get(context).image),
                                width: .9.sw,
                                height: 200.h,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {});
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  useRootNavigator: false,
                                  builder: (context) => PickImageDialog());
                            },
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://todo.iraqsapp.com/images/${widget.image}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: .9.sw,
                                height: 200.h,
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
                          ),
                          Positioned(
                              right: -6,
                              top: -5,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      image = null;
                                    });
                                  },
                                  child: Icon(Icons.delete,
                                      color: Colors.red, size: 30.w)))
                        ],
                      ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                            auto: AutovalidateMode.onUserInteraction,
                            TextInputAction: TextInputAction.next,
                            type: TextInputType.name,
                            controller: titleController,
                            title: 'Enter title here...',
                            hint: 'Enter title here...',
                            label: 'Task title',
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return '⚠️  ${'Please enter title'}';
                              } else {
                                return null;
                              }
                            },
                            icondata: const SizedBox(),
                            secure: false),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                            auto: AutovalidateMode.onUserInteraction,
                            TextInputAction: TextInputAction.done,
                            type: TextInputType.name,
                            controller: descriptionController,
                            title: 'Enter description here...',
                            hint: 'Enter description here...',
                            label: 'Task Description',
                            lines: 5,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return '⚠️  ${'Please enter description'}';
                              } else {
                                return null;
                              }
                            },
                            icondata: const SizedBox(),
                            secure: false),
                        SizedBox(height: 16.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'Status',
                                color: const Color(0xFF6E6A7C),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp),
                            SizedBox(height: 3.h),
                            Expansion(
                              "  $status",
                              ColorManager.backgroundColor,
                              enabled: true,
                              FontWeight.w700,
                              AppImages.arrowDown,
                              flag: 'flag',
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: statusNames.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          status = statusNames[index];
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CustomText(
                                            text:
                                                "${statusNames[index]}",
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                                ScreenUtil().orientation ==
                                                        Orientation.landscape
                                                    ? 7.sp
                                                    : 14.sp,
                                            color: Colors.black),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'Priority',
                                color: const Color(0xFF6E6A7C),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp),
                            SizedBox(height: 3.h),
                            Expansion(
                              "  $priority Priority",
                              ColorManager.backgroundColor,
                              enabled: true,
                              FontWeight.w700,
                              AppImages.arrowDown,
                              flag: 'flag',
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: names.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          priority = names[index];
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CustomText(
                                            text: "${names[index]} Priority",
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                                ScreenUtil().orientation ==
                                                        Orientation.landscape
                                                    ? 7.sp
                                                    : 14.sp,
                                            color: Colors.black),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                            auto: AutovalidateMode.onUserInteraction,
                            TextInputAction: TextInputAction.done,
                            type: TextInputType.name,
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
                            //   var date = DateFormat('yyyy-MM-dd', 'en')
                            //       .format(newDate);
                            //   dateController.text = date;
                            // },
                            enable: false,
                            controller: dateController,
                            title: 'choose due date...',
                            hint: 'choose due date...',
                            label: 'Due date',
                            validator: (String? value) {
                              if (dateController.text.isEmpty) {
                                return '⚠️  ${'Please choose due date'}';
                              } else {
                                return null;
                              }
                            },
                            suffix: const Image(
                                image: AssetImage(AppImages.calendar)),
                            icondata: const SizedBox(),
                            secure: false),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                state is EditTaskLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: ColorManager.backgroundColor))
                    : CustomButton(
                        text: 'Edit task',
                        function: () {
                          print(isEditImage);
                          print(priority);
                          print(image);
                          print(dateController.text);
                          // if (image == null) {
                          //   showToast(
                          //       msg: 'please select image',
                          //       state: ToastedStates.WARNING);
                          //   formKey.currentState!.validate();
                          // } else
                          if (formKey.currentState!.validate()) {
                            isEditImage == true
                                ? EditTaskCubit.get(context).addImage(
                                    TodoAppCubit.get(context).image,
                                    titleController.text,
                                    descriptionController.text,
                                    priority,
                                    dateController.text,
                                    context,
                                    widget.id,
                                    status)
                                : EditTaskCubit.get(context).editTask(
                                    widget.image,
                                    titleController.text,
                                    descriptionController.text,
                                    priority,
                                    dateController.text,
                                    context,
                                    widget.id,
                                    status);
                          }
                        }),
                SizedBox(height: 10.h)
              ],
            );
          },
        );
      },
    );
  }
}
