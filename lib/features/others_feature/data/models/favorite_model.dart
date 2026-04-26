import '../../../course_feature/data/models/course_model.dart';
import '../../domain/entities/favorite.dart';

class FavoriteModel extends Favorite {
  FavoriteModel({
    required super.id,
    required super.webinar,
    required super.createdAt,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'].toString(),
      webinar: CourseModel.fromJson(json['webinar']),
      createdAt: int.tryParse(json['created_at'].toString()),
    );
  }
}
