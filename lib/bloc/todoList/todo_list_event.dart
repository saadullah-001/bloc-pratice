import 'package:equatable/equatable.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();
  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String todo;
  const AddTodoEvent({required this.todo});

  @override
  List<Object?> get props => [todo];
}

class RemoveTodoEvent extends TodoListEvent {
  final int index;
  const RemoveTodoEvent(this.index);

  @override
  List<Object?> get props => [index];
}
