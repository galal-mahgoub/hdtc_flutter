import '../../domain/entities/country.dart';

class CountryModel extends Country {
  const CountryModel({
    required super.id,
    required super.type,
    required super.title,
    required super.createdAt,
  });
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'].toString(),
      type: json['type'],
      title: json['title'],
      createdAt: int.parse(json['created_at'].toString()),
    );
  }
}
