import 'package:equatable/equatable.dart';

class Badge extends Equatable {
  final int id;
  final String title;
  final String image;
  final String description;
  final DateTime createdAt;

  const Badge({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        description,
        createdAt,
      ];
}
