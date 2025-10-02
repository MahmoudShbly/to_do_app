import 'package:flutter/material.dart';
import 'package:todo_app_with_api/core/widget/custom_text_field.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.taskTitle});
   final String taskTitle;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: taskTitle);
    return Scaffold(
      appBar: AppBar(title: Text('Edit Task',style: TextStyle(fontSize: 24),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
              SizedBox(height: 50),
            CustomTextFormField(hintText: 'Task title', controller: controller),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, child: Text('Update'))
          ],
        ),
      ),
    );
  }
}