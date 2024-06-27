import 'package:e_worker/bloc/places/search_event.dart';
import 'package:e_worker/bloc/places/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/local/place_data_base.dart';
import '../../data/model/all_data_model.dart';


class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryState(country: const [],district: const [])) {
    on<GetAllCountry>(getAllData);
    on<GetById>(getById);
  }

  List<DataModel> country = [];
  List<DataModel> district = [];

  getAllData(GetAllCountry event, emit) async {
    country = [
      ...await PlacesDatabase.instance.getAllRegions(),
    ];
    emit(state.copyWith(country: country));
  }

  getById(GetById event, emit)async{
    district=[
      ...await PlacesDatabase.instance.getAllDistricts(),
    ];
    emit(state.copyWith(
        district: district.where((e) => e.regionId==event.id).toList()
    ));
  }
}
