import 'package:flutter/material.dart';
import 'package:hrms/view/widgets/customFormAppBar.dart';

class KIMS extends StatefulWidget {
  const KIMS({super.key});

  @override
  State<KIMS> createState() => _KIMSState();
}

class _KIMSState extends State<KIMS> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
      backgroundColor: Colors.white,
      appBar: customFormAppBar(title:"KIMS"),
      body: Center(
        child: Text("KIMS"),
      ),
    );
  }
}
