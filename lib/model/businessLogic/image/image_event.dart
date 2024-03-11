import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ImageUploadEvent extends Equatable {
  const ImageUploadEvent();
}

class UploadImage extends ImageUploadEvent {
  final File imageFile;
  const UploadImage({
    required this.imageFile,
  });

  @override
  List<Object> get props => [];
}
