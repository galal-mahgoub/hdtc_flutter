import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/core/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../controllers/instructor_details_controller.dart';

class InstructorAppBar extends StatelessWidget {
  const InstructorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstructorDetailsController>(
      builder: (controller) {
        return Column(
          children: [
            Stack(
              alignment: controller.provider!.verified
                  ? AlignmentDirectional.topEnd
                  : AlignmentDirectional.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(55.r)),
                  child: CustomImage(
                    path: controller.provider!.avatar.isNotEmpty
                        ? controller.provider!.avatar
                        : null,
                    width: 80.r,
                    height: 80.r,
                    fit: BoxFit.fill,
                  ),
                ),
                if (controller.provider!.verified)
                  Container(
                    width: 20.w,
                    height: 20.w,
                    margin: EdgeInsets.only(top: 5.r),
                    decoration: const BoxDecoration(
                      color: ColorManager.blue1,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.done,
                      size: 15.sp,
                      color: ColorManager.white,
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              controller.provider!.fullName,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.black,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomRatingBar(value: controller.provider!.rate),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.provider!.roleName == 'teacher') ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: const BoxDecoration(
                          color: ColorManager.lightgreen3,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.video_call,
                          color: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                          size: 25.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 70.w,
                        child: Text(
                          controller.provider!.courses.length.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Courses'.tr,
                        style: TextStyle(
                            fontSize: 10.sp, color: ColorManager.grey1),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: ColorManager.blue5.withOpacity(.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        color: ColorManager.blue5,
                        size: 25.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 70.w,
                      child: Text(
                        controller.provider!.studentsCount.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Students'.tr,
                      style:
                          TextStyle(fontSize: 10.sp, color: ColorManager.grey1),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: ColorManager.yellow2.withOpacity(.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.groups_rounded,
                        color: ColorManager.yellow2,
                        size: 25.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 70.w,
                      child: Text(
                        controller.provider!.followersCount.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Followers'.tr,
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 10.sp,
                          color: ColorManager.grey1),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
          ],
        );
      },
    );
  }
}
