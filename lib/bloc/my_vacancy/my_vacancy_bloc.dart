import 'package:e_worker/bloc/my_vacancy/my_vacancy_event.dart';
import 'package:e_worker/bloc/my_vacancy/my_vacancy_state.dart';
import 'package:e_worker/data/model/network_response.dart';
import 'package:e_worker/data/repository/my_vacancy_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/forms_status.dart';
import '../../data/model/vacancy/vacancy_model.dart';

class MyVacancyBloc extends Bloc<MyVacancyEvent, MyVacancyState> {
  MyVacancyBloc({required this.myVacancyRepository})
      : super(MyVacancyState.initialValue()) {
    on<MyAddVacancyEvent>(_insertVacancy);
    on<ChangeToInitialEvent>(_changeToInitialState);
    on<MyGetVacancyEvent>(_getVacancy);
  }

  final MyVacancyRepository myVacancyRepository;

  _changeToInitialState(ChangeToInitialEvent event, emit) {
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

  _getVacancy(MyGetVacancyEvent event,emit)async{
    emit(state.copyWith(status: FormsStatus.loading,statusMessage: ""));
    debugPrint("${myVacancyRepository.getAllVacancies().first}");
    emit(state.copyWith(vacancies: (await myVacancyRepository.getAllVacancies().first).where((element) => element.userId==event.userId).toList(),status: FormsStatus.success));

  }

  _insertVacancy(MyAddVacancyEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading, statusMessage: ""));
    NetworkResponse networkResponse =
        await myVacancyRepository.addMyVacancy(event.vacancyModel);
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

}
