part of 'fetch_all_tasks_cubit.dart';

@immutable
sealed class FetchAllTasksState {}

final class FetchAllTasksCubitInitial extends FetchAllTasksState {}
final class FetchAllTasksCubitLoading extends FetchAllTasksState {}
final class FetchAllTasksCubitSuccess extends FetchAllTasksState {
  final List<TaskModel> tasks;
  FetchAllTasksCubitSuccess( {required this.tasks});
}
final class FetchAllTasksCubitFailure extends FetchAllTasksState {
  final Failures errorMassage;
  FetchAllTasksCubitFailure({required this.errorMassage});
}
