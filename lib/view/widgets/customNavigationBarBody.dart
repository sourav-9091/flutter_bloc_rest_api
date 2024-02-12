import 'package:flutter/material.dart';

Widget customNavigationBody({
  required int selectedIndex,
  required ValueChanged<int> onDestinationSelected,
}) {
  return NavigationBarTheme(
    data: NavigationBarThemeData(
      backgroundColor: Colors.white,
      height: 60,
      indicatorColor: Colors.green[100],
      labelTextStyle: const MaterialStatePropertyAll(TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      )),
    ),
    child: NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline),
          label: 'Social',
        ),
        NavigationDestination(
          icon: Icon(Icons.history_outlined),
          label: 'History',
        ),
        NavigationDestination(
          icon: Icon(Icons.manage_history_outlined),
          label: 'Manage',
        ),
      ],
    ),
  );
}
