part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final UserModel userModel;

  const AuthState({
    required this.errorMessage,
    required this.statusMessage,
    required this.userModel,
  });

  AuthState copyWith({
    String? errorMessage,
    String? statusMessage,
    UserModel? userModel,
  }) {
    return AuthState(
      statusMessage: statusMessage ?? this.statusMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      userModel: userModel ?? this.userModel,
    );
  }

  factory AuthState.init() {
    return AuthState(
      statusMessage: '',
      errorMessage: '',
      userModel: UserModel.initial(),
    );
  }

  @override
  List<Object?> get props => [
        statusMessage,
        errorMessage,
        userModel,
      ];
}
