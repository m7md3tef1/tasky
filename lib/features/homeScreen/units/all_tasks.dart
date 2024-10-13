part of '../view.dart';

class AllTasks extends StatefulWidget {
  AllTasks(this.type, {super.key});
  var type;
  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  var all;
  List<Tasks> _foundUsers = [];
  @override
  void initState() {
    print(widget.type);
    widget.type == 'all'
        ? {_foundUsers = TasksCubit.get(context).listTasks}
        : widget.type == 'inProgress'
            ? {_foundUsers = TasksCubit.get(context).listTasks1}
            : widget.type == 'waiting'
                ? {_foundUsers = TasksCubit.get(context).listTasks2}
                : {_foundUsers = TasksCubit.get(context).listTasks3};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetTasksSuccess) {
          print('object');
          widget.type == 'all'
              ? {_foundUsers = TasksCubit.get(context).listTasks}
              : widget.type == 'inProgress'
              ? {_foundUsers = TasksCubit.get(context).listTasks1}
              : widget.type == 'waiting'
              ? {_foundUsers = TasksCubit.get(context).listTasks2}
              : {_foundUsers = TasksCubit.get(context).listTasks3};
        }
        return _foundUsers.isEmpty
            ? Center(
                child: CustomText(text: 'Not Found Tasks Yet'),
              )
            : RefreshIndicator(
                color: ColorManager.backgroundColor,
                onRefresh: () async {
                  await TasksCubit.get(context)
                      .getTasks(context, fromLoading: false);
                },
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent &&
                        notification is ScrollUpdateNotification) {
                      TasksCubit.get(context)
                          .getTasks(context, fromLoading: true);
                    }
                    return true;
                  },
                  child: RefreshIndicator(
                    color: ColorManager.backgroundColor,
                    onRefresh: () async {
                      await TasksCubit.get(context)
                          .getTasks(context, fromLoading: false);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              itemCount: _foundUsers.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsetsDirectional.zero,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 8.h, top: 5.h),
                                  child: InkWell(
                                    onTap: () {
                                      MagicRouter.navigateTo(TaskDetails(
                                          _foundUsers[index].title,
                                          _foundUsers[index].image,
                                          _foundUsers[index].desc,
                                          _foundUsers[index]
                                              .createdAt
                                              .toString()
                                              .split('T')[0],
                                          _foundUsers[index].priority,
                                          _foundUsers[index].status,
                                          _foundUsers[index].id));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              "https://todo.iraqsapp.com/images/${_foundUsers[index].image}",
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            width: 64.w,
                                            height: 64.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                            color: ColorManager.backgroundColor,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              const Center(
                                                  child: Icon(Icons.error)),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: CustomText(
                                                        text: _foundUsers[index]
                                                            .title
                                                            .toString(),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        line: 1,
                                                        fontSize: 16.sp,
                                                        color: Colors.black),
                                                  ),
                                                  CustomText(
                                                      text: _foundUsers[index]
                                                          .status
                                                          .toString(),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12.sp,
                                                      color: _foundUsers[index]
                                                                      .status
                                                                      .toString() ==
                                                                  "Waiting" ||
                                                              _foundUsers[index]
                                                                      .status
                                                                      .toString() ==
                                                                  "waiting"
                                                          ? const Color(
                                                              0xFFFF7D53)
                                                          : _foundUsers[index]
                                                                          .status
                                                                          .toString() ==
                                                                      "Inprogress" ||
                                                                  _foundUsers[index]
                                                                          .status
                                                                          .toString() ==
                                                                      "InProgress"
                                                              ? ColorManager
                                                                  .backgroundColor
                                                              : const Color(
                                                                  0xFF0087FF)),
                                                ],
                                              ),
                                              CustomText(
                                                  text: _foundUsers[index]
                                                      .desc
                                                      .toString(),
                                                  fontWeight: FontWeight.w400,
                                                  line: 1,
                                                  fontSize: 14.sp,
                                                  color: const Color(0xFF24252C)
                                                      .withOpacity(.6)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.flag,
                                                            color: _foundUsers[index]
                                                                            .priority
                                                                            .toString() ==
                                                                        'Medium' ||
                                                                    _foundUsers[index]
                                                                            .priority
                                                                            .toString() ==
                                                                        'medium'
                                                                ? ColorManager
                                                                    .backgroundColor
                                                                : _foundUsers[index].priority.toString() ==
                                                                            'Low' ||
                                                                        _foundUsers[index].priority.toString() ==
                                                                            'low'
                                                                    ? const Color(
                                                                        0xFF0087FF)
                                                                    : const Color(
                                                                        0xFFFF7D53)),
                                                        CustomText(
                                                            text: _foundUsers[
                                                                    index]
                                                                .priority
                                                                .toString(),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            line: 1,
                                                            fontSize: 12.sp,
                                                            color: _foundUsers[index]
                                                                            .priority
                                                                            .toString() ==
                                                                        'Medium' ||
                                                                    _foundUsers[index]
                                                                            .priority
                                                                            .toString() ==
                                                                        'medium'
                                                                ? ColorManager
                                                                    .backgroundColor
                                                                : _foundUsers[index].priority.toString() ==
                                                                            'Low' ||
                                                                        _foundUsers[index].priority.toString() ==
                                                                            'low'
                                                                    ? const Color(
                                                                        0xFF0087FF)
                                                                    : const Color(
                                                                        0xFFFF7D53)),
                                                      ],
                                                    ),
                                                  ),
                                                  CustomText(
                                                      text: _foundUsers[index]
                                                          .createdAt
                                                          .toString()
                                                          .split('T')[0],
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12.sp,
                                                      color: const Color(
                                                              0xFF24252C)
                                                          .withOpacity(.6)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        const Icon(Icons.more_vert_outlined)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        if (state is GetTasksPaginationLoading)
                          const Center(
                            child: CircularProgressIndicator(
                                color: ColorManager.backgroundColor),
                          ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
