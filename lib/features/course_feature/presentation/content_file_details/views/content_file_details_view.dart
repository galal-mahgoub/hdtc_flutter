import 'package:hdtc_on/core/routes/app_pages.dart';
import 'package:hdtc_on/core/services/video_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_back_btn.dart';
import 'package:hdtc_on/core/widgets/custom_loading.dart';
import 'package:hdtc_on/features/video_feature/domain/entities/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/custom_video_player.dart';
import '../../../../../core/widgets/text_wrapper.dart';
import '../../course_details/controller/courses_details_controller.dart';
import '../controllers/content_files_details_controller.dart';

class ContentFilesDetailsView extends StatelessWidget {
  const ContentFilesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContentFilesController>(
      builder: (controller) {
        return PopScope(
          onPopInvoked: (value) async {
            if (controller.isEdited) {
              await Future.wait([
                CoursesDetailsController.to.getCourseDetails(),
                CoursesDetailsController.to.getCourseContent(),
              ]);
            }
          },
          child: Scaffold(
            backgroundColor: ColorManager.white13,
            appBar: AppBar(
              backgroundColor: ColorManager.white13,
              centerTitle: true,
              title: Text(
                controller.course?.title ?? '',
                style: TextManager.font16Text300W600,
              ),
              leadingWidth: 80,
              leading: const CustomBackBtn(),
            ),
            body: CustomLoading(
              widget: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16).r,
                      children: [
                        Text(
                          controller.itemContentDetails?.title ?? '',
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          controller.course?.title ?? '',
                          style: TextStyle(
                              color: ColorManager.grey5, fontSize: 11.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Column(
                          children: [
                            controller.itemContentDetails == null
                                ? controller.load
                                    ? Center(
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: context.theme.primaryColor,
                                          ),
                                        ),
                                      )
                                    : const SizedBox()
                                : controller.itemContentDetails!.fileType ==
                                        'pdf'
                                    ? const SizedBox()
                                    : CustomVideoPlayer(
                                        videoDemo:
                                            controller.itemContentDetails!.file,
                                        videoDemoSource: controller
                                            .itemContentDetails!.storage,
                                      ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: ColorManager.grey2,
                                        radius: 17.r,
                                        child: Icon(
                                          Icons.access_time_filled,
                                          color: ColorManager.grey9,
                                          size: 18.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Downloadable'.tr,
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: ColorManager.grey9,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Text(
                                            controller.itemContentDetails!
                                                        .downloadable ==
                                                    '0'
                                                ? 'No'.tr
                                                : 'Yes'.tr,
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: ColorManager.grey2,
                                        radius: 17.r,
                                        child: Icon(
                                          Icons.download,
                                          color: ColorManager.grey9,
                                          size: 18.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Volume'.tr,
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: ColorManager.grey9,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Text(
                                            controller
                                                .itemContentDetails!.volume,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: ColorManager.grey2,
                                  radius: 17.r,
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: ColorManager.grey9,
                                    size: 18.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PublicDate'.tr,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: ColorManager.grey9,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      DateFormat(
                                              'dd MMM yyyy',
                                              GetStorage().read<String>(
                                                      'language_code') ??
                                                  'EN')
                                          .format(DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  (int.tryParse(controller
                                                              .itemContentDetails!
                                                              .createdAt
                                                              .toString()) ??
                                                          0) *
                                                      1000)),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.black,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        if (controller.itemContentDetails!.description != null)
                          TextWrapper(
                            text: controller.itemContentDetails!.description ??
                                '',
                          ),
                        SizedBox(
                          height:
                              controller.itemContentDetails!.description != null
                                  ? 10.h
                                  : 0,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        if ((controller.item?.can?.view ?? false))
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'ReadLesson'.tr,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: ColorManager.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              // Get.find<DioController>().isLoading(task: 'readLesson') ||
                              //         Get.find<DioController>()
                              //             .isLoading(task: 'getContent') ||
                              //         Get.find<DioController>()
                              //             .isLoading(task: 'getCoursesDetails')
                              //     ? const Center(
                              //         child: CircularProgressIndicator(
                              //           color: context.theme.primaryColor,
                              //         ),
                              //       )
                              //     :
                              CupertinoSwitch(
                                value: controller.item!.authHasRead,
                                onChanged: (value) =>
                                    controller.readLesson(value),
                                activeColor: context.theme.primaryColor,
                                trackColor: ColorManager.grey1,
                                thumbColor: ColorManager.white,
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                  if (controller.itemContentDetails!.downloadable == '1')
                    Obx(
                      () {
                        Video? video =
                            VideoService.to.videos.value.firstWhereOrNull(
                          (video) =>
                              video.itemId.value ==
                              controller.item!.id.toString(),
                        );
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.r, vertical: 10.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.r),
                                topLeft: Radius.circular(15.r)),
                            color: ColorManager.white,
                          ),
                          child: Column(
                            children: [
                              if ((video?.taskInfo.value.progress.value ?? 0) >
                                      0 &&
                                  video?.taskInfo.value.status.value !=
                                      DownloadTaskStatus.complete) ...[
                                LinearProgressIndicator(
                                  color: context.theme.primaryColor,
                                  backgroundColor: context.theme.primaryColor
                                      .withOpacity(.2),
                                  value:
                                      (video?.taskInfo.value.progress.value ??
                                              0) /
                                          100,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                              ButtonWidget(
                                isLoading: controller.isDownloadLoading,
                                colorBtn: UserService.to.isKsa.value
                                    ? Colors.green[400]
                                    : ColorManager.green,
                                colorBackground: UserService.to.isKsa.value
                                    ? Colors.green[400]
                                    : ColorManager.green,
                                colorBorder: UserService.to.isKsa.value
                                    ? Colors.green[400]
                                    : ColorManager.green,
                                text: Text(
                                  (video?.taskInfo.value.progress.value ?? 0) <=
                                          0
                                      ? 'Download'.tr
                                      : 'GoDownload'.tr,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: ColorManager.white),
                                ),
                                onPressed: () {
                                  if ((video?.taskInfo.value.progress.value ??
                                          0) <=
                                      0) {
                                    controller.downloadVideos(
                                      controller.itemContentDetails!,
                                      controller.course!.title,
                                      controller.course!.id.toString(),
                                    );
                                  } else {
                                    Get.toNamed(Routes.videos);
                                  }
                                },
                                width: 1.sw,
                                paddingHorizontal: 10,
                                paddingVertical: 10,
                                marginHorizontal: 5,
                                radius: 15,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                ],
              ),
              isLoading: controller.isLoading,
            ),
          ),
        );
      },
    );
  }
}
