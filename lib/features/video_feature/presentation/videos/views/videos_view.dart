import 'package:hdtc_on/core/services/video_service.dart';
import 'package:hdtc_on/features/video_feature/domain/entities/video.dart';
import 'package:hdtc_on/features/video_feature/presentation/videos/views/components/video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';

class VideosView extends GetView<VideoService> {
  const VideosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Videos'.tr,
          style: TextManager.font16Text300W600,
        ),
        leadingWidth: 80,
        leading: const CustomBackBtn(),
      ),
      body: Obx(
        () {
          return ListView.separated(
            padding: EdgeInsets.all(16.r),
            itemCount: controller.videos.value.length,
            itemBuilder: (context, index) {
              Video? video = controller.videos.value[index];
              return VideoCard(
                video: video,
                index: index,
              );
            },
            separatorBuilder: (context, index) => 16.verticalSpace,
          );
        },
      ),
    );
  }
}
