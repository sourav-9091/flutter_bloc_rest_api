import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String? selectedSocialMedia = 'Kiit';
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
              items: <String>['Kiit', 'Kiss', 'Kims', 'Temple', 'Hospitality']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                hintText: 'Select Form',
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
          ],
        ),
      ),
    );
  }
}
