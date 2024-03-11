import 'package:flutter/material.dart';
import 'package:hrms/constants/kiitFormConstants.dart';
import 'package:hrms/view/widgets/bigHeightGap.dart';
import 'package:hrms/view/widgets/customFormAppBar.dart';
import 'package:hrms/view/widgets/smallHeightGap.dart';

final TextEditingController emial = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController confirmPassword = TextEditingController();

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customFormAppBar(title: "Password Reset"),
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
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0, backgroundColor: Colors.green.shade400),
                onPressed: () {},
                child: const Text(
                  "Send OTP",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            smallHeightGap(),
            Divider(),
            smallHeightGap(),
            TextFormField(
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              controller: email,
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                hintText: "Enter Your OTP",
                prefixIcon: Icon(
                  Icons.lock,
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
                  "Verify",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            smallHeightGap(),
            Divider(),
            smallHeightGap(),
            TextFormField(
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              controller: email,
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                hintText: "New Password",
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
            TextFormField(
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              controller: email,
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                hintText: "Confirm New Password",
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
                  "Reset Password",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
