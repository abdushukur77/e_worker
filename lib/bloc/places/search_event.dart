

import 'package:equatable/equatable.dart';

class CountryEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class GetAllCountry extends CountryEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class GetById extends CountryEvent{
  final int id;
  GetById({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props =>[id];
}
