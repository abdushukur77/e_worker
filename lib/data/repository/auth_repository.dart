import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_worker/data/model/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/constants/app_constants.dart';
import '../local/storage_repository.dart';
import '../model/network_response.dart';

class AuthRepository {
  Future<NetworkResponse> addUser(UserModel userModel) async {
    try {
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection(AppConstants.users)
          .add(userModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.myVacancyTable)
          .doc(documentReference.id)
          .update({"userId": documentReference.id});
      StorageRepository.setString(key: 'key', value:documentReference.id);
      return NetworkResponse(data:userModel);
    } on FirebaseException catch (error) {
      debugPrint("Vacancy ADD ERROR:$error");
      return NetworkResponse(
        errorText: error.toString(),
      );
    }
  }
}
