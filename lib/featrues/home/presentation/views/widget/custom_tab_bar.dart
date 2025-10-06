import 'package:flutter/material.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/widget/custom_task_list_view_builder.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),

          child: TabBar(
            indicator: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Container(
                width: double.infinity,
                child: Text(
                  'Tasks',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Done',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
            controller: _controller,
          ),
        ),
        SizedBox(height: 22),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CustomTaskListViewBuilder(),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: CustomTaskListViewBuilder(isDone: true),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}

