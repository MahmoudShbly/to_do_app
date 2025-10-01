import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app_with_api/core/utlis/failures.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';
import 'package:todo_app_with_api/featrues/home/data/service/add_new_task_service.dart';

part 'add_new_task_state.dart';

class AddNewTaskCubit extends Cubit<AddNewTaskState> {
  AddNewTaskCubit() : super(AddNewTaskInitial());
  Future<void> addNewTask({required String title}) async {
    emit(AddNewTaskLoading());
    var result = await AddNewTaskService().addTask(title: title);
    result.fold(
      (failure) => emit(AddNewTaskFailure(errorMassage: failure.message)),
      (newTask) => emit(AddNewTaskSuccess(newTask: newTask)),
    );


  }
}
