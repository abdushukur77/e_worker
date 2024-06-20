class VacancyModel {
  final String vacancyId;
  final List<String> brandImage;
  final String categoryId;
  final String position;
  final String subCategoryId;
  final String userId;
  final String createdAt;
  final String jobTitle;
  final String description;
  final String phone;
  final bool isValid;

  VacancyModel({
    required this.vacancyId,
    required this.categoryId,
    required this.brandImage,
    required this.createdAt,
    required this.description,
    required this.jobTitle,
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
        brandImage: json['brand_image_url'] as List<String>? ?? [],
        createdAt: json['created_at'] as String? ?? '',
        description: json['description'] as String? ?? '',
        jobTitle: json['job_title'] as String? ?? '',
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
        'recruiter_phone':phone,
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
        'recruiter_phone': phone,
        'is_valid': isValid,
      };

  VacancyModel copyWith({
    String? vacancyId,
    List<String>? brandImage,
    String? categoryId,
    String? userId,
    String? createdAt,
    String? jobTitle,
    String? requiredLevel,
    String? description,
    String? phone,
    String? telegramUrl,
    String? subCategoryId,
    String? position,
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
      phone: phone ?? this.phone,
      isValid: isValid ?? this.isValid,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      position: position ?? this.position,
    );
  }

  static VacancyModel initial() => VacancyModel(
        vacancyId: "",
        categoryId: "",
        brandImage: [],
        createdAt: "",
        description: "",
        jobTitle: "",
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
  recruiterPhone,
  isValid,
  position,
  subCategoryId,
}
