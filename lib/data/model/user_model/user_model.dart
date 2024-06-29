class UserModel {
  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });


  final String userId;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? userId,
    String? phoneNumber
  }) =>
      UserModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        userId: userId ?? this.userId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json["first_name"] as String? ?? "",
      lastName: json["last_name"] as String? ?? "",
      phoneNumber: json["phone_number"] as String? ?? "",
      userId:json["user_id"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phoneNumber,
    };
  }

  static UserModel initial() => UserModel(
        userId: "",
        firstName: '',
        lastName: '',
        phoneNumber: '',
      );
}
