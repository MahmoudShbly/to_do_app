import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_api/core/widget/custom_text_field.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/add_new_task_cubit/add_new_task_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/fetch_all_tasks_cubit/fetch_all_tasks_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/widget/button_section.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});
  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewTaskCubit, AddNewTaskState>(
      listener: (context, state) {
        if (state is AddNewTaskSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Task added successfully', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.green,
            ),
          );
          BlocProvider.of<FetchAllTasksCubit>(context).fetchData();
          Navigator.of(context).pop();
        }
        if (state is AddNewTaskFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.errorMassage}', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Add Task', style: TextStyle(fontSize: 16)),
                CustomTextField(
                  hintText: 'Task title',
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'title must not be empty';
                    }
                    return null;
                  },
                ),

                ButtonSection(
                  formKey: formKey,
                  onPressed: () {
                     context.read<AddNewTaskCubit>().addNewTask(title: titleController.text).then((_){
                      titleController.clear();
                 
                     });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
