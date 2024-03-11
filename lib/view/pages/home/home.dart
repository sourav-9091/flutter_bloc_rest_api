import 'package:flutter/material.dart';
import 'package:hrms/constants/constants.dart';
import 'package:hrms/view/pages/forms/hospitality.dart';
import 'package:hrms/view/pages/forms/kiit.dart';
import 'package:hrms/view/pages/forms/kims.dart';
import 'package:hrms/view/pages/forms/kiss.dart';
import 'package:hrms/view/pages/forms/temple.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(imagePaths.length,
              (index) => buildGestureDetector(imagePaths[index], index)),
        ),
      ),
    );
  }

  Widget buildGestureDetector(String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        navigate(context, index);
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => KIIT())));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => KISS())));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => HOSPITALITY())));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => KIMS())));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => TEMPLE())));
        break;
      default:
        break;
    }
  }
}
