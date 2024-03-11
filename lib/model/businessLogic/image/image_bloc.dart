import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hrms/model/businessLogic/image/image_event.dart';
import 'package:hrms/model/businessLogic/image/image_state.dart';
import 'package:hrms/model/repository/formSubmission.dart';

final FlutterSecureStorage storage = new FlutterSecureStorage();

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  final FormUploadRepository formUploadRepository;

  ImageUploadBloc({required this.formUploadRepository})
      : super(ImageUploadInitial());

  @override
  Stream<ImageUploadState> mapEventToState(ImageUploadEvent event) async* {
    if (event is UploadImage) {
      yield ImageUploading();
      try {
        final bool isSuccess = await formUploadRepository
            .submitImage(imageFile: event.imageFile);
        if (isSuccess) {
          yield ImageUploadSuccess();
        } else {
          yield ImageUploadFailure("Internal Server Error: Please Try Again Later");
        }
      } catch (e) {
        yield ImageUploadFailure("Internal Server Error: Please Try Again Later");
      }
    }
  }
}
