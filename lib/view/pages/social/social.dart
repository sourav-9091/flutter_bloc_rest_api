import 'package:flutter/material.dart';
import 'package:any_link_preview/any_link_preview.dart';
import 'package:shimmer/shimmer.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  String? selectedSocialMedia = 'Facebook';
  List<String> links = [
    'https://www.facebook.com',
    'https://www.google.com',
  ];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void fetchLinks() async {
    setState(() {
      isLoading = true;
    });
    // Simulating a delay to mimic network request
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // You can update links list here from your API response
      links = [
        'https://www.facebook.com',
        'https://www.google.com',
        'https://www.twitter.com'
      ];
      isLoading = false;
    });
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
                'Select The Platform',
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchLinks,
              child: Text('Fetch Links'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: isLoading ? 3 : links.length,
                itemBuilder: (context, index) {
                  if (isLoading) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ListTile(
                          title: Container(
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  } else {
                    String link = links[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: AnyLinkPreview(
                        link: link,
                        bodyMaxLines: 2,
                        bodyTextOverflow: TextOverflow.ellipsis,
                        bodyStyle: TextStyle(color: Colors.grey.shade100),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
