import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';

class FormUploadRepository {
  final String _generateImageLinkUrl =
      "https://backend.evently.adityachoudhury.com/api/auth/face-add";
  final String _uploadFormDataUrl =
      "https://backend.evently.adityachoudhury.com/api/demo";
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<String?> requestImageUploadLink({
    required String fileName,
    required String fileType,
  }) async {
    try {
      var value = await storage.read(key: 'loginResponse');
      if (value == null) {
        print("Login response not found.");
        return null;
      }
      LoginResponse loginResponse = LoginResponse.fromMap(json.decode(value));

      Map<String, dynamic> requestBody = {
        "key": fileName,
        "type": fileType,
      };

      Dio dio = Dio();
      dio.options.headers['Authorization'] =
          'Bearer ${loginResponse.backendTokens.token}';
      dio.options.headers['Content-Type'] = 'application/json';
      Response response =
          await dio.post(_generateImageLinkUrl, data: json.encode(requestBody));

      if (response.statusCode == 200) {
        print(response.toString());
        return response.toString();
      } else {
        print("Failed to get image upload link: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error requesting image upload link: $e");
      return null;
    }
  }

  Future<bool> submitImage({
    required File imageFile,
  }) async {
    try {
      String? uploadLink = await requestImageUploadLink(
        fileName: 'user_id_file_name.png',
        fileType: 'image/png',
      );

      if (uploadLink == null) {
        print("Failed to get image upload link.");
        return false;
      }

      FormData imageFormData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imageFile.path),
      });

      Dio dio = Dio();
      Response imageResponse = await dio.put(uploadLink, data: imageFormData);

      if (imageResponse.statusCode != 200) {
        print("Failed to upload image: ${imageResponse.statusCode}");
        return false;
      }
      return true;
    } catch (e) {
      print("Error submitting form data with image: $e");
      return false;
    }
  }

  Future<bool> submitFormData({
    required Map<String, dynamic> formData,
  }) async {
    try {
      Dio dio = Dio();
      FormData generalFormData = FormData.fromMap(formData);
      Response formDataResponse =
          await dio.post(_uploadFormDataUrl, data: generalFormData);
      return formDataResponse.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
