import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app_with_api/featrues/home/data/service/delete_task_service.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());
  Future<void> deleteTask({required int id}) async {
    var result = await DeleteTaskService().deleteTaskService(id: id);
    result.fold(
      (failure) => emit(DeleteTaskFailure(failure.message)),
      (taks) => emit(DeleteTaskSuccess()),
    );
  }
}
