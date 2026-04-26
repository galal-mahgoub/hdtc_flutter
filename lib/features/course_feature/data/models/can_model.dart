import '../../domain/entities/can.dart';

class CanModel extends Can {
  const CanModel({
    required super.view,
  });

  factory CanModel.fromJson(Map<String, dynamic> json) {
    return CanModel(
      view: json['view'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'view': view,
    };
  }
}
