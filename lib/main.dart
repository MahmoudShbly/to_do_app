import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_api/core/utlis/bloc_observer.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/add_new_task_cubit/add_new_task_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/manager/fetch_all_tasks_cubit/fetch_all_tasks_cubit.dart';
import 'package:todo_app_with_api/featrues/home/presentation/views/home_view.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchAllTasksCubit()..fetchData(),
        ),
        BlocProvider(create:  (context) => AddNewTaskCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const HomeView(),
      ),
    );
  }
}
