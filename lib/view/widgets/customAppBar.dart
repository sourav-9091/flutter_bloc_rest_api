import 'package:flutter/material.dart';
import 'package:hrms/view/pages/profile/profile.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text("HRMS", style: TextStyle(color: Colors.black)),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => Profile())));
          },
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            radius: 20,
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
