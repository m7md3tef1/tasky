import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/color_manager/color_manager.dart';
import '../../core/const/utils.dart';
import '../../core/data/api/api.dart';
import '../../core/data/local/cacheHelper.dart';
import '../../core/keys/keys.dart';

part '../layout/todo_app_state.dart';

class TodoAppCubit extends Cubit<TodoAppState> {
  TodoAppCubit() : super(RegisterInitial());
  static TodoAppCubit get(context) => BlocProvider.of(context);
  var flag;
  var lat;
  var long;

  var address;
  var lat1;
  var long1;

  IconData suffix = Icons.visibility_off_outlined;
  IconData suffix1 = Icons.visibility_off_outlined;
  IconData suffix2 = Icons.visibility_off_outlined;
  bool? value = false;
  bool isPassword = true;

  bool isConfirmPassword = true;
  bool oldPassword = true;
  Connectivity connectivity = Connectivity();
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(SelfLabChangePasswordVisibilityState());
  }

  void changeAddress() {
    address;
    emit(SelfLabChangeAddressState());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPassword = !isConfirmPassword;
    suffix1 = isConfirmPassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(SelfLabChangeConfirmPasswordVisibilityState());
  }

  void changeOldPasswordVisibility() {
    oldPassword = !oldPassword;
    suffix2 =
        oldPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(SelfLabChangeOldPasswordVisibilityState());
  }

  int pageIndex = 0;
  int pageIndex1 = 0;

  getIndex(currentIndex) {
    pageIndex = currentIndex;
    emit(SelfLabIndexState());
  }

  getIndex1(currentIndex1) {
    pageIndex1 = currentIndex1;
    emit(SelfLabIndexState());
  }

  reFreshToken(context) async {
    emit(RefreshTokenLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        print(refreshToken);
        var response =
            Api().getHttpWithoutToken(context,url: 'auth/refresh-token?token=$refreshToken');
        response
            .then((value) => {
                  CacheHelper.putString(
                      SharedKeys.token, value["access_token"]),
                  token = CacheHelper.getString(SharedKeys.token),
                  emit(RefreshTokenSuccess()),
                })
            .onError((error, stackTrace) => {
              print(error),
                  emit(RefreshTokenFailed(error: error.toString())),
                });
      }
    });
  }

  var image;
  pickFromCamera(BuildContext context) async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(img!.path);
    Navigator.of(context).pop();
    emit(ImageCamera());
  }

  pickFromGallery(BuildContext context) async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(
      img!.path,
    );
    Navigator.of(context).pop();
    emit(ImageGallery());
  }
  // var image;
  // var image1;
  // pickFromCamera(context) async {
  //   Navigator.of(context).pop();
  //   var img = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (img != null) {
  //     emit(ImageCameraLoading());
  //     final filePath = File(img.path).path;
  //     final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
  //     final splitted = filePath.substring(0, (lastIndex));
  //     final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
  //     var result = await FlutterImageCompress.compressAndGetFile(
  //       File(img.path).path,
  //       outPath,
  //       quality: 80,
  //     );
  //     image = result!.path;
  //     emit(ImageCamera());
  //     return result;
  //   }
  //   emit(ImageCamera());
  // }
  //
  // pickFromGallery(context) async {
  //   Navigator.of(context).pop();
  //   const SpinKitFadingCircle(color: ColorManager.backgroundColor, size: 70.0);
  //   var img = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (img != null) {
  //     emit(ImageGalleryLoading());
  //     final filePath = File(img.path).path;
  //     final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
  //     final outPath = '${filePath}_out${filePath.substring(lastIndex)}';
  //     var result = await FlutterImageCompress.compressAndGetFile(
  //       File(img.path).path,
  //       outPath,
  //       quality: 10,
  //     );
  //     image = result!.path;
  //     emit(ImageGallery());
  //     return result;
  //   }
  //   emit(ImageGallery());
  // }
}
