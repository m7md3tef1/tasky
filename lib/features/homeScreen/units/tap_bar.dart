part of '../view.dart';

// ignore: must_be_immutable
class TapBar extends StatelessWidget {
  const TapBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Container(
          height: 1.sh,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              SizedBox(
                height: 35.h,
                child: Center(
                  child: TabBar(
                    dividerHeight: 0,
                    indicator: BoxDecoration(
                        color: ColorManager.backgroundColor,
                        borderRadius:
                            BorderRadiusDirectional.circular(24.r)),
                    labelPadding: EdgeInsetsDirectional.zero,
                    dividerColor: Colors.transparent,
                    indicatorWeight: 1.5,
                    labelStyle: TextStyle(
                        fontFamily: 'tj',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenUtil().orientation ==
                                Orientation.landscape
                            ? 8.sp
                            : 15.sp),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: ColorManager.backgroundColor,
                    // controller: controller,
                    unselectedLabelColor: Colors.black,
                    unselectedLabelStyle: TextStyle(
                        color: const Color(0xFF7C7C80),
                        fontFamily: 'tj',
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenUtil().orientation ==
                                Orientation.landscape
                            ? 8.sp
                            : 15.sp),
                    tabs: const [
                      Tab(child: Text("All", textAlign: TextAlign.center)),
                      Tab(
                          child: Text("Inprogress",
                              textAlign: TextAlign.center)),
                      Tab(
                        child: Text("Waiting", textAlign: TextAlign.center),
                      ),
                      Tab(
                        child:
                            Text("Finished", textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
              ),
                Expanded(
                  child: TabBarView(children: [
                AllTasks('all'),
                AllTasks('inProgress'),
                AllTasks('waiting'),
                AllTasks('finish'),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
