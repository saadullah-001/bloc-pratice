import 'dart:convert';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_practice_v1/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'package:bloc_practice_v1/bloc/login/login_event.dart';
part 'package:bloc_practice_v1/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<SubmitEvent>(_submitEvent, transformer: droppable());
  }

  Future<void> _submitEvent(SubmitEvent event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        email: event.email,
        //password: event.password,
        status: Status.loading,
        message: 'submitting',
      ),
    );
    try {
      final Map<String, dynamic> body = {
        'username': event.email,
        'password': event.password,
      };
      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: body,
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            status: Status.success,
            message: 'Logged in successfuly',
          ),
        );
      } else {
        emit(
          state.copyWith(status: Status.error, message: data ?? 'LOGIN fAILED'),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: Status.error, message: e.toString()));
    }
  }
}
