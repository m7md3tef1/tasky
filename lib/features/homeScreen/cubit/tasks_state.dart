part of 'tasks_cubit.dart';

sealed class TasksState {}

final class TasksInitial extends TasksState {}

class NetworkFailed extends TasksState {
  final String msg;
  NetworkFailed(this.msg);
}

//get_tasks
class GetTasksPaginationLoading extends TasksState {}

class GetTasksLoading extends TasksState {}

class GetTasksSuccess extends TasksState {
  var register;
  GetTasksSuccess(this.register);
}

class GetTasksFailed extends TasksState {
  String? error;
  GetTasksFailed(this.error);
}

//delete_tasks
class DeleteTaskLoading extends TasksState {}

class DeleteTaskSuccess extends TasksState {
  DeleteTaskSuccess();
}

class DeleteTaskFailed extends TasksState {
  DeleteTaskFailed();
}
