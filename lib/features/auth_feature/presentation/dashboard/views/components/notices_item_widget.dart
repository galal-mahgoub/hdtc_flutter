import 'package:flutter_html/flutter_html.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/quick_info.dart';

class NoticesItemWidget extends StatelessWidget {
  const NoticesItemWidget({
    super.key,
    required this.item,
  });

  final UnreadNoticeboard item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      margin: EdgeInsetsDirectional.symmetric(horizontal: 15.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            maxLines: 1,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
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
                      Icons.person,
                      color: ColorManager.grey4,
                      size: 15.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Text(
                        item.sender,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 9.sp,
                          color: ColorManager.grey4,
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
                                'dd MMM yyyy', Get.locale?.languageCode ?? 'EN')
                            .format(DateTime.fromMillisecondsSinceEpoch(
                                int.parse(item.createdAt) * 1000)),
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 9.sp,
                          color: ColorManager.grey4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          const Divider(
            height: 1,
            color: ColorManager.grey13,
          ),
          SizedBox(
            height: 10.h,
          ),
          Html(
            data: item.message,
            style: {
              // Add any custom styles here
              "body": Style(
                fontSize: FontSize(12.sp),
                color: ColorManager.grey4,
              ),
            },
          )
        ],
      ),
    );
  }
}
