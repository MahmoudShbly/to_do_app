import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_with_api/core/utlis/constants.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/edit_task_view.dart';

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
                switch (value){
                  case 'Edit':
                    Navigator.push((context), MaterialPageRoute(builder: (context)=>EditTaskView(taskTitle: task.title,)));
                  case 'Delete':

                  default :
                }
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(value: 'Edit', child: Text('Edit')),
                  PopupMenuItem(value: 'Delete', child: Text('Delete')),
                  PopupMenuItem(value: 'Archive', child: Text('Archive')),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}
