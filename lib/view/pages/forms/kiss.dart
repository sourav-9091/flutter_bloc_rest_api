import 'package:flutter/material.dart';

class KISS extends StatefulWidget {
  const KISS({super.key});

  @override
  State<KISS> createState() => _KISSState();
}

class _KISSState extends State<KISS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("KISS"),
    );
  }
}