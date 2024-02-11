import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';

class KiitForm extends StatefulWidget {
  LoginResponse loginResponse;
  KiitForm({required this.loginResponse, super.key});

  @override
  State<KiitForm> createState() => _KiitFormState();
}

class _KiitFormState extends State<KiitForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kiit Form"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(),
            TextButton(
              onPressed: () {},
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
