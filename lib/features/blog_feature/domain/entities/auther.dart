import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final int id;
  final String fullName;
  final String roleName;
  final String avatar;

  const Author({
    required this.id,
    required this.fullName,
    required this.roleName,
    required this.avatar,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      fullName: json['full_name'],
      roleName: json['role_name'],
      avatar: json['avatar'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        roleName,
        avatar,
      ];
}
