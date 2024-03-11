import 'dart:convert';

import 'package:equatable/equatable.dart';

class KiitForm extends Equatable {
  List<KiitForm> data;
  String error;
  KiitForm({
    required this.data,
    required this.error,
  });

  factory KiitForm.withError(String error) {
    return KiitForm(data: [], error: error);
  }

  KiitForm copyWith({
    List<KiitForm>? data,
    String? error,
  }) {
    return KiitForm(
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'error': error,
    };
  }

  factory KiitForm.fromMap(Map<String, dynamic> map) {
    return KiitForm(
      data: List<KiitForm>.from(map['data']?.map((x) => KiitForm.fromMap(x))),
      error: map['error'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory KiitForm.fromJson(String source) =>
      KiitForm.fromMap(json.decode(source));

  @override
  String toString() => 'KiitForm(data: $data, error: $error)';

  @override
  List<Object> get props => [data, error];
}

class KiitFormData extends Equatable {
  int userId;
  int id;
  String title;
  String body;
  KiitFormData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory KiitFormData.withError() {
    return KiitFormData(userId: -1, id: -1, title: "null", body: "null");
  }

  KiitFormData copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return KiitFormData(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  String toString() {
    return 'KiitFormData(userId: $userId, id: $id, title: $title, body: $body)';
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory KiitFormData.fromMap(Map<String, dynamic> map) {
    return KiitFormData(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory KiitFormData.fromJson(String source) =>
      KiitFormData.fromMap(json.decode(source));

  @override
  List<Object> get props => [userId, id, title, body];
}
