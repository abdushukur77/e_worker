import 'package:equatable/equatable.dart';

import '../../data/model/category/category_model.dart';
import '../../data/model/category/sub_category_model.dart';
import '../../data/model/forms_status.dart';

class CategoriesState extends Equatable {
  final String errorText;
  final String statusMessage;
  final FormsStatus formsStatus;
  final List<CategoryModel> categories;
  final List<SubCategoryModel> subCategories;
  final CategoryModel categoryModel;

  const CategoriesState({
    required this.formsStatus,
    required this.errorText,
    required this.statusMessage,
    required this.categories,
    required this.subCategories,
    required this.categoryModel,
  });

  CategoriesState copyWith({
    String? errorText,
    FormsStatus? formsStatus,
    String? statusMessage,
    CategoryModel? categoryModel,
    List<CategoryModel>? categories,
    List<SubCategoryModel>? subCategories,
  }) {
    return CategoriesState(
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
      subCategories: subCategories ?? this.subCategories,
      categories: categories ?? this.categories,
      formsStatus: formsStatus ?? this.formsStatus,
      categoryModel: categoryModel ?? this.categoryModel,
    );
  }

  @override
  List<Object?> get props => [
        categoryModel,
        errorText,
        statusMessage,
        formsStatus,
        categories,
        subCategories
      ];
}
