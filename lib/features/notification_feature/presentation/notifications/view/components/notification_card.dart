import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/notification.dart' as n;
import 'notification_bottom_sheet.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
  });

  final n.Notification notification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      onTap: () {
        // if (notification.status != 'read') {
        //   Get.find<NotificationController>().seenNotification(notification.id);
        // }

        Get.bottomSheet(
          NotificationDetailsBottomSheet(notification: notification),
          backgroundColor: Colors.transparent,
          enableDrag: false,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 12.r),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    color: ColorManager.green4),
                padding: EdgeInsetsDirectional.all(10.r),
                child: Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: ColorManager.grey13,
                      size: 25.sp,
                    ),
                    if (notification.status == "unread")
                      Icon(
                        Icons.circle,
                        color: ColorManager.red,
                        size: 10.sp,
                      ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.title,
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      DateFormat(
                              'dd MMM yyyy', Get.locale?.languageCode ?? 'EN')
                          .format(
                        DateTime.fromMillisecondsSinceEpoch(
                          int.parse(notification.createdAt) * 1000,
                        ),
                      ),
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13.sp,
                        color: ColorManager.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
