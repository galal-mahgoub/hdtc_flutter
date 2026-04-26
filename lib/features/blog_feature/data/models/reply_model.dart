import '../../domain/entities/reply.dart';
import 'user_model.dart' as u;

class ReplyModel extends Reply {
  const ReplyModel({
    required super.id,
    required super.commentUserType,
    required super.user,
    required super.createdAt,
    required super.comment,
  });

  factory ReplyModel.fromJson(Map<String, dynamic> json) {
    return ReplyModel(
      id: json['id'],
      commentUserType: json['comment_user_type'],
      user: u.UserModel.fromJson(json['user']),
      createdAt: int.parse(json['create_at'].toString()),
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comment_user_type': commentUserType,
      // 'user': (user as u.UserModel).toJson(),
      'create_at': createdAt,
      'comment': comment,
    };
  }
}