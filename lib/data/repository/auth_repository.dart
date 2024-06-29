import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_worker/data/model/user/user_model.dart';
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
          .collection(AppConstants.users)
          .doc(documentReference.id)
          .update({"userId": documentReference.id});
      return NetworkResponse(data:userModel);
    } on FirebaseException catch (error) {
      debugPrint("Vacancy ADD ERROR:$error");
      return NetworkResponse(
        errorText: error.toString(),
      );
    }
  }
  Future<NetworkResponse> getUser()async{
    try{
      final querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.users)
          .where("authUid", isEqualTo:StorageRepository.getString(key:"authId").toString())
          .get();
      return NetworkResponse(
        data: querySnapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList(),
      );
    }
    catch(error){
      return NetworkResponse(errorText: "Error");
    }
  }
}
