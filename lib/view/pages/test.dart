import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_event.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';

class Test extends StatefulWidget {
  final LoginResponse loginResponse;

  const Test({required this.loginResponse});
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Un Verified"),
      ),
      body: Container(
        child: Center(
            child: TextButton(
          child: const Text('logout'),
          onPressed: () {
            authenticationBloc.add(LoggedOut());
          },
        )),
      ),
    );
  }
}
