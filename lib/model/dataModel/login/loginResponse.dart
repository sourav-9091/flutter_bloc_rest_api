import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final BackendTokens backendTokens;
  final User user;
  final String message;
  final bool success;
  const LoginResponse({
    required this.backendTokens,
    required this.user,
    required this.message,
    required this.success,
  });

factory LoginResponse.withError(String error) {
  return LoginResponse(
    backendTokens: BackendTokens(
      token: '',
      refreshToken: '',
      expiresIn: 0,
    ),
    user: User(
      id: '',
      name: '',
      email: '',
      password: '',
      role: '',
      verified: false,
      face: false,
      deleted: false,
      createdAt: '',
      updatedAt: '',
      v: 0,
    ),
    message: error,
    success: false,
  );
}

factory LoginResponse.withVerification(LoginResponse loginResponse) {
  return LoginResponse(
    backendTokens: BackendTokens(
      token: loginResponse.backendTokens.token,
      refreshToken: loginResponse.backendTokens.refreshToken,
      expiresIn: loginResponse.backendTokens.expiresIn,
    ),
    user: User(
      id: loginResponse.user.id,
      name: loginResponse.user.name,
      email: loginResponse.user.email,
      password: loginResponse.user.password,
      role: loginResponse.user.role,
      verified: true,
      face: loginResponse.user.face,
      deleted: loginResponse.user.deleted,
      createdAt: loginResponse.user.createdAt,
      updatedAt: loginResponse.user.updatedAt,
      v: loginResponse.user.v,
    ),
    message: loginResponse.message,
    success: loginResponse.success,
  );
}

factory LoginResponse.withNewAccessToken(LoginResponse loginResponse, String accessToken, String refreshToken) {
  return LoginResponse(
    backendTokens: BackendTokens(
      token: accessToken,
      refreshToken: refreshToken,
      expiresIn: loginResponse.backendTokens.expiresIn,
    ),
    user: User(
      id: loginResponse.user.id,
      name: loginResponse.user.name,
      email: loginResponse.user.email,
      password: loginResponse.user.password,
      role: loginResponse.user.role,
      verified: true,
      face: loginResponse.user.face,
      deleted: loginResponse.user.deleted,
      createdAt: loginResponse.user.createdAt,
      updatedAt: loginResponse.user.updatedAt,
      v: loginResponse.user.v,
    ),
    message: loginResponse.message,
    success: loginResponse.success,
  );
}

  LoginResponse copyWith({
    BackendTokens? backendTokens,
    User? user,
    String? message,
    bool? success,
  }) {
    return LoginResponse(
      backendTokens: backendTokens ?? this.backendTokens,
      user: user ?? this.user,
      message: message ?? this.message,
      success: success ?? this.success,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'backendTokens': backendTokens.toMap(),
      'user': user.toMap(),
      'message': message,
      'success': success,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      backendTokens: BackendTokens.fromMap(map['backendTokens']),
      user: User.fromMap(map['user']),
      message: map['message'] ?? '',
      success: map['success'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(backendTokens: $backendTokens, user: $user, message: $message, success: $success)';
  }

  @override
  List<Object> get props => [backendTokens, user, message, success];
}

class BackendTokens extends Equatable {
  final String token;
  final String refreshToken;
  final int expiresIn;
  BackendTokens({
    required this.token,
    required this.refreshToken,
    required this.expiresIn,
  });

  BackendTokens copyWith({
    String? token,
    String? refreshToken,
    int? expiresIn,
  }) {
    return BackendTokens(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresIn: expiresIn ?? this.expiresIn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
    };
  }

  factory BackendTokens.fromMap(Map<String, dynamic> map) {
    return BackendTokens(
      token: map['token'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      expiresIn: map['expiresIn']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BackendTokens.fromJson(String source) => BackendTokens.fromMap(json.decode(source));

  @override
  String toString() => 'BackendTokens(token: $token, refreshToken: $refreshToken, expiresIn: $expiresIn)';

  @override
  List<Object> get props => [token, refreshToken, expiresIn];
}

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final String role;
  final bool verified;
  final bool face;
  final bool deleted;
  final String createdAt;
  final String updatedAt;
  final int v;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.verified,
    required this.face,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? role,
    bool? verified,
    bool? face,
    bool? deleted,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      verified: verified ?? this.verified,
      face: face ?? this.face,
      deleted: deleted ?? this.deleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'verified': verified,
      'face': face,
      'deleted': deleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? '',
      verified: map['verified'] ?? false,
      face: map['face'] ?? false,
      deleted: map['deleted'] ?? false,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      v: map['__v']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(_id: $id, name: $name, email: $email, password: $password, role: $role, verified: $verified, face: $face, deleted: $deleted, createdAt: $createdAt, updatedAt: $updatedAt, __v: $v)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      password,
      role,
      verified,
      face,
      deleted,
      createdAt,
      updatedAt,
      v,
    ];
  }
}