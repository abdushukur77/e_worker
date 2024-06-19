class VacancyModel {
  final String vacancyId;
  final String brandImage;
  final String categoryId;
  final String position;
  final String subCategoryId;
  final String userId;
  final String createdAt;
  final String jobTitle;
  final String description;
  final int jobType;
  final String phone;
  final String currency;
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
    required this.phone,
    required this.position,
    required this.userId,
    required this.isValid,
    required this.subCategoryId,
  });

  factory VacancyModel.fromJson(Map<String, dynamic> json) => VacancyModel(
        vacancyId: json['vacancy_id'] as String? ?? '',
        subCategoryId: json['sub_category_id'] as String? ?? '',
        categoryId: json['category_id'] as String? ?? '',
        brandImage: json['brand_image_url'] as String? ?? '',
        createdAt: json['created_at'] as String? ?? '',
        description: json['description'] as String? ?? '',
        fromWhere: json['from_where'] as int? ?? 0,
        jobTitle: json['job_title'] as String? ?? '',
        jobType: json['job_type'] as int? ?? 0,
        currency: json['currency'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
        userId:json['user_id'] as String? ?? '',
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
        'description': description,
        'job_type': jobType,
        'recruiter_phone':phone,
        'currency': currency,
        'from_where': fromWhere,
        'is_valid': isValid,
        'position': position,
      };

  Map<String, dynamic> toJsonForUpdate() => {
        'position': position,
        'brand_image_url': brandImage,
        'category_id': categoryId,
        'user_id': userId,
        'created_at': createdAt,
        'job_title': jobTitle,
        'description': description,
        'job_type': jobType,
        'recruiter_phone': phone,
        'currency': currency,
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
    String? phone,
    String? telegramUrl,
    String? currency,
    String? subCategoryId,
    String? position,
    int? fromWhere,
    bool? isValid,
  }) {
    return VacancyModel(
      vacancyId: vacancyId ?? this.vacancyId,
      brandImage: brandImage ?? this.brandImage,
      categoryId: categoryId ?? this.categoryId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      jobTitle: jobTitle ?? this.jobTitle,
      description: description ?? this.description,
      jobType: jobType ?? this.jobType,
      phone: phone ?? this.phone,
      currency: currency ?? this.currency,
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
        phone:"",
        userId: "",
        subCategoryId: "",
        position: "",
        isValid: true,
      );
}

enum VacancyField {
  vacancyId,
  brandImage,
  categoryId,
  userId,
  createdAt,
  jobTitle,
  description,
  jobType,
  recruiterPhone,
  currency,
  fromWhere,
  isValid,
  position,
  subCategoryId,
}
