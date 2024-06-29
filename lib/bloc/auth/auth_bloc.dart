import 'package:e_worker/data/model/network_response.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/user/user_model.dart';
import '../../data/repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(AuthState.init()) {
    on<RegisterUserEvent>(addUser);
  }


  final AuthRepository authRepository;

  addUser(RegisterUserEvent event,emit)async{
    NetworkResponse networkResponse=await authRepository.addUser(event.userModel);
    if(networkResponse.errorText.isEmpty){
      emit(state.copyWith(userModel:networkResponse.data));
    }
    else
    {
      emit(state.copyWith(errorMessage:"Error"));
    }
  }
}
