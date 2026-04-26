import 'package:equatable/equatable.dart';
import 'user.dart' as u;

class Reply extends Equatable {
  final int id;
  final String commentUserType;
  final u.User user;
  final int createdAt;
  final String comment;

  const Reply({
    required this.id,
    required this.commentUserType,
    required this.user,
    required this.createdAt,
    required this.comment,
  });

  @override
  List<Object?> get props => [id, commentUserType, user, createdAt, comment];
}