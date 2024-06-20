import 'package:e_worker/bloc/vacancy/vacancy_event.dart';
import 'package:e_worker/bloc/vacancy/vacancy_state.dart';
import 'package:e_worker/data/model/network_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/forms_status.dart';
import '../../data/model/vacancy/vacancy_model.dart';
import '../../data/repository/vacancy_repository.dart';
import '../../utils/utility/utility_functions.dart';

class VacancyBloc extends Bloc<VacancyEvent, VacancyState> {
  VacancyBloc({required this.vacancyRepository})
      : super(VacancyState.initialValue()) {
    on<AddVacancyEvent>(_insertVacancy);
    on<DeleteVacancyEvent>(_deleteVacancy);
    on<UpdateVacancyEvent>(_updateVacancy);
    on<UpdateVacancyFieldEvent>(_updateField);
    on<GetVacancyEvent>(_getVacancy);
    on<ChangePhoneStateEvent>(_updatePhoneState);
    on<GetVacanciesByCategoryId>(_getVacanciesByCategoryId);
    on<GetVacanciesBySubCategoryId>(_getVacanciesBySubCategoryId);
    on<ChangeToInitialState>(_changeToInitialState);
  }

  final VacancyRepository vacancyRepository;

  _changeToInitialState(ChangeToInitialState event, emit) {
    emit(state.copyWith(
      vacancyModel: VacancyModel.initial(),
      status: FormsStatus.pure,
      statusMessage: '',
      errorMessage: '',
      isSecond: false,
      vacancies: const [],
      vacanciesForFilter: const [],
    ));
  }

  Future<void> _getVacanciesByCategoryId(
      GetVacanciesByCategoryId event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse response =
        await vacancyRepository.getVacanciesByCategoryId(event.categoryId);

    if (response.errorText.isEmpty) {
      List<VacancyModel> vacancies = response.data as List<VacancyModel>;
      emit(state.copyWith(vacancies: vacancies, status: FormsStatus.success));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, errorMessage: response.errorText));
    }
  }

  Future<void> _getVacanciesBySubCategoryId(
      GetVacanciesBySubCategoryId event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse response = await vacancyRepository
        .getVacanciesBySubCategoryId(event.subCategoryId);

    if (response.errorText.isEmpty) {
      List<VacancyModel> vacancies = response.data as List<VacancyModel>;
      emit(state.copyWith(vacancies: vacancies, status: FormsStatus.success));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, errorMessage: response.errorText));
    }
  }

  // void _getVacancyForFilter(GetVacancyForFilterEvent event, emit) {
  //   emit(
  //     state.copyWith(
  //         vacanciesForFilter: state.vacancies.where(
  //       (vacancies) {
  //         return vacancies.subCategoryId == event.filterModel.subCategoryId;
  //       },
  //     ).toList()),
  //   );
  // }

  _updatePhoneState(ChangePhoneStateEvent event, emit) {
    emit(
      state.copyWith(
        isSecond: event.isSecondPhone,
      ),
    );
    UtilityFunctions.methodPrint(
      'CURRENT PHONE STATE IS: ${event.isSecondPhone}',
    );
  }

  _insertVacancy(AddVacancyEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading, statusMessage: ""));
    NetworkResponse networkResponse =
        await vacancyRepository.addVacancy(state.vacancyModel);
    if (networkResponse.errorText.isEmpty) {
      VacancyModel vacancyModel = networkResponse.data as VacancyModel;

      emit(state.copyWith(
          status: FormsStatus.success,
          vacancyModel: vacancyModel,
          statusMessage: "added_vacancy"));
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  _deleteVacancy(DeleteVacancyEvent event, emit) async {
    emit(FormsStatus.loading);

    NetworkResponse networkResponse =
        (await vacancyRepository.deleteVacancy(state.vacancyModel.vacancyId));

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          vacancyModel: VacancyModel.initial(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  _updateVacancy(UpdateVacancyEvent event, emit) async {
    emit(FormsStatus.loading);
    NetworkResponse networkResponse =
        await vacancyRepository.updateVacancy(state.vacancyModel);
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsStatus.success));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, errorMessage: networkResponse.errorText));
    }
  }

  _updateField(UpdateVacancyFieldEvent event, Emitter<VacancyState> emit) {
    VacancyModel vacancyModel = VacancyModel.initial();
    switch (event.field) {
      case VacancyField.vacancyId:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel = vacancyModel.copyWith(vacancyId: event.value as String);
        break;
      case VacancyField.brandImage:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel =
            vacancyModel.copyWith(brandImage: event.value as List<String>);
        break;
      case VacancyField.categoryId:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel = vacancyModel.copyWith(categoryId: event.value as String);
        break;
      case VacancyField.userId:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel = vacancyModel.copyWith(userId: event.value as String);
        break;
      case VacancyField.createdAt:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel = vacancyModel.copyWith(createdAt: event.value);
        break;
      case VacancyField.jobTitle:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel = vacancyModel.copyWith(jobTitle: event.value as String);
        break;

      case VacancyField.description:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel =
            vacancyModel.copyWith(description: event.value as String);
        break;

      case VacancyField.recruiterPhone:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel = vacancyModel.copyWith(phone: event.value as String);
        break;

      case VacancyField.isValid:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel = vacancyModel.copyWith(isValid: event.value as bool);
        break;
      case VacancyField.subCategoryId:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel =
            vacancyModel.copyWith(subCategoryId: event.value as String);
        break;
      case VacancyField.position:
        UtilityFunctions.methodPrint(
          "UPDATED VACANCY FIELD IS: ${event.field}, VALUE IS: ${event.value}",
        );
        vacancyModel = vacancyModel.copyWith(position: event.value as String);
        break;
    }

    emit(state.copyWith(vacancyModel: vacancyModel));
  }

  _getVacancy(GetVacancyEvent event, Emitter<VacancyState> emit) async {
    // await emit.onEach(
    //   vacancyRepository.getAllVacancies(),
    //   onData: (List<VacancyModel> vacancyList) {
    //     int remoteVacancyCount = 0;
    //     int fullTimeVacancyCount = 0;
    //     int partTimeVacancyCount = 0;
    //     List<VacancyModel> recentVacancies = [];
    //
    //     for (var vacancy in vacancyList) {
    //       if (vacancy.jobType == 0) {
    //         remoteVacancyCount++;
    //       } else if (vacancy.jobType == 1) {
    //         fullTimeVacancyCount++;
    //       } else if (vacancy.jobType == 2) {
    //         partTimeVacancyCount++;
    //       }
    //
    //       if (DateTime.parse(vacancy.createdAt).formattedDate == DateTime.now().formattedDate) {
    //         recentVacancies.add(vacancy);
    //       }
    //     }
    //
    //     recentVacancies.sort((a, b) => DateTime.parse(b.createdAt).compareTo(DateTime.parse(a.createdAt)));
    //
    //     emit(state.copyWith(
    //       vacancies: vacancyList,
    //       remoteVacancyCount: remoteVacancyCount,
    //       fullTimeVacancyCount: fullTimeVacancyCount,
    //       partTimeVacancyCount: partTimeVacancyCount,
    //       resentVacancies: recentVacancies,
    //     ));
    //   },
    // );
    // }
  }
}
