part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class RegisterUserEvent extends AuthEvent {
  final UserModel userModel;

  RegisterUserEvent({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class GetUserEvent extends AuthEvent{
  @override
  List<Object?> get props => [];
}

class UpdateUserEvent extends AuthEvent{

  final UserModel userModel;
  UpdateUserEvent({required this.userModel});

  @override
  List<Object?> get props => [];
}
