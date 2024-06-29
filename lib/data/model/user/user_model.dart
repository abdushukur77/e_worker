class UserModel {
  final String username;
  final String phoneNumber;
  final String userId;
  final String authUid;

  UserModel({
    required this.phoneNumber,
    required this.userId,
    required this.username,
    required this.authUid,
  });

  UserModel copyWith({
    String? username,
    String? phoneNumber,
    String? userId,
    String? authUid,
    String? password,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      authUid: authUid ?? this.authUid,
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "phoneNumber": phoneNumber,
        "authUid": authUid,
      };

  Map<String, dynamic> toJsonForUpdate() => {
        "username": username,
        "phoneNumber": phoneNumber,
        "authUid": authUid,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phoneNumber: json["phoneNumber"] as String? ?? "",
      userId: json["userId"] as String? ?? "",
      username: json["username"] as String? ?? "",
      authUid: json["authUid"] as String? ?? "",
    );
  }

  static UserModel initial() => UserModel(
        phoneNumber: "",
        userId: "",
        username: "",
        authUid: "",
      );
}
