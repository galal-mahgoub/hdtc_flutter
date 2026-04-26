import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../controller/courses_details_controller.dart';
import 'add_comment_bottom_sheet_widget.dart';

class CommentOptionBottomSheetCustom extends StatelessWidget {
  const CommentOptionBottomSheetCustom({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(
            top: 15.r,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Get.back(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsetsDirectional.only(end: 10.r),
                        padding: EdgeInsets.all(15.r),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.all(Radius.circular(13.r)),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 22.sp,
                          color: ColorManager.black,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 1.sw,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'CommentOptions'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () async {
                            if (UserService.to.currentUser.value != null) {
                              controller.messageCommentController.text = '';

                              Get.bottomSheet(
                                AddCommentBottomSheetCustom(
                                  id: id,
                                  type: 'reply',
                                ),
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                              );
                            } else {
                              await Get.toNamed(Routes.login);
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.send,
                                size: 18.sp,
                                color: ColorManager.black6,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Reply'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: ColorManager.black6,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () async {
                            if (UserService.to.currentUser.value != null) {
                              controller.messageCommentController.text = '';

                              Get.bottomSheet(
                                AddCommentBottomSheetCustom(
                                  id: id,
                                  type: 'report',
                                ),
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                              );
                            } else {
                              await Get.toNamed(Routes.login);
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.report_gmailerrorred,
                                size: 18.sp,
                                color: ColorManager.black6,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Report'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: ColorManager.black6,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ]),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
