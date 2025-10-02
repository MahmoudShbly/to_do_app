import 'package:dartz/dartz.dart';
import 'package:todo_app_with_api/core/utlis/api_service.dart';
import 'package:todo_app_with_api/core/utlis/failures.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';

class EditTaskService {
  Future<Either<Failures, TaskModel>> editTask({
    required int id,
    required String title,
    bool taskState = false,
  }) async {
    try {
      var data =
         await ApiService().update(
                uri: 'https://dummyjson.com/todos/$id',
                body: {"todo": title, "completed": taskState},
              )
              ;

      return Right(TaskModel.fromJson(data as Map<String,dynamic>));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
