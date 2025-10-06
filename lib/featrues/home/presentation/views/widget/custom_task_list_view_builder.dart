import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/fetch_all_tasks_cubit/fetch_all_tasks_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/widget/custom_task_card.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/widget/custom_task_card_shimmer.dart';

class CustomTaskListViewBuilder extends StatelessWidget {
  const CustomTaskListViewBuilder({super.key, this.isDone = false});
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    List<TaskModel> completedTasks = [];
    List<TaskModel> tasks = [];
    return BlocBuilder<FetchAllTasksCubit, FetchAllTasksState>(
      builder: (context, state) {
        if (state is FetchAllTasksCubitSuccess){
          for (var task in state.tasks) {
            if (task.completed) {
              completedTasks.add(task);
            }else{tasks.add(task);}
          }
          return  ListView.builder(
          itemBuilder: (context, index) => CustomTaskCard(task:isDone? completedTasks[index]:tasks[index] ),
          itemCount:isDone? completedTasks.length:tasks.length,
        );
        }else if (state is FetchAllTasksCubitFailure) {
          return Center(child: Text(state.errorMassage.toString()) );
        }
         else {
          return ListView.builder(
            itemBuilder: (context, index) => const CustomTaskCardShimmer(),
            itemCount: 10,
          );
        }  
      },
    );
  }
}