import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_event.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';

class HomePage extends StatefulWidget {
  final LoginResponse loginResponse;

  const HomePage({required this.loginResponse});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.loginResponse.user.name),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Column(
          children: [
            TextButton(
              onPressed: () {
                
              },
              child: Text("Kiit Form"),
            ),
            TextButton(
              child: const Text('logout'),
              onPressed: () {
                authenticationBloc.add(LoggedOut());
              },
            ),
          ],
        )),
      ),
    );
  }
}
