part of 'edit_task_cubit.dart';

sealed class EditTaskState {}

final class AddTaskInitial extends EditTaskState {}

class NetworkFailed extends EditTaskState {
  final String msg;
  NetworkFailed(this.msg);
}

//edit_task
class EditTaskLoading extends EditTaskState {}

class EditTaskSuccess extends EditTaskState {
  EditTaskSuccess();
}

class EditTaskFailed extends EditTaskState {
  EditTaskFailed();
}
//add_image
class AddImageLoading extends EditTaskState {}

class AddImageSuccess extends EditTaskState {
  AddImageSuccess();
}

class AddImageFailed extends EditTaskState {
  AddImageFailed();
}