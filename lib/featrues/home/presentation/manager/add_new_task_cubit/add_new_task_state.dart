part of 'add_new_task_cubit.dart';

@immutable
sealed class AddNewTaskState {}

final class AddNewTaskInitial extends AddNewTaskState {}
final class AddNewTaskLoading extends AddNewTaskState {}
final class AddNewTaskSuccess extends AddNewTaskState {
  final TaskModel newTask;
  AddNewTaskSuccess({required this.newTask});
}
final class AddNewTaskFailure extends AddNewTaskState {
  final String errorMassage;
  AddNewTaskFailure({required this.errorMassage});
}
