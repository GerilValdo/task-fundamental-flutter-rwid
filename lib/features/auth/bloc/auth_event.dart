part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email, password;
  const LoginEvent({required this.email, required this.password});
}

class GoogleSignInRequestedEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email, password, name;
  const RegisterEvent(
      {required this.email, required this.password, required this.name});
}

class LogoutEvent extends AuthEvent {}
