import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_event.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';
import 'package:hrms/model/repository/loginRepository.dart';

class VerifyScreen extends StatefulWidget {
  final LoginResponse loginResponse;
  final LoginRepository loginRepository;
  const VerifyScreen(
      {super.key, required this.loginResponse, required this.loginRepository});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: otp,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (await widget.loginRepository
                      .sendotp(widget.loginResponse)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("OTP Send Successfully")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error Try Sending OTP Again")));
                  }
                },
                child: const Text('Send OTP')),
            ElevatedButton(
                onPressed: () async {
                  if (await widget.loginRepository.verify(
                      otp: otp.text, loginResponse: widget.loginResponse)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Verified Successfully")));
                    authenticationBloc.add(LoggedIn(loginResponse:LoginResponse.withVerification(widget.loginResponse)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Could Not Able To Verify Try Again")));
                  }
                },
                child: const Text('Verify')),
            ElevatedButton(
                onPressed: () async {
                  authenticationBloc.add(LoggedOut());
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
