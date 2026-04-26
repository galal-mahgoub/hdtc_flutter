import 'package:flutter_html/flutter_html.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../../../domain/entities/notification.dart' as n;

class NotificationDetailsBottomSheet extends StatelessWidget {
  const NotificationDetailsBottomSheet({
    super.key,
    required this.notification,
  });

  final n.Notification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      padding: EdgeInsets.all(15.r),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              DateFormat('dd MMM yyyy', Get.locale?.languageCode ?? 'EN')
                  .format(DateTime.fromMillisecondsSinceEpoch(
                      int.parse(notification.createdAt) * 1000)),
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 13.sp,
                color: ColorManager.grey,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              height: 1,
              color: ColorManager.grey13,
            ),
            SizedBox(
              height: 10.h,
            ),
            LimitedBox(
              maxHeight: 10 * (13.sp + 5.h), // Height for three lines of text
              child: SingleChildScrollView(
                child: Html(
                  data: notification.message,
                  style: {
                    // Add any custom styles here
                    "body": Style(
                      fontSize: FontSize(12.sp),
                      color: ColorManager.grey4,
                    ),
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ButtonWidget(
              width: 1.sw,
              colorBtn: UserService.to.isKsa.value
                  ? Colors.green[400]
                  : ColorManager.green,
              text: Text(
                'Close'.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.white,
                ),
              ),
              onPressed: () => Get.back(),
              paddingVertical: 5,
              paddingHorizontal: 10,
              radius: 60,
            ),
          ],
        ),
      ),
    );
  }
}
