import 'package:bloc/bloc.dart';
import 'package:bloc_practice_v1/bloc/todoList/todo_list_event.dart';
import 'package:bloc_practice_v1/bloc/todoList/todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(const TodoListState()) {
    on<AddTodoEvent>(_onAddTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  void _onAddTodoEvent(AddTodoEvent event, Emitter<TodoListState> emit) {
    final updatedTodo = List<String>.from(state.todos);
    updatedTodo.add(event.todo);
    emit(state.copyWith(todos: updatedTodo));
  }

  void _removeTodoEvent(RemoveTodoEvent event, Emitter<TodoListState> emit) {
    final updatedTodo = List<String>.from(state.todos);
    updatedTodo.removeAt(event.index);
    emit(state.copyWith(todos: updatedTodo));
  }
}
