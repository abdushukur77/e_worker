import 'package:flutter/cupertino.dart';

import '../model/network_response.dart';

class VacancyRepository {
  // Future<NetworkResponse> addVacancy(VacancyModel vacancyModel) async {
  //   try {
  //     DocumentReference documentReference = await FirebaseFirestore.instance
  //         .collection(AppConstants.vacancyTable)
  //         .add(vacancyModel.toJson());
  //
  //     await FirebaseFirestore.instance
  //         .collection(AppConstants.vacancyTable)
  //         .doc(documentReference.id)
  //         .update({"vacancy_id": documentReference.id});
  //     UtilityFunctions.printVacancy(
  //       vacancyModel,
  //     );
  //     return NetworkResponse(data: vacancyModel);
  //   } on FirebaseException catch (error) {
  //     debugPrint("Vacancy ADD ERROR:$error");
  //     return NetworkResponse(
  //       errorText: error.toString(),
  //     );
  //   }
  // }
  //
  //
  // // Update an vacancy
  // Future<NetworkResponse> updateVacancy(VacancyModel vacancyModel) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection(AppConstants.vacancyTable)
  //         .doc(vacancyModel.vacancyId)
  //         .update(vacancyModel.toJsonForUpdate());
  //
  //     return NetworkResponse(data: "success");
  //   } on FirebaseException catch (error) {
  //     return NetworkResponse(
  //       errorText: error.toString(),
  //     );
  //   }
  // }
  //
  // // Delete a vacancy
  // Future<NetworkResponse> deleteVacancy(String docId) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection(AppConstants.vacancyTable)
  //         .doc(docId)
  //         .delete();
  //
  //     return NetworkResponse(data: "success");
  //   } on FirebaseException catch (error) {
  //     return NetworkResponse(
  //       errorText: error.toString(),
  //     );
  //   }
  // }
  //
  // // Get vacancy by user Id
  // Future<NetworkResponse> getVacanciesByUserId(String userId) async {
  //   try {
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection(AppConstants.vacancyTable)
  //         .where("user_id", isEqualTo: userId)
  //         .get();
  //
  //     return NetworkResponse(
  //       data: querySnapshot.docs
  //           .map((doc) => VacancyModel.fromJson(doc.data()))
  //           .toList(),
  //     );
  //   } catch (error) {
  //     debugPrint("Error fetching vacancies by user ID: $error");
  //     return NetworkResponse(errorText: error.toString());
  //   }
  // }
  //
  // // Get all vacancies
  // Stream<List<VacancyModel>> getAllVacancies() => FirebaseFirestore.instance
  //     .collection(AppConstants.vacancyTable)
  //     .snapshots()
  //     .map((event) =>
  //         event.docs.map((doc) => VacancyModel.fromJson(doc.data())).toList());
  //
  // Future<NetworkResponse> getVacanciesByCategoryId(String categoryId) async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await FirebaseFirestore.instance
  //             .collection(AppConstants.vacancyTable)
  //             .where("category_id", isEqualTo: categoryId)
  //             .get();
  //
  //     List<VacancyModel> vacancies = querySnapshot.docs
  //         .map((doc) => VacancyModel.fromJson(doc.data()))
  //         .toList();
  //     return NetworkResponse(data: vacancies);
  //   } on FirebaseException catch (error) {
  //     return NetworkResponse(errorCode: error.code);
  //   }
  // }
  //
  // Future<NetworkResponse> getVacanciesBySubCategoryId(
  //     String subCategoryId) async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await FirebaseFirestore.instance
  //             .collection(AppConstants.vacancyTable)
  //             .where("sub_category_id", isEqualTo: subCategoryId)
  //             .get();
  //
  //     List<VacancyModel> vacancies = querySnapshot.docs
  //         .map((doc) => VacancyModel.fromJson(doc.data()))
  //         .toList();
  //     return NetworkResponse(data: vacancies);
  //   } on FirebaseException catch (error) {
  //     return NetworkResponse(errorCode: error.code);
  //   }
  // }

}
