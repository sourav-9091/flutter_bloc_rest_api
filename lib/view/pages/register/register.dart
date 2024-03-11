import 'package:flutter/material.dart';
import 'package:hrms/constants/kiitFormConstants.dart';
import 'package:hrms/view/widgets/bigHeightGap.dart';
import 'package:hrms/view/widgets/customFormAppBar.dart';

final TextEditingController emial = TextEditingController();

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customFormAppBar(title: "Sign Up"),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: email,
                cursorColor: Colors.grey.shade600,
                decoration: InputDecoration(
                  hintText: "Enter Your Employee ID",
                  prefixIcon: Icon(
                    Icons.badge,
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
              ),
              bigHeightGap(),
              TextFormField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: email,
                cursorColor: Colors.grey.shade600,
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  prefixIcon: Icon(
                    Icons.person,
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
              ),
              bigHeightGap(),
              TextFormField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: email,
                cursorColor: Colors.grey.shade600,
                decoration: InputDecoration(
                  hintText: "Enter Your Email Address",
                  prefixIcon: Icon(
                    Icons.email,
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
              ),
              bigHeightGap(),
              TextFormField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: email,
                cursorColor: Colors.grey.shade600,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  prefixIcon: Icon(
                    Icons.password,
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
              ),
              bigHeightGap(),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Colors.green.shade400),
                  onPressed: () {},
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
