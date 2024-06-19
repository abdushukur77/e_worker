import 'package:e_worker/data/model/vacancy/vacancy_model.dart';

class SavedVacancyModel {
  final String docId;
  final VacancyModel vacancyModel;
  final String userId;

  SavedVacancyModel({
    required this.docId,
    required this.vacancyModel,
    required this.userId,
  });

  factory SavedVacancyModel.fromJson(Map<String, dynamic> json) {
    return SavedVacancyModel(
      docId: json['docId'] as String? ?? "",
      vacancyModel: VacancyModel.fromJson(json["vacancyModel"]?? {} ),
      userId: json['userId'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'vacancyModel': vacancyModel.toJson(),
      'userId': userId,
    };
  }

}
