import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/features/provider_feature/presentation/meeting/controllers/meeting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../domain/entities/reservation.dart';

class ReservedListItemWidget extends GetView<MeetingController> {
  const ReservedListItemWidget({
    super.key,
    required this.item,
  });

  final Meeting item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.toNamed(Routes.meetingDetails,
                arguments: {'meetingDetails': item})!
            .then((value) {
          controller.getMeetings();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          color: ColorManager.white,
        ),
        padding: const EdgeInsets.all(16).r,
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56.r,
                width: 56.r,
                child: ClipOval(
                  child: CustomImage(
                    path: item.user.avatar.isNotEmpty ? item.user.avatar : null,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.user.fullName,
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.black,
                            ),
                          ),
                        ),
                        4.horizontalSpace,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            color: item.status == 'finished'
                                ? context.theme.primaryColor
                                : ColorManager.yellow,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 4.r,
                            horizontal: 6.r,
                          ),
                          child: Text(
                            item.status.capitalizeFirst ?? '',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: ColorManager.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: ColorManager.grey4,
                                size: 15.sp,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                child: Text(
                                  DateFormat(
                                          'dd MMM yyyy',
                                          GetStorage().read<String>(
                                                  'language_code') ??
                                              'EN')
                                      .format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              int.parse(item.date) * 1000)),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 8.sp,
                                    color: ColorManager.grey1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                color: ColorManager.grey4,
                                size: 15.sp,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                child: Text(
                                  '${item.time.start} - ${item.time.end}',
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 8.sp,
                                    color: ColorManager.grey1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
