import 'package:equatable/equatable.dart';

import '../../data/model/vacancy/vacancy_model.dart';

abstract class VacancyEvent extends Equatable {}

class AddVacancyEvent extends VacancyEvent {
  final VacancyModel vacancyModel;

  AddVacancyEvent({required this.vacancyModel});

  @override
  List<Object?> get props => [vacancyModel];
}

class ChangeToInitialState extends VacancyEvent {
  @override
  List<Object?> get props => [];
}

class ChangePhoneStateEvent extends VacancyEvent {
  final bool isSecondPhone;

  ChangePhoneStateEvent({
    required this.isSecondPhone,
  });

  @override
  List<Object?> get props => [
        isSecondPhone,
      ];
}

class UpdateVacancyEvent extends VacancyEvent {
  final VacancyModel vacancyModel;

  UpdateVacancyEvent({required this.vacancyModel});

  @override
  List<Object?> get props => [vacancyModel];
}

class DeleteVacancyEvent extends VacancyEvent {
  @override
  List<Object?> get props => [];
}


class GetVacancyEvent extends VacancyEvent {
  GetVacancyEvent();

  @override
  List<Object?> get props => [];
}

class UpdateVacancyFieldEvent extends VacancyEvent {
  final dynamic value;
  final VacancyField field;

  UpdateVacancyFieldEvent({
    required this.value,
    required this.field,
  });

  @override
  List<Object?> get props => [value, field];
}

class GetVacanciesByCategoryId extends VacancyEvent {
  final String categoryId;

  GetVacanciesByCategoryId({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

class GetVacanciesBySubCategoryId extends VacancyEvent {
  final String subCategoryId;

  GetVacanciesBySubCategoryId({required this.subCategoryId});

  @override
  List<Object?> get props => [subCategoryId];
}
