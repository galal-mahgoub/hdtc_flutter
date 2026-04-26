import 'package:equatable/equatable.dart';

class BlogCategory extends Equatable {
  final int id;
  final String title;

  const BlogCategory({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}
