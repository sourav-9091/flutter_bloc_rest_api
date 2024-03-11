import 'package:flutter/material.dart';
import 'package:hrms/constants/constants.dart';
import 'package:hrms/model/businessLogic/auth/auth_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_event.dart';
import 'package:hrms/view/pages/forms/hospitality.dart';
import 'package:hrms/view/pages/forms/kiit.dart';
import 'package:hrms/view/pages/forms/kims.dart';
import 'package:hrms/view/pages/forms/kiss.dart';
import 'package:hrms/view/pages/forms/temple.dart';

Widget customDrawerBody(AuthenticationBloc authenticationBloc) {
  void navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => KIIT())));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => KISS())));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => HOSPITALITY())));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => KIMS())));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => TEMPLE())));
        break;
      default:
        break;
    }
  }

  return Drawer(
    child: Container(
      color: Colors.white,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.black12,
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.black87,
                    size: 70,
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: drawerItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () => navigateToScreen(context, index),
                      leading: Icon(drawerIcons[index]),
                      title: Text(
                        drawerItems[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              }),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              "LOGOUT",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              authenticationBloc.add(LoggedOut());
            },
          ),
        ],
      ),
    ),
  );
}
