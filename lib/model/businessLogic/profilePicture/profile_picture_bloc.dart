// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:hrms/model/repository/imageRepository.dart';
// import 'image_upload_event.dart';
// import 'image_upload_state.dart';

// class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
//   final ImageRepository imageRepository;

//   ImageUploadBloc({required this.imageRepository})
//       : super(ImageUploadInitial());

//   @override
//   Stream<ImageUploadState> mapEventToState(ImageUploadEvent event) async* {
//     if (event is UploadImage) {
//       yield ImageUploading();
//       try {
//         final imageUrl = await imageRepository.uploadImage(event.image);
//         // Assume imageUrl is the URL of the uploaded image
//         yield ImageUploadSuccess();
//       } catch (e) {
//         yield ImageUploadFailure('Failed to upload image: $e');
//       }
//     }
//   }
// }
