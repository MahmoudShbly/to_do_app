import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_with_api/core/utlis/constants.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/edit_task_view.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/widget/menu_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTaskCard extends StatelessWidget {
  const CustomTaskCard({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,

      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                task.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.alatsi(
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
            ),

            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case 'Edit':
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => EditTaskView(task: task),
                      ),
                    );
                    break;
                  case 'Delete':
                    break;
                  default:
                    context
                        .read<EditTaskCubit>()
                        .editTask(
                          id: task.id,
                          title: task.title,
                          status: !task.completed,
                        )
                        .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                task.completed
                                    ? 'Task marked as not done'
                                    : 'Task marked as done',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
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
                    child: MenuItem(
                      label: 'Done',
                      icon: Icons.done_outline_rounded,
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}
