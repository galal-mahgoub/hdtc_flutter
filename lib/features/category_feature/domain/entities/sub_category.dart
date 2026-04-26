import 'package:equatable/equatable.dart';

class SubCategory extends Equatable {
  final int id;
  final String title;
  final String icon;
  final int webinarsCount;

  const SubCategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.webinarsCount,
  });

  @override
  List<Object?> get props => [id, title, icon, webinarsCount];
}
