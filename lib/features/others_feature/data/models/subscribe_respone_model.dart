import '../../domain/entities/subscribe_respone.dart';
import 'subscribe_model.dart';

class SubscriptionResponeModel extends SubscriptionRespone {
  const SubscriptionResponeModel({
    required super.subscribes,
    required super.subscribed,
    required super.subscribePrice,
    required super.subscribeId,
    required super.scheduleSubscribeId,
    required super.subscribedTitle,
    required super.remainedDownloads,
    required super.daysRemained,
    required super.dayOfUse,
  });

  factory SubscriptionResponeModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionResponeModel(
      subscribes: List.from(json['subscribes'])
          .map((e) => SubscriptionModel.fromJson(e))
          .toList(),
      subscribed: json['subscribed'],
      subscribePrice: double.parse(json['subscribe_price']?.toString() ?? '0'),
      subscribeId: json['subscribe_id'],
      scheduleSubscribeId: json['schedule_subscribe_id'] ?? 0,
      subscribedTitle: json['subscribed_title'],
      remainedDownloads: json['remained_downloads'],
      daysRemained: json['days_remained'],
      dayOfUse: json['dayOfUse'],
    );
  }
}
