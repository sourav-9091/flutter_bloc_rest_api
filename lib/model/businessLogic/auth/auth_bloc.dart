import 'dart:async';
import 'package:hrms/model/dataModel/login/loginResponse.dart';
import 'package:hrms/model/repository/loginRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bloc/bloc.dart';
import 'auth.dart';

final FlutterSecureStorage storage = new FlutterSecureStorage();

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository loginRepository;

  AuthenticationBloc({required this.loginRepository})
      : super(AuthenticationUninitialized());

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await loginRepository.hasToken();
      final LoginResponse res = await loginRepository.getLoginResponse();
      if (hasToken) {
        if (res.user.verified) {
          yield AuthenticationAuthenticatedVerified(loginResponse: res);
        } else {
          yield AuthenticationAuthenticatedUnVerified(loginResponse: res);
        }
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await loginRepository.persistLoginResponse(event.loginResponse);
       if (event.loginResponse.user.verified) {
          yield AuthenticationAuthenticatedVerified(loginResponse: event.loginResponse);
        } else {
          yield AuthenticationAuthenticatedUnVerified(loginResponse: event.loginResponse);
        }
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await loginRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
