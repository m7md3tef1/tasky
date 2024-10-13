import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled/core/color_manager/color_manager.dart';
import 'package:untitled/core/router/router.dart';

import '../../../core/const/utils.dart';
import '../../../core/data/api/api.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/models/tasks.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  static TasksCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  List<Tasks> listTasks = [];
  var pageNumberFilter = 1;
  Future<void> getTasks(context, {bool fromLoading = false}) async {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        if (fromLoading) {
          emit(GetTasksPaginationLoading());
        } else {
          pageNumberFilter = 1;
          listTasks.clear();
          listTasks = [];
          print(pageNumberFilter);
          print(listTasks.length);
          emit(GetTasksLoading());
        }
        try {
          var response = await Dio()
              .get('https://todo.iraqsapp.com/todos?page=$pageNumberFilter',
                  options: Options(
                    headers: {
                      "Authorization": 'Bearer $token',
                    },
                  ));
          var model = TaskData.fromJson(response.data);
          if (model.list.isNotEmpty) {
            pageNumberFilter++;
            listTasks.addAll(model.list);
          }
          emit(GetTasksSuccess(listTasks));
        } on DioError catch (ex) {
          print(ex.error.toString());
          emit(GetTasksFailed(ex.toString()));
        }
      }
    });
  }

  deleteTask(id, context) async {
    emit(DeleteTaskLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again',
            state: ToastedStates.WARNING);
      } else {
        showDialog(
            barrierDismissible: false,
            useRootNavigator: false,
            context: context,
            builder: (_) {
              return Dialog(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  insetPadding: EdgeInsets.symmetric(horizontal: 100.w),
                  shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.transparent)),
                  child: const SpinKitCircle(
                      color: ColorManager.backgroundColor, size: 70.0));
            });
        var response =
            Api().deleteHttp(context, url: 'todos/$id', authToken: token);
        response
            .then((value) async => {
                  emit(DeleteTaskSuccess()),
                  TasksCubit.get(context).pageNumberFilter = 1,
                  TasksCubit.get(context).listTasks = [],
                  TasksCubit.get(context).getTasks(context, fromLoading: false),
                  showToast(
                      msg: 'Deleted Task Successfully',
                      state: ToastedStates.SUCCESS),
                  MagicRouter.pop(),
                  MagicRouter.pop(),
                  MagicRouter.pop(),
                })
            .onError((error, stackTrace) =>
                {print(error), MagicRouter.pop(), emit(DeleteTaskFailed())});
      }
    });
  }
}

class TaskData {
  late final List<Tasks> list;

  TaskData.fromJson(dynamic json) {
    list = List.from(json).map((e) => Tasks.fromJson(e)).toList();
  }
}
