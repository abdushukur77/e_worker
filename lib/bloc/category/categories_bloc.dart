import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/category/category_model.dart';
import '../../data/model/category/sub_category_model.dart';
import '../../data/model/forms_status.dart';
import '../../data/model/network_response.dart';
import '../../data/repository/category_repository.dart';
import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required this.categoriesRepository})
      : super(
          CategoriesState(
              formsStatus: FormsStatus.pure,
              errorText: "",
              statusMessage: "",
              categories: const [],
              subCategories: const [],
              categoryModel: CategoryModel.initial()),
        ) {
    on<GetCategoriesByCategoryId>(_getCategoriesByCategoryId);
    on<GetSubCategories>(_getSubCategories);
    on<GetCategories>(_getCategories);
  }

  CategoriesRepository categoriesRepository;

  Future<void> _getCategories(GetCategories event, emit) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse response = await categoriesRepository.getAllCategories();

    if (response.errorText.isEmpty) {
      List<CategoryModel> categories = response.data as List<CategoryModel>;

      emit(state.copyWith(
          categories: categories, formsStatus: FormsStatus.success));
    } else {
      emit(state.copyWith(
          formsStatus: FormsStatus.error, errorText: response.errorCode));
    }
  }

  Future<void> _getCategoriesByCategoryId(
      GetCategoriesByCategoryId event, emit) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse response =
        await categoriesRepository.getCategoriesByCategoryId(event.categoryId);

    if (response.errorText.isEmpty) {
      CategoryModel categoryModel = response.data as CategoryModel;
      emit(state.copyWith(
          categoryModel: categoryModel, formsStatus: FormsStatus.success));
    } else {
      emit(state.copyWith(
          formsStatus: FormsStatus.error, errorText: response.errorCode));
    }
  }

  Future<void> _getSubCategories(GetSubCategories event, emit) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse response =
        await categoriesRepository.getSubCategories(event.parentId);

    if (response.errorText.isEmpty) {
      List<SubCategoryModel> subCategories =
          response.data as List<SubCategoryModel>;
      emit(state.copyWith(
          subCategories: subCategories, formsStatus: FormsStatus.success));
    } else {
      emit(state.copyWith(
          formsStatus: FormsStatus.error, errorText: response.errorCode));
    }
  }
}
