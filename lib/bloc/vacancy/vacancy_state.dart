import 'package:equatable/equatable.dart';
import '../../data/model/forms_status.dart';
import '../../data/model/vacancy/vacancy_model.dart';

class VacancyState extends Equatable {
  final FormsStatus status;
  final bool isSecond;
  final String errorMessage;
  final String statusMessage;
  final VacancyModel vacancyModel;
  final List<VacancyModel> vacancies;
  final List<VacancyModel> vacanciesForFilter;
  final int remoteVacancyCount;
  final int fullTimeVacancyCount;
  final int partTimeVacancyCount;
  final List<VacancyModel> resentVacancies;

  const VacancyState({
    required this.resentVacancies,
    required this.status,
    required this.isSecond,
    required this.errorMessage,
    required this.statusMessage,
    required this.vacancyModel,
    required this.vacancies,
    required this.vacanciesForFilter,
    required this.remoteVacancyCount,
    required this.fullTimeVacancyCount,
    required this.partTimeVacancyCount,
  });

  VacancyState copyWith({
    FormsStatus? status,
    String? errorMessage,
    String? statusMessage,
    VacancyModel? vacancyModel,
    bool? isSecond,
    List<VacancyModel>? vacancies,
    List<VacancyModel>? resentVacancies,
    List<VacancyModel>? vacanciesForFilter,
    int? remoteVacancyCount,
    int? fullTimeVacancyCount,
    int? partTimeVacancyCount,
  }) {
    return VacancyState(
      status: status ?? this.status,
      isSecond: isSecond ?? this.isSecond,
      errorMessage: errorMessage ?? this.errorMessage,
      statusMessage: statusMessage ?? this.statusMessage,
      vacancyModel: vacancyModel ?? this.vacancyModel,
      vacancies: vacancies ?? this.vacancies,
      vacanciesForFilter: vacanciesForFilter ?? this.vacanciesForFilter,
      remoteVacancyCount: remoteVacancyCount ?? this.remoteVacancyCount,
      fullTimeVacancyCount: fullTimeVacancyCount ?? this.fullTimeVacancyCount,
      partTimeVacancyCount: partTimeVacancyCount ?? this.partTimeVacancyCount,
      resentVacancies: resentVacancies ?? this.resentVacancies,
    );
  }

  static VacancyState initialValue() => VacancyState(
      vacancyModel: VacancyModel.initial(),
      status: FormsStatus.pure,
      statusMessage: '',
      errorMessage: '',
      isSecond: false,
      vacancies: const [],
      vacanciesForFilter: const [],
      partTimeVacancyCount: 0,
      fullTimeVacancyCount: 0,
      remoteVacancyCount: 0,
      resentVacancies: const []);

  @override
  List<Object?> get props => [
        status,
        statusMessage,
        errorMessage,
        vacancyModel,
        vacancies,
        isSecond,
        vacanciesForFilter,
        partTimeVacancyCount,
        fullTimeVacancyCount,
        remoteVacancyCount,
        resentVacancies,
      ];
}
