import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/fetch_all_tasks_cubit/fetch_all_tasks_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/widget/custom_task_card.dart';

class CustomTaskListViewBuilder extends StatelessWidget {
  const CustomTaskListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllTasksCubit, FetchAllTasksState>(
      builder: (context, state) {
        if (state is FetchAllTasksCubitSuccess){
          return  ListView.builder(
          itemBuilder: (context, index) => CustomTaskCard(task: state.tasks[index],),
          itemCount: state.tasks.length,
        );
        } else if (state is FetchAllTasksCubitLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FetchAllTasksCubitFailure) {
          return Center(child: Text('Error: ${state.errorMassage}'));
        } else {
          return Center(child: Text('No Tasks Available'));
        }
      },
    );
  }
}
