import 'package:flutter/material.dart';
import 'package:hrms/view/widgets/customFormAppBar.dart';

class TEMPLE extends StatefulWidget {
  const TEMPLE({super.key});

  @override
  State<TEMPLE> createState() => _TEMPLEState();
}

class _TEMPLEState extends State<TEMPLE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customFormAppBar(title:"TEMPLE"),
      body: Center(
        child: Text("TEMPLE"),
      ),
    );
  }
}