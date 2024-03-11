import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/constants/constants.dart';
import 'package:hrms/constants/kiitFormConstants.dart';

import 'package:hrms/model/businessLogic/auth/auth_bloc.dart';
import 'package:hrms/model/businessLogic/login/login_bloc.dart';
import 'package:hrms/view/pages/passwordReset/passwordReset.dart';
import 'package:hrms/view/pages/register/register.dart';
import 'package:hrms/view/widgets/bigHeightGap.dart';
import 'package:hrms/view/widgets/customInputField.dart';
import 'package:hrms/view/widgets/smallHeightGap.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm({
    required this.loginBloc,
    required this.authenticationBloc,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          });
        }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                bigHeightGap(),
                smallHeightGap(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: Form(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/kiitLogo.png',
                          height: 200,
                          width: 200,
                        ),
                        bigHeightGap(),
                        smallHeightGap(),
                        Column(
                          children: List.generate(
                            2,
                            (index) => Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(loginButtons[index],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    PasswordReset())));
                                      },
                                      child:Text(kiitLoginSideText[index],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red)),
                                    ),
                                  ],
                                ),
                                smallHeightGap(),
                                customInputField(
                                  kiitLoginInputFields[index]["hint"],
                                  kiitLoginInputFields[index]["icon"],
                                  kiitLoginInputFields[index]['controller'],
                                  kiitLoginInputFields[index]["type"],
                                  kiitLoginInputFields[index]["validator"],
                                  kiitLoginInputFields[index]["val"],
                                ),
                                bigHeightGap(),
                              ],
                            ),
                          ),
                        ),
                        bigHeightGap(),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.green.shade400),
                            onPressed: state is! LoginLoading
                                ? _onLoginButtonPressed
                                : null,
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        bigHeightGap(),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => Register())));
                            },
                            child: const Text(
                              "Sign Up",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ),
                        bigHeightGap(),
                        Container(
                          child: state is LoginLoading
                              ? CircularProgressIndicator(
                                  color: Colors.green.shade400,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      '© 2024 Developed By Sourav Goel With ❤️',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed() {
    _loginBloc.add(LoginButtonPressed(
      username: usernameController.text,
      password: passwordController.text,
    ));
  }
}
