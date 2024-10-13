part of '../layout/todo_app_cubit.dart';

abstract class TodoAppState {}

class RegisterInitial extends TodoAppState {}

class NetworkFailed extends TodoAppState {
  final String msg;
  NetworkFailed(this.msg);
}

class SelfLabChangePasswordVisibilityState extends TodoAppState {}

class SelfLabChangeConfirmPasswordVisibilityState
    extends TodoAppState {}

class SelfLabChangeAddressState extends TodoAppState {}

class SelfLabChangeOldPasswordVisibilityState extends TodoAppState {}

class SelfLabIndexState extends TodoAppState {}


class ImageCamera extends TodoAppState {}

class ImageCameraLoading extends TodoAppState {}

class ImageGalleryLoading extends TodoAppState {}

class ImageGallery extends TodoAppState {}

class NetworkTokenFailed extends TodoAppState {
  final String msg;
  NetworkTokenFailed(this.msg);
}

//sign_in
class RefreshTokenLoading extends TodoAppState {}

class RefreshTokenSuccess extends TodoAppState {
  var register;
  RefreshTokenSuccess();
}

class RefreshTokenFailed extends TodoAppState {
  String? error;
  RefreshTokenFailed({this.error});
}