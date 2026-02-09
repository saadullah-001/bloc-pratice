import 'package:bloc_practice_v1/bloc/counter/homepage_bloc.dart';
import 'package:bloc_practice_v1/bloc/image/image_bloc.dart';
import 'package:bloc_practice_v1/bloc/slider/slider_bloc.dart';
import 'package:bloc_practice_v1/bloc/todoList/todo_list_bloc.dart';
//import 'package:bloc_practice_v1/view/image_view.dart';
import 'package:bloc_practice_v1/view/todo_list_view.dart';
//import 'package:bloc_practice_v1/view/home_page_view.dart';
//import 'package:bloc_practice_v1/view/slider_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomepageBloc>(create: (_) => HomepageBloc()),
        BlocProvider<SliderBloc>(create: (_) => SliderBloc()),
        BlocProvider<ImageBloc>(create: (_) => ImageBloc()),
        BlocProvider<TodoListBloc>(create: (_) => TodoListBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: TodoListView(),
      ),
    );
  }
}
