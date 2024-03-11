import 'package:flutter/material.dart';

Widget customInputField(
  String hint,
  IconData iconData,
  TextEditingController controller,
  TextInputType inputType,
  String? Function(String?)? validator,
  bool val
) {   
  return TextFormField(
    obscureText: val,
    keyboardType: inputType,
    controller: controller,
    cursorColor: Colors.grey.shade600,
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: Icon(
        iconData,
        color: Colors.grey.shade600,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(20.0),
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
    ),
    validator: validator,
  );
}
