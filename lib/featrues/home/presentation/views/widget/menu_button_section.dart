import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_api/core/utlis/helper_function.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/fetch_all_tasks_cubit/fetch_all_tasks_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/edit_task_view.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/widget/menu_item.dart';

class MenuButtonSection extends StatelessWidget {
  const MenuButtonSection({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 'Edit':
            Navigator.push(
              (context),
              MaterialPageRoute(builder: (context) => EditTaskView(task: task)),
            );
            break;
          case 'Delete':
            context.read<DeleteTaskCubit>().deleteTask(id: task.id).then((
              _,
            ) async {
              showSnackBar(context, 'Task Deleted', Colors.blueGrey);
              await context.read<FetchAllTasksCubit>().fetchData();
            });
            break;
          default:
            context
                .read<EditTaskCubit>()
                .editTask(
                  id: task.id,
                  title: task.title,
                  status: !task.completed,
                )
                .then((_) async {
                  showSnackBar(
                    context,
                    task.completed
                        ? 'Task marked as not done'
                        : 'Task marked as done',
                    Colors.green,
                  );
                  await context.read<FetchAllTasksCubit>().fetchData();
                });
        }
      },
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            value: 'Edit',
            child: MenuItem(label: 'Edit', icon: Icons.edit),
          ),
          PopupMenuItem(
            value: 'Delete',
            child: MenuItem(label: 'Delete', icon: Icons.delete),
          ),
          PopupMenuItem(
            value: 'Done',
            child: MenuItem(label: 'Done', icon: Icons.done_outline_rounded),
          ),
        ];
      },
    );
  }
}
