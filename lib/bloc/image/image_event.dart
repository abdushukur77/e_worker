part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class UploadImage extends ImageEvent {
  final List<XFile> pickedFile;
  final List<String> storagePath;

  UploadImage({required this.pickedFile, required this.storagePath});
}

class ChangeInitialState extends ImageEvent {}

class UploadAndGetImageUrl extends ImageEvent {
  final List<File> file;
  final List<String> filename;

  UploadAndGetImageUrl({required this.file, required this.filename});
}

