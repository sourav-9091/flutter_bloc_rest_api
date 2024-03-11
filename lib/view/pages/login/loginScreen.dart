import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_bloc.dart';
import 'package:hrms/model/businessLogic/login/login_bloc.dart';
import 'package:hrms/model/repository/loginRepository.dart';
import 'package:hrms/view/pages/login/loginForm.dart';

class LoginScreen extends StatefulWidget {
  final LoginRepository loginRepository;

  LoginScreen({required this.loginRepository})
      : assert(loginRepository != null);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  late AuthenticationBloc _authenticationBloc;

  LoginRepository get _loginRepository => widget.loginRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(loginRepository: _loginRepository, authenticationBloc: _authenticationBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(
        authenticationBloc: _authenticationBloc,
        loginBloc: _loginBloc,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
