import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_with_api/featrues/home/data/service/edit_task_service.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitial());
  Future<void> editTask({required int id, required String title , bool? status}) async {
    emit(EditTaskLoading());
    var result = await EditTaskService().editTask(id: id, title: title,taskState: status);
    result.fold(
      (failure) => emit(EditTaskFailure(errorMassage: failure.message)),
      (task) => emit(EditTaskSuccess()),
    );
  }
}
