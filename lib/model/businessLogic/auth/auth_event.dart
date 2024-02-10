import 'package:hrms/model/dataModel/login/loginResponse.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final LoginResponse loginResponse;

  const LoggedIn({required this.loginResponse});

  @override
  List<Object> get props => [loginResponse];

  @override
  String toString() => 'LoggedIn { loginReponse: $loginResponse }';
}

class LoggedOut extends AuthenticationEvent {}
