import 'dart:async';

import 'package:hrms/model/businessLogic/auth/auth_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_event.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';
import 'package:hrms/model/repository/loginRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.loginRepository,
    required this.authenticationBloc,
  }) : super(LoginInitial());

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        LoginResponse loginResponse = await loginRepository.login(
          username: event.username,
          password: event.password,
        );

        if (loginResponse.message == 'Internal Server Error: Try Again Later') {
          yield const LoginFailure(
              error: 'Internal Server Error: Try Again Later');
        } else if (loginResponse.message == 'Wrong Password: Try Again') {
          yield const LoginFailure(error: 'Wrong Password: Try Again');
        } else if (loginResponse.message == 'Wrong Username: Try Again') {
          yield const LoginFailure(error: 'Wrong Username: Try Again');
        } else {
          authenticationBloc.add(LoggedIn(loginResponse: loginResponse));
          yield LoginInitial();
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
