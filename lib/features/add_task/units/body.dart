part of '../view.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var dateController = TextEditingController();
  var levelController = TextEditingController();
  var descriptionController = TextEditingController();
  var titleController = TextEditingController();
  String? priority = 'low';
  var formKey = GlobalKey<FormState>();
  List<String> names = ["low", "medium", "high"];
  var image;
  @override
  void initState() {
    TodoAppCubit.get(context).image = null;
    super.initState();
    image = TodoAppCubit.get(context).image;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoAppCubit, TodoAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ImageCamera || state is ImageGallery) {
          image = TodoAppCubit.get(context).image;
        }
        return BlocConsumer<AddTaskCubit, AddTaskState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                TodoAppCubit.get(context).image == null
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
                                  image: const AssetImage(AppImages.addImage),
                                  height: 56.h,
                                  width: 1.sw),
                            ),
                          ],
                        ),
                      )
                    : Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          CircleAvatar(
                            backgroundImage: FileImage(
                                TodoAppCubit.get(context).image!),
                            radius: 50.r,
                          ),
                          Positioned(
                              right: -6,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      TodoAppCubit.get(context).image = null;
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
                            onTap: () async {
                              DateTime? newDate = await showDatePicker(
                                useRootNavigator: false,
                                context: context,
                                barrierDismissible: false,
                                firstDate: DateTime(2024),
                                lastDate: DateTime(3000),
                                initialDate: DateTime.now(),
                              );
                              if (newDate == null) {
                                return;
                              }
                              newDate.day.toString();
                              newDate.month.toString();
                              newDate.year.toString();
                              var date = DateFormat('yyyy-MM-dd', 'en')
                                  .format(newDate);
                              dateController.text = date;
                            },
                            enable: false,
                            controller: dateController,
                            title: 'choose due date...',
                            hint: 'choose due date...',
                            label: 'Due date',
                            validator: (String? value) {
                              if (dateController.text!.isEmpty) {
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
                state is AddTaskLoading || state is AddImageLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: ColorManager.backgroundColor),
                      )
                    : CustomButton(
                        text: 'Add task',
                        function: () {
                          if (image == null) {
                            showToast(
                                msg: 'please select image',
                                state: ToastedStates.WARNING);
                            formKey.currentState!.validate();
                          } else if (formKey.currentState!.validate()) {
                            AddTaskCubit.get(context).addImage(
                                image,
                                titleController.text,
                                descriptionController.text,
                                priority,
                                dateController.text,
                                context);
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
