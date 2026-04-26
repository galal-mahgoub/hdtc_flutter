import '../../domain/entities/tag.dart';

class TagModel extends Tag {
  const TagModel({
    required super.id,
    required super.title,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
