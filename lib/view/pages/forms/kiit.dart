import 'dart:io';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/constants/kiitFormConstants.dart';
import 'package:hrms/model/businessLogic/form/form_bloc.dart';
import 'package:hrms/model/businessLogic/form/form_state.dart';
import 'package:hrms/model/businessLogic/image/image_bloc.dart';
import 'package:hrms/model/businessLogic/image/image_event.dart';
import 'package:hrms/model/businessLogic/image/image_state.dart';
import 'package:hrms/view/pages/loadingIndicator.dart';
import 'package:hrms/view/widgets/customFormAppBar.dart';
import 'package:hrms/view/widgets/customInputField.dart';
import 'package:image_picker/image_picker.dart';

class KIIT extends StatefulWidget {
  const KIIT({Key? key}) : super(key: key);

  @override
  State<KIIT> createState() => _KIITState();
}

class _KIITState extends State<KIIT> {
  final _formKey = GlobalKey<FormState>();
  List<File> images = [];
  String countryValue = "India";
  String stateValue = "";
  String cityValue = "";
  bool noImageChecked = false;

  @override
  Widget build(BuildContext context) {
    final ImageUploadBloc imageUploadBloc =
        BlocProvider.of<ImageUploadBloc>(context);
    final FormSubmissionBloc formSubmissionBloc =
        BlocProvider.of<FormSubmissionBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customFormAppBar(title: "KIIT"),
      body: BlocBuilder<FormSubmissionBloc, FormSubmissionState>(
        builder: (context, state) {
          return BlocBuilder<ImageUploadBloc, ImageUploadState>(
            builder: (context, state) {
              bool uploadButtonDisabled = noImageChecked || images.isEmpty;
              bool submitButtonDisabled =
                  _formKey.currentState?.validate() != true || noImageChecked;
              bool addImageDisabled = noImageChecked;

              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: List.generate(
                              kiitInputFields.length,
                              (index) => Column(
                                children: [
                                  customInputField(
                                    kiitInputFields[index]['hint'],
                                    kiitInputFields[index]['icon'],
                                    kiitInputFields[index]['controller'],
                                    kiitInputFields[index]['inputType'],
                                    kiitInputFields[index]['validator'],
                                    kiitInputFields[index]['val'],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CSCPicker(
                            dropdownDecoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.grey.shade100, width: 1)),
                            disabledDropdownDecoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.grey.shade100, width: 1)),
                            onCountryChanged: (value) {
                              setState(() {
                                countryValue = value;
                              });
                            },
                            onStateChanged: (value) {
                              setState(() {
                                stateValue = value ?? "";
                              });
                            },
                            onCityChanged: (value) {
                              setState(() {
                                cityValue = value ?? "";
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Upload Bill',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ...images.map(
                                            (image) => Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        image: FileImage(image),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          images.remove(image);
                                                        });
                                                      },
                                                      icon: const Icon(
                                                          Icons.close),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: addImageDisabled
                                                ? null
                                                : () {
                                                    _pickImage();
                                                  },
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('No Image to Upload'),
                              Checkbox(
                                value: noImageChecked,
                                onChanged: (value) {
                                  setState(() {
                                    noImageChecked = value ?? false;
                                    if (noImageChecked) {
                                      images.clear();
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            state is ImageUploading
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      onPrimary: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: LoadingIndicator(),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      onPrimary: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      // imageUploadBloc.add(UploadImage());
                                      setState(() {
                                        submitButtonDisabled = false;
                                      });
                                    },
                                    child: const Text("Upload"),
                                  ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: submitButtonDisabled
                                  ? null
                                  : () {
                                      // Handle submit button press
                                      if (_formKey.currentState!.validate()) {
                                        print("Valid");
                                      } else {
                                        print("Not Valid");
                                      }
                                    },
                              child: const Text("Submit"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (images.length < 3) {
          images.add(File(pickedFile.path));
        }
      });
    }
  }
}
