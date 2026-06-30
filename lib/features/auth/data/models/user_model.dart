class UserModel {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      role: json['role'] as String? ?? 'user',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'role': role,
    };
  }
}

class LoginResponse {
  final String status;
  final String message;
  final UserModel user;
  final String token;

  LoginResponse({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return LoginResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      user: UserModel.fromJson(data['user'] as Map<String, dynamic>),
      token: data['token'] as String,
    );
  }
}

class UsersListResponse {
  final String status;
  final List<UserModel> users;

  UsersListResponse({required this.status, required this.users});

  factory UsersListResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>;
    return UsersListResponse(
      status: json['status'] as String,
      users: data
          .map(
            (userJson) => UserModel.fromJson(userJson as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
