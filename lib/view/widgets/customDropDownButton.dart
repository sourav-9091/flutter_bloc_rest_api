import 'package:flutter/material.dart';

Widget customDropdownField(
  IconData iconData,
  dynamic value,
  List<String> items,
  void Function(String?) onChanged,
) {
  if (value == null && items.isNotEmpty) {
    value = items.first;
  }

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.grey.shade300,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: DropdownButton<String>(
              underline: Container(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5),
              elevation: 0,
              focusColor: Colors.white,
              value: value,
              items: items.map<DropdownMenuItem<String>>((String val) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    ),
  );
}
