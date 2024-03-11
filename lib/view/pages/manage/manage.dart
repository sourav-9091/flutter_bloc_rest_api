import 'package:flutter/material.dart';

class Manage extends StatefulWidget {
  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  String? selectedSocialMedia = 'Facebook';
  String? selectedOption1 = 'Option 1';
  String? selectedOption2 = 'Option 1';

  void fetchLinks() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Select The Form',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              borderRadius: BorderRadius.circular(20),
              value: selectedSocialMedia,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSocialMedia = newValue;
                  fetchLinks();
                });
              },
              items: <String>['Facebook', 'Twitter', 'YouTube']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                hintText: 'Select Social Media',
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(20),
                    value: selectedOption1,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption1 = newValue;
                      });
                    },
                    items: <String>['Option 1', 'Option 2', 'Option 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      hintText: 'Select Option 1',
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
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(20),
                    value: selectedOption2,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption2 = newValue;
                      });
                    },
                    items: <String>['Option 1', 'Option 2', 'Option 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      hintText: 'Select Option 2',
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
