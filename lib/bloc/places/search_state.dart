
import 'package:equatable/equatable.dart';

import '../../data/model/all_data_model.dart';


class CountryState extends Equatable{

  List<DataModel> country;
  List<DataModel> district;
  CountryState({required this.country,required this.district});

  CountryState copyWith({
    List<DataModel>? country,
    List<DataModel>? district,
}){
    return CountryState(country:country ?? this.country,district: district ?? this.district);
  }
  @override
  // TODO: implement props
  List<Object?> get props =>[
    country,
    district
  ];

}