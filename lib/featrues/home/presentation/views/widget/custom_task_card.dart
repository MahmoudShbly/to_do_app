import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_with_api/core/utlis/constants.dart';
import 'package:todo_app_with_api/featrues/home/data/models/task_model.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              task.title,
              
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

            SizedBox(height: 5),

            Text(
              'discription of task',
              style: GoogleFonts.alatsi(fontSize: 18, color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}


