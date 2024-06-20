import 'package:flutter/services.dart';

import '../colors/app_colors.dart';

class AppConstants {
  static RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  static RegExp textRegExp = RegExp(r"^[A-Z][a-zA-Z]*");

  static const String vacancyTable = 'vacancies';
  static String resumesTable = "resumes_table_best_developers";
  static String categories = "categories";
  static String banners = "banners";
  static String subCategories = "sub_categories";
  static String savedJobs = "saved_jobs_best_developers";
  static String topicName = "users";

  static SystemUiOverlayStyle getOverlayStyle() => const SystemUiOverlayStyle(
    statusBarColor: AppColors.transparent,
  );
  static const List<String> countries = [
    "Uzbekistan",
    "Afghanistan",
    "Armenia",
    "Azerbaijan",
    "Bahrain",
    "Bangladesh",
    "Bhutan",
    "Brunei",
    "Cambodia",
    "China",
    "Cyprus",
    "Georgia",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Israel",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Lebanon",
    "Malaysia",
    "Maldives",
    "Mongolia",
    "Myanmar (Burma)",
    "Nepal",
    "North Korea",
    "Oman",
    "Pakistan",
    "Palestine",
    "Philippines",
    "Qatar",
    "Russia (partly in Asia)",
    "Saudi Arabia",
    "Singapore",
    "South Korea",
    "Sri Lanka",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Thailand",
    "Timor-Leste (East Timor)",
    "Turkey (partly in Asia)",
    "Turkmenistan",
    "United Arab Emirates",
    "Vietnam",
    "Yemen",
  ];
}
