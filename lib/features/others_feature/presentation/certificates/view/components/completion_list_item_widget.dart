import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../domain/entities/certificate.dart';

class CompletionListItemWidget extends StatelessWidget {
  const CompletionListItemWidget({
    super.key,
    required this.item,
  });

  final Certificate item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.certificateDetails,
          arguments: {
            'title': item.webinar!.title,
            'description': item.webinar!.description,
            'image': item.webinar!.image,
            'date': item.date.toString(),
            'certificateId': item.id.toString(),
            'link': item.link.toString(),
            'type': 'completion',
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          color: ColorManager.white,
        ),
        padding: const EdgeInsets.all(8).r,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70.h,
              width: 80.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CustomImage(
                  path: item.webinar?.image != null &&
                          item.webinar!.image.isNotEmpty
                      ? item.webinar!.image
                      : null,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.webinar?.title ?? '',
                    maxLines: 2,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black,
                    ),
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
                                    .format(DateTime.fromMillisecondsSinceEpoch(
                                        item.date * 1000)),
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 8.sp,
                                  color: ColorManager.grey5,
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
    );
  }
}
