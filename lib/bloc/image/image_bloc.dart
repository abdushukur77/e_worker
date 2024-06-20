import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
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

    try {
      List<String> downloadUrl = [];
      for (int i = 0; i < event.storagePath.length; i++) {
        var ref = FirebaseStorage.instance.ref().child(event.storagePath[i]);
        File file = File(event.pickedFile[i].path);
        var uploadTask = await ref.putFile(file);
        String url = await uploadTask.ref.getDownloadURL();
        downloadUrl.add(url);
      }
      debugPrint('DOWNLOAD URL: $downloadUrl');
      emit(ImageSuccess(downloadUrl));
    } on FirebaseException catch (error) {
      emit(ImageFailure(error.toString()));
    }
  }

  Future<void> _uploadAndGetImageUrl(UploadAndGetImageUrl event, Emitter<ImageState> emit) async {
    emit(ImageLoading());
    try {
      List<String> imageUrl = [];
      for (int i = 0; i < event.filename.length; i++) {
        final storageRef = FirebaseStorage.instance.ref();
        final fileRef = storageRef.child(event.filename[i]);
        await fileRef.putFile(event.file[i]);
        String url = await fileRef.getDownloadURL();
        imageUrl.add(url);
      }
      emit(ImageSuccess(imageUrl));
    } on FirebaseException catch (e) {
      emit(ImageFailure(e.message ?? 'An error occurred'));
    }
  }
}
