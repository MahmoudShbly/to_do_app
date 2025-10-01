import 'package:flutter/material.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/add_task_view.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (builder)=>  AddTaskView());  
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: HomeViewBody(),
    );
  }
}
