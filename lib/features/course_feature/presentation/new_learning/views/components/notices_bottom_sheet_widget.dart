import 'package:flutter_html/flutter_html.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../../../domain/entities/notice.dart';

class NoticesBottomSheetCustom extends StatelessWidget {
  const NoticesBottomSheetCustom({required this.notice, super.key});

  final Notice notice;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 15.r,
        ),
        child: Container(
          width: 1.sw,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Important notice'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                color: ColorManager.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.r),
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                border: Border.all(
                  color: ColorManager.grey2,
                  // Set the color of the border
                  width: 1.0, // Set the width of the border
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 40.r,
                    width: 40.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(80.r)),
                      child: CustomImage(
                        path: notice.creator.avatar.isNotEmpty
                            ? notice.creator.avatar
                            : null,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Posted by'.tr,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.grey9,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                notice.creator.fullName,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          DateFormat('dd MMM yyyy',
                                  Get.locale?.languageCode ?? 'EN')
                              .format(DateTime.fromMillisecondsSinceEpoch(
                                  notice.createdAt * 1000)),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 8.sp,
                            color: ColorManager.grey1,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Html(
              data: notice.message,
              style: {
                // Add any custom styles here
                "body": Style(
                  fontSize: FontSize(12.sp),
                  color: ColorManager.grey4,
                ),
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            ButtonWidget(
              colorBtn: UserService.to.isKsa.value
                  ? Colors.green[400]
                  : ColorManager.green,
              text: Text(
                'Close'.tr,
                style: TextStyle(fontSize: 15.sp, color: ColorManager.white),
              ),
              onPressed: () {
                Get.back();
              },
              width: 1.sw,
              paddingHorizontal: 10,
              paddingVertical: 10,
              marginHorizontal: 5,
              radius: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
