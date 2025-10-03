import 'package:dartz/dartz.dart';
import 'package:todo_app_with_api/core/utlis/api_service.dart';
import 'package:todo_app_with_api/core/utlis/failures.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';

class DeleteTaskService {
  Future<Either<Failures, TaskModel>> deleteTaskService({
    required int id,
  }) async {
    try {
  var data =await ApiService().delete(uri: 'https://dummyjson.com/todos/$id') as Map <String, dynamic>;
  return Right(TaskModel.fromJson(data));
}  catch (e) {
    return Left(ServerFailure(e.toString()));
}
  }
}
