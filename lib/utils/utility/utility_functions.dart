import 'package:flutter/material.dart';

import '../../data/model/vacancy/vacancy_model.dart';

class UtilityFunctions {
  static void methodPrint(dynamic value) {
    debugPrint(
      "\$\$\$\$\$\n$value\n\$\$\$\$\$",
    );
  }

  static void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void printVacancy(VacancyModel vacancyModel) {
    methodPrint(
      "CURRENT VACANCY: LAT: ${vacancyModel.lat}, LONG: ${vacancyModel.long} isValid: ${vacancyModel.isValid} fromWhere: ${vacancyModel.fromWhere} offeredSalaryTo: ${vacancyModel.offeredSalaryTo} offeredSalaryFrom: ${vacancyModel.offeredSalaryFrom} level: ${vacancyModel.requiredLevel} currency: ${vacancyModel.currency} telegramUrl: ${vacancyModel.telegramUrl} recruiterPhone: ${vacancyModel.recruiterPhone} jobType: ${vacancyModel.jobType} description: ${vacancyModel.description} requiredLevel: ${vacancyModel.requiredLevel} jobTitle: ${vacancyModel.jobTitle} createdAt: ${vacancyModel.createdAt} userId: ${vacancyModel.userId} subCategoryId: ${vacancyModel.subCategoryId} position: ${vacancyModel.position} categoryId: ${vacancyModel.categoryId} brandImage: ${vacancyModel.brandImage},",
    );
    for (int i = 0; i < vacancyModel.recruiterPhone.length; i++) {
      methodPrint(
          "CURRENT VACANCY PHONE NUMBER IS: ${vacancyModel.recruiterPhone[i]}");
    }
  }

  static String timeAgo(DateTime dateTime) {
    debugPrint(DateTime.now().toString());
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return '${difference.inDays ~/ 365} yil oldin';
    } else if (difference.inDays > 30) {
      return '${difference.inDays ~/ 30} oy oldin';
    } else if (difference.inDays > 7) {
      return '${difference.inDays ~/ 7} hafta oldin';
    } else if (difference.inDays > 1) {
      return '${difference.inDays} kun oldin';
    } else if (difference.inHours > 1) {
      return '${difference.inHours} soat oldin';
    } else if (difference.inMinutes > 1) {
      return '${difference.inMinutes} daqiqa oldin';
    } else if (difference.inSeconds > 1) {
      return '${difference.inSeconds} sekund oldin';
    } else {
      return 'hozir';
    }
  }
}
