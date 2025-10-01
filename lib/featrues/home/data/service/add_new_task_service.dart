import 'package:dartz/dartz.dart';
import 'package:todo_app_with_api/core/utlis/api_service.dart';
import 'package:todo_app_with_api/core/utlis/failures.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';

class AddNewTaskService {
  Future<Either<Failures, TaskModel>> addTask({required String title}) async {
    try {
   var data= await ApiService().add(
    uri: 'https://dummyjson.com/todos/add',
    body: {
      'todo': title,
      'userId': 1,
    },
  ) as Map<String,dynamic>;
  TaskModel task = TaskModel.fromJson(data );
  return Right(task);
}  catch (e) {
      return Left(ServerFailure(e.toString()));
    }
    
}
}
 