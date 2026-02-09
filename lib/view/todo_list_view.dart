import 'package:bloc_practice_v1/bloc/todoList/todo_list_bloc.dart';
import 'package:bloc_practice_v1/bloc/todoList/todo_list_event.dart';
import 'package:bloc_practice_v1/bloc/todoList/todo_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: BlocBuilder<TodoListBloc, TodoListState>(
            builder: (BuildContext context, TodoListState state) {
              if (state.todos.isEmpty) {
                return const Center(child: Text('No Todos Added'));
              } else {
                return ListView.separated(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(state.todos[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoListBloc>().add(
                            RemoveTodoEvent(index),
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1, color: Colors.grey),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogBox(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showDialogBox(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,

      builder: (_) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        title: Text("Add Todo Note"),
        content: TextField(
          controller: controller,

          minLines: 5,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: "Enter Todo Note",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              context.read<TodoListBloc>().add(
                AddTodoEvent(
                  todo: controller.text.trim().isEmpty
                      ? "Untitled Todo"
                      : controller.text.trim(),
                ),
              );
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
