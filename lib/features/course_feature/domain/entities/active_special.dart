import 'package:equatable/equatable.dart';

class ActiveSpecialOffer extends Equatable {
  final int? id;
  final int? creatorId;
  final int? webinarId;
  final String? name;
  final int? percent;
  final String? status;
  final int? createdAt;
  final int? fromDate;
  final int? toDate;

  const ActiveSpecialOffer({
    this.id,
    this.creatorId,
    this.webinarId,
    this.name,
    this.percent,
    this.status,
    this.createdAt,
    this.fromDate,
    this.toDate,
  });

  @override
  List<Object?> get props => [
        id,
        creatorId,
        webinarId,
        name,
        percent,
        status,
        createdAt,
        fromDate,
        toDate,
      ];
}
