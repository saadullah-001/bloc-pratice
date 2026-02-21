part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  //final String password;
  final Status status;
  final String message;

  const LoginState({
    this.email = '',
    // this.password = '',
    this.status = Status.initial,
    this.message = '',
  });

  LoginState copyWith({
    String? email,
    //String? password,
    Status? status,
    String? message,
  }) {
    return LoginState(
      email: email ?? this.email,
      //  password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [email, /* password, */ status, message];
}
