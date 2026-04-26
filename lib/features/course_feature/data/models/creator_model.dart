import '../../domain/entities/creatorrr.dart';

class CreatorModel extends Creator {
  CreatorModel({
    required super.id,
    required super.fullName,
    required super.avatar,
  });

  factory CreatorModel.fromJson(Map<String, dynamic> json) {
    return CreatorModel(
      id: json['id'].toString(),
      fullName: json['full_name'],
      avatar: json['avatar'],
    );
  }
}
