import 'package:equatable/equatable.dart';

import '../../data/model/vacancy/vacancy_model.dart';

abstract class MyVacancyEvent extends Equatable {}

class MyAddVacancyEvent extends MyVacancyEvent {
  final VacancyModel vacancyModel;
  MyAddVacancyEvent({required this.vacancyModel});

  @override
  List<Object?> get props => [vacancyModel];
}

class ChangeToInitialEvent extends MyVacancyEvent {
  @override
  List<Object?> get props => [];
}




class MyGetVacancyEvent extends MyVacancyEvent {
  final String userId;

  MyGetVacancyEvent({required this.userId});

  @override
  List<Object?> get props => [];
}



