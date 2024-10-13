part of 'auth_cubit.dart';

abstract class AuthState {}

class LoginInitial extends AuthState {}

class SelfLabChangePasswordVisibilityState extends AuthState {}

class NetworkFailed extends AuthState {
  final String msg;
  NetworkFailed(this.msg);
}

//sign_in
class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {
  var register;
  SignInSuccess({this.register});
}

class SignInFailed extends AuthState {
  String? error;
  SignInFailed({this.error});
}

//sign_up
class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpFailed extends AuthState {
  String? error;
  SignUpFailed({this.error});
}

//logout
class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {}

class LogoutFailed extends AuthState {
  var error;
  LogoutFailed(this.error);
}

//get_user_data
class GetUserDataLoading extends AuthState {}

class GetUserDataSuccess extends AuthState {
  var data;
  GetUserDataSuccess(this.data);
}

class GetUserDataFailed extends AuthState {
  var error;
  GetUserDataFailed(this.error);
}

//update
class UpdateLoading extends AuthState {}

class UpdateSuccess extends AuthState {
  var data;
  UpdateSuccess(this.data);
}

class UpdateFailed extends AuthState {
  var error;
  UpdateFailed(this.error);
}

//change_pass
class ChangePasswordLoading extends AuthState {}

class ChangePasswordSuccess extends AuthState {
  ChangePasswordSuccess();
}

class ChangePasswordFailed extends AuthState {
  var error;
  ChangePasswordFailed(this.error);
}
