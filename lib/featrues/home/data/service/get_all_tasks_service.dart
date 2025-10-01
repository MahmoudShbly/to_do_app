import 'package:dartz/dartz.dart';
import 'package:todo_app_with_api/core/utlis/api_service.dart';
import 'package:todo_app_with_api/core/utlis/failures.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';

class GetAllTasksService {
  Future<Either<Failures, List<TaskModel>>> getAllTasks() async {
    List<TaskModel> tasks = [];
    try {
      var data = await ApiService().get(
        uri: 'https://dummyjson.com/todos',
      ) as Map<String, dynamic>;
      List<dynamic> todosList = data['todos'];
      for (var element in todosList) {
        tasks.add(TaskModel.fromJson(element as Map<String,dynamic>));
      }
      return Right(tasks);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
