import 'package:equatable/equatable.dart';

import 'subscribe.dart';

class SubscriptionRespone extends Equatable {
  final List<Subscription> subscribes;
  final bool subscribed;
  final double subscribePrice;
  final int? subscribeId;
  final int scheduleSubscribeId;
  final String? subscribedTitle;
  final int? remainedDownloads;
  final int? daysRemained;
  final int dayOfUse;

  const SubscriptionRespone({
    required this.subscribes,
    required this.subscribed,
    required this.subscribePrice,
    required this.subscribeId,
    required this.scheduleSubscribeId,
    required this.subscribedTitle,
    required this.remainedDownloads,
    required this.daysRemained,
    required this.dayOfUse,
  });

  @override
  List<Object?> get props {
    return [
      subscribes,
      subscribed,
      subscribePrice,
      subscribeId,
      scheduleSubscribeId,
      subscribedTitle,
      remainedDownloads,
      daysRemained,
      dayOfUse,
    ];
  }
}
