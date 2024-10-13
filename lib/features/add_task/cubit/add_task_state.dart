part of 'add_task_cubit.dart';

sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

class NetworkFailed extends AddTaskState {
  final String msg;
  NetworkFailed(this.msg);
}

//add_task
class AddTaskLoading extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {
  AddTaskSuccess();
}

class AddTaskFailed extends AddTaskState {
  AddTaskFailed();
}

//add_image
class AddImageLoading extends AddTaskState {}

class AddImageSuccess extends AddTaskState {
  AddImageSuccess();
}

class AddImageFailed extends AddTaskState {
  AddImageFailed();
}
