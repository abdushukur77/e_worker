class VacancyModel {
  final String vacancyId;
  final String brandImage;
  final String categoryId;
  final String position;
  final String subCategoryId;
  final String userId;
  final String createdAt;
  final String jobTitle;
  final String requiredLevel;
  final String description;
  final int jobType;
  final double lat;
  final double long;
  final List<String> recruiterPhone;
  final String telegramUrl;
  final String workTime;
  final String currency;
  final String offeredSalaryFrom;
  final String offeredSalaryTo;
  final int fromWhere;
  final bool isValid;

  VacancyModel({
    required this.vacancyId,
    required this.categoryId,
    required this.brandImage,
    required this.createdAt,
    required this.description,
    required this.fromWhere,
    required this.jobTitle,
    required this.jobType,
    required this.currency,
    required this.offeredSalaryFrom,
    required this.offeredSalaryTo,
    required this.recruiterPhone,
    required this.workTime,
    required this.requiredLevel,
    required this.position,
    required this.telegramUrl,
    required this.userId,
    required this.isValid,
    required this.subCategoryId,
    required this.lat,
    required this.long,
  });

  factory VacancyModel.fromJson(Map<String, dynamic> json) => VacancyModel(
        vacancyId: json['vacancy_id'] as String? ?? '',
        subCategoryId: json['sub_category_id'] as String? ?? '',
        categoryId: json['category_id'] as String? ?? '',
        workTime: json['work_time'] as String? ?? '',
        brandImage: json['brand_image_url'] as String? ?? '',
        createdAt: json['created_at'] as String? ?? '',
        description: json['description'] as String? ?? '',
        fromWhere: json['from_where'] as int? ?? 0,
        jobTitle: json['job_title'] as String? ?? '',
        jobType: json['job_type'] as int? ?? 0,
        lat: json['lat'] as double? ?? 0.0,
        long: json['long'] as double? ?? 0.0,
        currency: json['currency'] as String? ?? '',
        offeredSalaryFrom: json['offered_salary_from'] as String? ?? '',
        offeredSalaryTo: json['offered_salary_to'] as String? ?? '',
        recruiterPhone: (json['recruiter_phone'] as List<dynamic>?)
                ?.map((phone) => phone as String)
                .toList() ??
            [],
        requiredLevel: json['required_level'] as String? ?? '',
        telegramUrl: json['telegram_url'] as String? ?? '',
        userId: json['user_id'] as String? ?? '',
        position: json['position'] as String? ?? '',
        isValid: json['is_valid'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'vacancy_id': vacancyId,
        'brand_image_url': brandImage,
        'category_id': categoryId,
        'user_id': userId,
        'created_at': createdAt,
        'job_title': jobTitle,
        'sub_category_id': subCategoryId,
        'required_level': requiredLevel,
        'description': description,
        'job_type': jobType,
        "lat": lat,
        "long": long,
        'recruiter_phone': recruiterPhone,
        'telegram_url': telegramUrl,
        'currency': currency,
        'offered_salary_from': offeredSalaryFrom,
        'offered_salary_to': offeredSalaryTo,
        'from_where': fromWhere,
        'is_valid': isValid,
        'position': position,
        'work_time': workTime,
      };

  Map<String, dynamic> toJsonForUpdate() => {
        'position': position,
        'work_time': workTime,
        'brand_image_url': brandImage,
        'category_id': categoryId,
        "lat": lat,
        "long": long,
        'user_id': userId,
        'created_at': createdAt,
        'job_title': jobTitle,
        'required_level': requiredLevel,
        'description': description,
        'job_type': jobType,
        'recruiter_phone': recruiterPhone,
        'telegram_url': telegramUrl,
        'currency': currency,
        'offered_salary_from': offeredSalaryFrom,
        'offered_salary_to': offeredSalaryTo,
        'from_where': fromWhere,
        'is_valid': isValid,
      };

  VacancyModel copyWith({
    String? vacancyId,
    String? brandImage,
    String? categoryId,
    String? userId,
    String? createdAt,
    String? jobTitle,
    String? requiredLevel,
    String? description,
    int? jobType,
    List<String>? recruiterPhone,
    String? telegramUrl,
    String? currency,
    String? offeredSalaryFrom,
    String? offeredSalaryTo,
    String? subCategoryId,
    String? position,
    String? workTime,
    int? fromWhere,
    double? lat,
    double? long,
    bool? isValid,
  }) {
    return VacancyModel(
      vacancyId: vacancyId ?? this.vacancyId,
      brandImage: brandImage ?? this.brandImage,
      workTime: workTime ?? this.workTime,
      categoryId: categoryId ?? this.categoryId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      jobTitle: jobTitle ?? this.jobTitle,
      requiredLevel: requiredLevel ?? this.requiredLevel,
      description: description ?? this.description,
      jobType: jobType ?? this.jobType,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      recruiterPhone: recruiterPhone ?? this.recruiterPhone,
      telegramUrl: telegramUrl ?? this.telegramUrl,
      currency: currency ?? this.currency,
      offeredSalaryFrom: offeredSalaryFrom ?? this.offeredSalaryFrom,
      offeredSalaryTo: offeredSalaryTo ?? this.offeredSalaryTo,
      fromWhere: fromWhere ?? this.fromWhere,
      isValid: isValid ?? this.isValid,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      position: position ?? this.position,
    );
  }

  static VacancyModel initial() => VacancyModel(
        vacancyId: "",
        categoryId: "",
        brandImage: "",
        createdAt: "",
        description: "",
        fromWhere: 0,
        jobTitle: "",
        jobType: -1,
        currency: "SO'M",
        offeredSalaryFrom: "",
        offeredSalaryTo: "",
        recruiterPhone: [],
        requiredLevel: "",
        telegramUrl: "",
        workTime: "",
        userId: "",
        subCategoryId: "",
        position: "",
        isValid: true,
        lat: 0.0,
        long: 0.0,
      );
}

enum VacancyField {
  vacancyId,
  brandImage,
  categoryId,
  userId,
  createdAt,
  jobTitle,
  requiredLevel,
  description,
  jobType,
  recruiterPhone,
  telegramUrl,
  currency,
  offeredSalaryFrom,
  offeredSalaryTo,
  fromWhere,
  isValid,
  position,
  subCategoryId,
  workTime,
  lat,
  long,
}
