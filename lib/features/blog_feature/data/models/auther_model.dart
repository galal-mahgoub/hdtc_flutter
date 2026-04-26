import '../../domain/entities/auther.dart';

class AuthorModel extends Author {
  const AuthorModel({
    required super.id,
    required super.fullName,
    required super.roleName,
    required super.avatar,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'],
      fullName: json['full_name'],
      roleName: json['role_name'],
      avatar: json['avatar'],
    );
  }
}
