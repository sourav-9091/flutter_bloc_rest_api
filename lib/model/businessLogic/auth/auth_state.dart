import 'package:equatable/equatable.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final LoginResponse loginResponse;

  AuthenticationAuthenticated({required this.loginResponse});
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
