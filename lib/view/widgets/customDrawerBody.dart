import 'package:flutter/material.dart';
import 'package:hrms/constants/constants.dart';
import 'package:hrms/model/businessLogic/auth/auth_bloc.dart';
import 'package:hrms/model/businessLogic/auth/auth_event.dart';

Widget customDrawerBody(AuthenticationBloc authenticationBloc) {
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