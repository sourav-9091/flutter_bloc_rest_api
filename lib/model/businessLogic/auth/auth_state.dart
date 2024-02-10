import 'package:equatable/equatable.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticatedVerified extends AuthenticationState {
  final LoginResponse loginResponse;

  AuthenticationAuthenticatedVerified({required this.loginResponse});
}

class AuthenticationAuthenticatedUnVerified extends AuthenticationState {
  final LoginResponse loginResponse;

  AuthenticationAuthenticatedUnVerified({required this.loginResponse});
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
