import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_api/core/utlis/helper_function.dart';
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
    return BlocConsumer<AddNewTaskCubit, AddNewTaskState>(
      listener: (context, state) async {
        if (state is AddNewTaskSuccess)  {
          showSnackBar(context, 'Task Added Successfully', Colors.green);
          titleController.clear();
          Navigator.of(context).pop();
          await BlocProvider.of<FetchAllTasksCubit>(context).fetchData();
        }
        if (state is AddNewTaskFailure) {
          showSnackBar(context, state.errorMassage, Colors.red);
        }
      },
      builder: (context, state) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Add Task', style: TextStyle(fontSize: 16)),
                  CustomTextFormField(
                    hintText: 'Task title',
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'title must not be empty';
                      }
                      return null;
                    },
                  ),
                  state is AddNewTaskLoading
                      ? const CircularProgressIndicator()
                      : ButtonSection(
                          formKey: formKey,
                          onPressed: () async {
                            await context.read<AddNewTaskCubit>().addNewTask(
                              title: titleController.text,
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
