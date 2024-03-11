import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hrms/model/businessLogic/auth/auth_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_event.dart';
import 'package:hrms/model/businessLogic/auth/auth_state.dart';
import 'package:hrms/model/businessLogic/form/form_bloc.dart';
import 'package:hrms/model/businessLogic/image/image_bloc.dart';
import 'package:hrms/model/repository/formSubmission.dart';
import 'package:hrms/model/repository/loginRepository.dart';
import 'package:hrms/view/pages/homeScreen.dart';
import 'package:hrms/view/pages/loadingIndicator.dart';
import 'package:hrms/view/pages/login/loginScreen.dart';
import 'package:hrms/view/pages/login/verifyScreen.dart';
import 'package:hrms/view/pages/splashScreen.dart';

void main() {
  final loginRepository = LoginRepository();
  final formUploadRepository = FormUploadRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            loginRepository: LoginRepository(),
          )..add(AppStarted()),
        ),
        BlocProvider<ImageUploadBloc>(
          create: (context) =>
              ImageUploadBloc(formUploadRepository: formUploadRepository),
        ),
        BlocProvider<FormSubmissionBloc>(
          create: (context) =>
              FormSubmissionBloc(formUploadRepository: formUploadRepository),
        ),
      ],
      child: App(
        loginRepository: loginRepository,
      ),
    ),
  );
}

class App extends StatelessWidget {
  final LoginRepository loginRepository;

  App({required this.loginRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticatedVerified) {
            return HomePage(loginResponse: state.loginResponse);
          }
          if (state is AuthenticationAuthenticatedUnVerified) {
            return VerifyScreen(
                loginResponse: state.loginResponse,
                loginRepository: loginRepository);
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginScreen(loginRepository: loginRepository);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return Container();
        },
      ),
    );
  }
}
