import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {}

class GetCategories extends CategoriesEvent {
  @override
  List<Object?> get props => [];
}

class GetSubCategories extends CategoriesEvent {
  final String parentId;

  GetSubCategories({required this.parentId});
  @override
  List<Object?> get props => [parentId];
}

class GetCategoriesByCategoryId extends CategoriesEvent {
  final String categoryId;

  GetCategoriesByCategoryId({required this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}
