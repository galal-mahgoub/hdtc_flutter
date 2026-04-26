import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../../../core/services/video_service.dart';
import '../../../../../../core/theme/color_manager.dart';
import '../../../../domain/entities/video.dart';

class VideoCard extends GetView<VideoService> {
  const VideoCard({super.key, required this.video, required this.index});
  final Video video;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.grey10),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: ListTile(
          onTap: () => Get.toNamed(
            Routes.courseDetails,
            arguments: {
              'id': video.courseId.toString(),
              'type': video.type,
            },
          ),
          title: Text(video.title.value),
          subtitle: Text(video.courseTitle.value),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (video.taskInfo.value.progress.value < 100) ...[
                SizedBox(
                  height: 16.r,
                  width: 16.r,
                  child: CircularProgressIndicator(
                    value: video.taskInfo.value.progress.value / 100,
                    color: context.theme.primaryColor,
                    backgroundColor: context.theme.primaryColor.withOpacity(.2),
                  ),
                ),
                8.horizontalSpace,
              ],
              IconButton(
                onPressed: () => controller.removeVideo(index),
                icon: const Icon(
                  Icons.delete,
                  color: ColorManager.red,
                ),
              )
            ],
          ),
          leading: IconButton.outlined(
            icon: Icon(
              video.taskInfo.value.status.value == DownloadTaskStatus.failed
                  ? Icons.sync
                  : video.taskInfo.value.status.value ==
                          DownloadTaskStatus.running
                      ? Icons.pause
                      : video.taskInfo.value.status.value ==
                              DownloadTaskStatus.paused
                          ? Icons.download
                          : Icons.play_arrow,
              color: ColorManager.grey12,
            ),
            onPressed: () {
              if (video.taskInfo.value.status.value ==
                  DownloadTaskStatus.complete) {
                controller.openVideo(index);
              } else if (video.taskInfo.value.status.value ==
                  DownloadTaskStatus.failed) {
                controller.retryVideo(index);
              } else if (video.taskInfo.value.status.value ==
                  DownloadTaskStatus.running) {
                controller.pauseVideo(index);
              } else if (video.taskInfo.value.status.value ==
                  DownloadTaskStatus.paused) {
                controller.resumeVideo(index);
              }
            },
          ),
        ),
      );
    });
  }
}
