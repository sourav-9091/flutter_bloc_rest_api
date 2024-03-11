import 'package:flutter/material.dart';

final TextEditingController refNo = TextEditingController();
final TextEditingController name = TextEditingController();
final TextEditingController amt = TextEditingController();
final TextEditingController contact = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController relation = TextEditingController();
final TextEditingController department = TextEditingController();

List<Map<String, dynamic>> kiitInputFields = [
  {
    "hint": "Enter Reference Number",
    "icon": Icons.key,
    "inputType": TextInputType.text,
    "validator": (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a reference number';
      }
      return null;
    },
    "controller": refNo,
    "val": false
  },
  {
    "hint": "Enter Candidate's Name",
    "icon": Icons.person,
    "inputType": TextInputType.name,
    "validator": (value) {
      if (value == null || value.isEmpty) {
        return "Please enter the candidate's name";
      }
      return null;
    },
    "controller": name,
    "val": false
  },
  {
    "hint": "Amount Paid (By Candidate)",
    "icon": Icons.money,
    "inputType": TextInputType.number,
    "validator": (value) {
      if (value == null || value.isEmpty) {
        return "Please enter the amount paid by the candidate";
      }
      return null;
    },
    "controller": amt,
    "val": false
  },
  {
    "hint": "Enter Candidate's Contact",
    "icon": Icons.phone,
    "inputType": TextInputType.phone,
    "validator": (value) {
      if (value == null || value.isEmpty) {
        return "Please enter the candidate's contact number";
      }
      return null;
    },
    "controller": contact,
    "val": false
  },
  {
    "hint": "Enter Candidate's Email Address",
    "icon": Icons.email,
    "inputType": TextInputType.emailAddress,
    "validator": (value) {
      if (value == null || value.isEmpty) {
        return "Please enter the candidate's email address";
      }
      return null;
    },
    "controller": email,
    "val": false
  },
];

List<Map<String, dynamic>> kiitDropInputFields = [
  {
    "icon": Icons.engineering,
    "value": "Engineering",
    "list": ["Engineering", "LAW", "MBA"],
  },
  {
    "icon": Icons.person,
    "value": "Neighbour",
    "list": ["Neighbour", "Son", "Relative"],
  }
];

List loginButtons = [
  "Email Address",
  "Password"
];
