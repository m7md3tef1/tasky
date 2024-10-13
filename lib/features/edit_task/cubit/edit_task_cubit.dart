import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:untitled/core/const/utils.dart';
import 'package:untitled/core/router/router.dart';
import 'package:untitled/features/homeScreen/cubit/tasks_cubit.dart';

import '../../../core/data/api/api.dart';
import '../../../core/data/local/cacheHelper.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/keys/keys.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(AddTaskInitial());
  static EditTaskCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  addImage(image, title, desc, priority, dueDate, context,id,status) async {
    emit(AddImageLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again',
            state: ToastedStates.WARNING);
      } else {
        String fileName = image.path.split('/').last;
        print(token);
        print(fileName.split('.')[1]);
        FormData formData = FormData.fromMap({
          "image": await MultipartFile.fromFile(
            image.path,
            filename: fileName,
            contentType: MediaType("image",
                fileName.split('.')[1]), //important
          ),
        });
        var response = Api().postHttpImage(context,
            url: 'upload/image', authToken: CacheHelper.getString(SharedKeys.token), data: formData);
        response
            .then((value) async => {
          print(value),
          print(value['image']),
          emit(AddImageSuccess()),
          editTask(
              value['image'], title, desc, priority, dueDate, context,id,status),
        })
            .onError(
                (error, stackTrace) => {print(error), emit(AddImageFailed())});
      }
    });
  }

  editTask(image, title, desc, priority, dueDate, context,id,status) async {
    emit(EditTaskLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again',
            state: ToastedStates.WARNING);
      } else {
        var response = Api().putHttp(context,
            url: 'todos/${id}',
            authToken: token,
            data: jsonEncode({
              'image': image,
              'title': title,
              'desc': desc,
              'priority': priority,
              'status': status,
              'dueDate': dueDate
            }));
        response
            .then((value) async => {
                  emit(EditTaskSuccess()),
                  TasksCubit.get(context).pageNumberFilter = 1,
                  TasksCubit.get(context).listTasks = [],
                  TasksCubit.get(context).getTasks(context, fromLoading: false),
                  showToast(
                      msg: 'Edited Task Successfully',
                      state: ToastedStates.SUCCESS),
                  MagicRouter.pop(),
                  MagicRouter.pop(),
                  MagicRouter.pop(),
                })
            .onError(
                (error, stackTrace) => {print(error), emit(EditTaskFailed())});
      }
    });
  }
}
