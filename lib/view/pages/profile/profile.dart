import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hrms/view/widgets/bigHeightGap.dart';
import 'package:hrms/view/widgets/customFormAppBar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';

final TextEditingController email = TextEditingController();

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customFormAppBar(title: "Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: CarouselSlider(
                    options: CarouselOptions(),
                    items: [
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: _image != null
                                  ? FileImage(_image!)
                                  : const AssetImage('placeholder_image.jpg')
                                      as ImageProvider,
                            ),
                            GestureDetector(
                              onTap: _getImage,
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Center(
                                  child: Icon(Icons.add_a_photo_outlined),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: QrImageView(
                          data: 'souravgoel9091@gmail.com',
                          version: QrVersions.auto,
                          size: 160.0,
                        ),
                      ),
                    ],
                  ),
                ),
                bigHeightGap(),
                const Text(
                  "Sourav Goel",
                  style: TextStyle(fontSize: 20),
                ),
                bigHeightGap(),
                TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  cursorColor: Colors.grey.shade600,
                  decoration: InputDecoration(
                    hintText: "Sourav Goel",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade100),
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
                    hintText: "souravgoel9091@gmail.com",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade100),
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
                    hintText: "Computer Science",
                    prefixIcon: Icon(
                      Icons.badge,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade100),
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
                      "Update Profile",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
