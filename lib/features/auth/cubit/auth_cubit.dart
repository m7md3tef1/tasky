import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/homeScreen/cubit/tasks_cubit.dart';

import '../../../core/const/utils.dart';
import '../../../core/data/api/api.dart';
import '../../../core/data/local/cacheHelper.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/keys/keys.dart';
import '../../../core/models/UserDetail.dart';
import '../../../core/router/router.dart';
import '../../homeScreen/view.dart';
import '../../layout/todo_app_cubit.dart';
import '../view/login.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  bool value = true;
  bool socialAuth = false;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(SelfLabChangePasswordVisibilityState());
  }

  var loginData;
  signIn(phone, password, context) async {
    emit(SignInLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again',
            state: ToastedStates.WARNING);
      } else {
        var response = Api().postHttp(context,
            url: 'auth/login',
            data: jsonEncode({'phone': phone, 'password': password}));
        response
            .then((value) async => {
                  loginData = value,
                  CacheHelper.putString(
                      SharedKeys.refreshToken, value["refresh_token"]),
                  refreshToken = CacheHelper.getString(SharedKeys.refreshToken),
                  CacheHelper.putString(
                      SharedKeys.token, value["access_token"]),
                  token = CacheHelper.getString(SharedKeys.token),
                  emit(SignInSuccess(register: value)),
                  await getUserData(context),
                  showToast(
                      msg: 'Login Successfully', state: ToastedStates.SUCCESS),
                  MagicRouter.navigateAndPopAll(const HomeScreen()),
                })
            .onError((error, stackTrace) => {
                  print(error),
                  showToast(
                      msg: 'يوجد خطأ في رقم الهاتف أو كلمة المرور',
                      state: ToastedStates.WARNING),
                  emit(SignInFailed(error: error.toString())),
                });
      }
    });
  }

  signUp(context, phone, password, displayName, experienceYears, address,
      level) async {
    emit(SignUpLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again',
            state: ToastedStates.WARNING);
      } else {
        var response = Api().postHttpRegister(context,
            url: 'auth/register',
            data: jsonEncode({
              'phone': phone,
              'password': password,
              'displayName': displayName,
              'experienceYears': experienceYears,
              'address': address,
              'level': level
            }));
        response
            .then((value) => {
                  emit(SignUpSuccess()),
                  showToast(
                      msg: 'تم التسجيل بنجاح', state: ToastedStates.SUCCESS),
                  MagicRouter.navigateTo(TodoAppLogin()),
                })
            .onError((error, stackTrace) => {
                  print(error),
                  emit(SignUpFailed(error: error.toString())),
                  showToast(
                      msg: error
                          .toString()
                          .split(', error:')[0]
                          .replaceAll('Exception: {message:', ''),
                      state: ToastedStates.ERROR),
                });
      }
    });
  }

  logout(context) async {
    emit(LogoutLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again',
            state: ToastedStates.WARNING);
      } else {
        var response = Api().postHttpRegister(context,
            url: 'auth/logout', data: jsonEncode({"token": "$refreshToken"}));
        response
            .then((value) async => {
                  TasksCubit.get(context).listTasks.clear(),
                  TasksCubit.get(context).listTasks = [],
                  emit(LogoutSuccess()),
                  showToast(
                      msg: 'Logout Successfully', state: ToastedStates.SUCCESS),
                  token = '',
                  token = CacheHelper.putString(SharedKeys.token, ''),
                  refreshToken = '',
                  refreshToken =
                      CacheHelper.putString(SharedKeys.refreshToken, ''),
                  MagicRouter.navigateAndPopAll(TodoAppLogin()),
                })
            .onError((error, stackTrace) => {
                  print(error),
                  emit(LogoutFailed(error.toString())),
                });
      }
    });
  }

  UserDetail? getUserDataModel;
  Future<void> getUserData(context) async {
    emit(GetUserDataLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else if (token == '' || token == null) {
      } else {
        var response =
            Api().getHttp(context, url: 'auth/profile', authToken: token);
        response
            .then((value) => {
                  getUserDataModel = UserDetail.fromJson(value),
                  emit(GetUserDataSuccess(value)),
                })
            .onError((error, stackTrace) => {
                  emit(GetUserDataFailed(error)),
                });
      }
    });
  }

  // Users profileData2 =Users();
  updateTask(context, name, email, phone, image) async {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again',
            state: ToastedStates.WARNING);
      } else {
        FormData formData;
        if (image == null) {
          formData = FormData.fromMap({
            'name': name,
            'email': email,
            'phone': phone,
          });
        } else {
          String fileName = image != null ? image!.split('/').last : '';

          formData = FormData.fromMap({
            'image': await MultipartFile.fromFile(image!, filename: fileName),
            'name': name,
            'email': email,
            'phone': phone,
          });
        }

        var token = await CacheHelper.getString(SharedKeys.token);
        var response = Api().postHttpRegister(context,
            url: 'update-profile?_method=patch',
            data: formData,
            authToken: token);
        emit(UpdateLoading());
        response
            .then((value) => {
                  // GetUserDataModel =  Users.fromJson(value['data']['user']),
                  emit(UpdateSuccess(value['data']['user'])),
                  showToast(
                      msg: 'update Profile successfully',
                      state: ToastedStates.SUCCESS),
                })
            .onError((error, stackTrace) => {
                  showToast(
                      msg: error.toString().split(', errors:')[0].replaceAll(
                          'Exception: {status: false, message:', ''),
                      state: ToastedStates.ERROR),
                  emit(UpdateFailed(error)),
                });
      }
    });
  }
}
