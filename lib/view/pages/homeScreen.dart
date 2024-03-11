import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/constants/constants.dart';
import 'package:hrms/model/businessLogic/auth/auth_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_event.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';
import 'package:hrms/utils/responsiveUtil.dart';
import 'package:hrms/view/widgets/customAppBar.dart';
import 'package:hrms/view/widgets/customDrawerBody.dart';
import 'package:hrms/view/widgets/customNavigationBarBody.dart';

class HomePage extends StatefulWidget {
  final LoginResponse loginResponse;

  const HomePage({required this.loginResponse});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    Widget widget;

    switch (getScreenSize(MediaQuery.of(context).size.width)) {
      case ScreenSize.small:
        widget = homeScreenSmall(authenticationBloc);
        break;

      case ScreenSize.medium:
        widget = homeScreenMedium(authenticationBloc);
        break;

      case ScreenSize.large:
        widget = homeScreenLarge(authenticationBloc);
        break;
    }
    return widget;
  }

  Widget homeScreenSmall(AuthenticationBloc authenticationBloc) {
    return Scaffold(
      bottomNavigationBar: customNavigationBody(
        selectedIndex: index,
        onDestinationSelected: (int newIndex) {
          setState(() {
            index = newIndex;
          });
        },
      ),
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      drawer: customDrawerBody(authenticationBloc),
      body: screens[index],
    );
  }

  Widget homeScreenMedium(AuthenticationBloc authenticationBloc) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: Drawer(
        child: customDrawerBody(authenticationBloc),
      ),
      body: Text("Medium Screen Size"),
    );
  }

  Widget homeScreenLarge(AuthenticationBloc authenticationBloc) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: customDrawerBody(authenticationBloc),
      ),
      body: Text("Large Screen Size"),
    );
  }
}
