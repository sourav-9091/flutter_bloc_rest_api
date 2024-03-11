import 'package:flutter/material.dart';
import 'package:hrms/view/widgets/customFormAppBar.dart';

class HOSPITALITY extends StatefulWidget {
  const HOSPITALITY({super.key});

  @override
  State<HOSPITALITY> createState() => _HOSPITALITYState();
}

class _HOSPITALITYState extends State<HOSPITALITY> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
      backgroundColor: Colors.white,
      appBar: customFormAppBar(title:"HOSPITALITY"),
      body: Center(
        child: Text("HOSPITALITY"),
      ),
    );
  }
}