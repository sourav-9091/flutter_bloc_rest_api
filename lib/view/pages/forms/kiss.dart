import 'package:flutter/material.dart';
import 'package:hrms/view/widgets/customFormAppBar.dart';

class KISS extends StatefulWidget {
  const KISS({super.key});

  @override
  State<KISS> createState() => _KISSState();
}

class _KISSState extends State<KISS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customFormAppBar(title:"KISS"),
      body: Center(
        child: Text("KISS"),
      ),
    );
  }
}