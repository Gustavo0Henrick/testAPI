import 'dart:convert';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? job_title;
  String? created_at;
  String? updated_at;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.job_title,
    this.created_at,
    this.updated_at,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'job_title': job_title,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      job_title: map['job_title'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
