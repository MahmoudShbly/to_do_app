import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_api/core/utlis/failures.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';
import 'package:todo_app_with_api/featrues/home/data/service/get_all_tasks_service.dart';

part 'fetch_all_tasks_state.dart';

class FetchAllTasksCubit extends Cubit<FetchAllTasksState> {
  FetchAllTasksCubit() : super(FetchAllTasksCubitInitial());
  List<TaskModel> tasks = [];
  Future<void> fetchData() async {
    emit(FetchAllTasksCubitLoading());
    var result = await GetAllTasksService().getAllTasks();
    result.fold(
      (failure) => emit(FetchAllTasksCubitFailure(errorMassage: failure)),
      (data) {
        emit(FetchAllTasksCubitSuccess(tasks: data));
        for (var item in data) {
          tasks.add(item);
        }
      },
    );
  }

  void addNewTask(TaskModel T) {
    tasks.add(T);
    emit(FetchAllTasksCubitSuccess(tasks: tasks));
  }
}
