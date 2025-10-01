import 'package:flutter/material.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/widget/custom_app_bar.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/widget/custom_tab_bar.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        spacing: 24,
        children: <Widget>[
          SizedBox(height: 30),
          CustomAppBar(),
          Expanded(child: CustomTabBar()),
        ],
      ),
    );
  }
}

