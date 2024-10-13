import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/add_task/cubit/add_task_cubit.dart';
import 'package:untitled/features/edit_task/cubit/edit_task_cubit.dart';
import 'package:untitled/features/homeScreen/cubit/tasks_cubit.dart';
import 'package:untitled/features/layout/todo_app_cubit.dart';
import 'core/bloc_observer.dart';
import 'core/const/utils.dart';
import 'core/data/local/cacheHelper.dart';
import 'core/keys/keys.dart';
import 'core/router/router.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  token = CacheHelper.getString(SharedKeys.token);
  print(token);
  refreshToken = CacheHelper.getString(SharedKeys.refreshToken);
  runApp(EasyLocalization(
      saveLocale: true,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      path: 'translations',
      fallbackLocale: const Locale('ar', ''),
      startLocale: const Locale('en', ''),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((_) => AuthCubit()..getUserData(context)..getUserDataModel)),
        BlocProvider(create: ((_) => TasksCubit())),
        BlocProvider(create: ((_) => EditTaskCubit())),
        BlocProvider(create: ((_) => AddTaskCubit())),
        BlocProvider(create: ((_) => TodoAppCubit())),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: context.localizationDelegates,
                    locale: context.locale,
                    supportedLocales: context.supportedLocales,
                    navigatorKey: navigatorKey,
                    home: const SplashScreen()));
          }),
    );
  }
}
