import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/courses_details_controller.dart';
import 'certificate_widget.dart';
import 'file_chapter_widget.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (controller.contents.isNotEmpty)
              FileChapterWidget(
                contents: controller.contents,
              ),
            if (controller.course!.certificate!.isNotEmpty &&
                controller.course!.authHasBought)
              CertificateWidget(
                certificates: controller.course!.certificate ?? [],
              ),
          ],
        );
      },
    );
  }
}
