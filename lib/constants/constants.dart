import 'package:flutter/material.dart';
import 'package:hrms/view/pages/history/history.dart';
import 'package:hrms/view/pages/home/home.dart';
import 'package:hrms/view/pages/manage/manage.dart';
import 'package:hrms/view/pages/register/register.dart';
import 'package:hrms/view/pages/social/social.dart';

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

final List<String> drawerItems = [
  'KIIT',
  'KISS',
  'KIMS',
  'TEMPLE',
  'HOSPITALITY',
];

final List<IconData> drawerIcons = [
  Icons.architecture,
  Icons.favorite,
  Icons.local_hospital,
  Icons.temple_hindu,
  Icons.luggage,
];

List<String> imagePaths = [
  "assets/images/dashboard/4.png",
  "assets/images/dashboard/3.png",
  "assets/images/dashboard/5.png",
  "assets/images/dashboard/1.png",
  "assets/images/dashboard/2.png",
];

final screens = [
  Home(),
  Social(),
  History(),
  Manage()
];

List<Map<String, dynamic>> kiitLoginInputFields = [
  {
    "hint": "Username",
    "icon": Icons.person,
    "type": TextInputType.emailAddress,
    "validator": (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a valid username';
      }
      return null;
    },
    "val": false,
    "controller": usernameController
  },
  {
    "hint": "Password",
    "icon": Icons.password,
    "type": TextInputType.text,
    "validator": (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a valid password';
      }
      return null;
    },
    "val": true,
    "controller": passwordController
  }
];

List kiitLoginSideText = ["", "Forget Password ?"];
