import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_worker/data/local/storage_repository.dart';
import 'package:e_worker/data/model/vacancy/vacancy_model.dart';
import 'package:e_worker/utils/constants/app_constants.dart';
import 'package:e_worker/utils/utility/utility_functions.dart';
import 'package:flutter/cupertino.dart';

import '../model/network_response.dart';

class MyVacancyRepository {
  Future<NetworkResponse> addMyVacancy(VacancyModel vacancyModel) async {
    try {
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection(AppConstants.myVacancyTable)
          .add(vacancyModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.myVacancyTable)
          .doc(documentReference.id)
          .update({"vacancy_id": documentReference.id});
      StorageRepository.setString(key: 'key', value:documentReference.id);
      UtilityFunctions.printVacancy(
        vacancyModel,
      );
      return NetworkResponse(data: vacancyModel);
    } on FirebaseException catch (error) {
      debugPrint("Vacancy ADD ERROR:$error");
      return NetworkResponse(
        errorText: error.toString(),
      );
    }
  }

  // Get all vacancies
  Stream<List<VacancyModel>> getAllVacancies() => FirebaseFirestore.instance
      .collection(AppConstants.myVacancyTable)
      .snapshots()
      .map((event) =>
          event.docs.map((doc) => VacancyModel.fromJson(doc.data())).toList());
}
