
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<UploadImage>(_uploadImage);
    on<UploadAndGetImageUrl>(_uploadAndGetImageUrl);
    on<ChangeInitialState>(_changeInitialState);
  }

  void _changeInitialState(ChangeInitialState event, Emitter<ImageState> emit) {
    emit(ImageInitial());
  }

  Future<void> _uploadImage(UploadImage event, Emitter<ImageState> emit) async {
    emit(ImageLoading());

    // try {
    //   var ref = FirebaseStorage.instance.ref().child(event.storagePath);
    //   File file = File(event.pickedFile.path);
    //   var uploadTask = await ref.putFile(file);
    //   String downloadUrl = await uploadTask.ref.getDownloadURL();
    //
    //   print('DOWNLOAD URL:888888888888 $downloadUrl'); // Debugging line
    //   emit(ImageSuccess(downloadUrl));
    // } on FirebaseException catch (error) {
    //   emit(ImageFailure(error.toString()));
    // }
  }

  Future<void> _uploadAndGetImageUrl(UploadAndGetImageUrl event, Emitter<ImageState> emit) async {
    emit(ImageLoading());

    // try {
      // final storageRef = FirebaseStorage.instance.ref();
    //   final fileRef = storageRef.child(event.filename);
    //   await fileRef.putFile(event.file);
    //   String imageUrl = await fileRef.getDownloadURL();
    //
    //   print('DOWNLOAD URL:7777777777777 $imageUrl'); // Debugging line
    //   emit(ImageSuccess(imageUrl));
    // } on FirebaseException catch (e) {
    //   emit(ImageFailure(e.message ?? 'An error occurred'));
    // }
  }
}
