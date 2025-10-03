import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_api/core/utlis/helper_function.dart';
import 'package:todo_app_with_api/core/widget/custom_text_field.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/fetch_all_tasks_cubit/fetch_all_tasks_cubit.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: task.title,
    );
    return Scaffold(
      appBar: AppBar(title: Text('Edit Task', style: TextStyle(fontSize: 24))),
      body: BlocConsumer<EditTaskCubit, EditTaskState>(
        listener: (context, state)async {
          if (state is EditTaskSuccess) {
            showSnackBar(context, 'Task Updated Successfully', Colors.green);
            controller.clear();
            Navigator.pop(context);
            await context.read<FetchAllTasksCubit>().fetchData();
          }
          if (state is EditTaskFailure) {
            showSnackBar(context, state.errorMassage, Colors.red);
          }
          
        },
        builder: (context, state) {
          if (state is EditTaskLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  CustomTextFormField(
                    hintText: 'Task title',
                    controller: controller,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<EditTaskCubit>().editTask(
                        id: task.id,
                        title: controller.text,
                      );
                    },
                    child:state is EditTaskLoading? CircularProgressIndicator():Text('Update'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
