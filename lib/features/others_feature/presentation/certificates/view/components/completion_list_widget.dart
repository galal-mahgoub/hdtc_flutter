import 'package:hdtc_on/core/routes/app_pages.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/empty_widget.dart';
import '../../../../domain/entities/certificate.dart';
import '../../controller/certificates_controller.dart';
import 'completion_list_item_widget.dart';
import 'completion_loading_widget.dart';

class CompletionListWidget extends StatelessWidget {
  const CompletionListWidget({
    required this.type,
    required this.data,
    super.key,
  });

  final List<Certificate> data;
  final String type;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CertificatesController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const CompletionLoadingWidget();
        } else if (data.isEmpty) {
          return SizedBox(
            height: Get.height / 2,
            child: EmptyWidget(
              message: 'NoCertificates'.tr,
              nameBtn: Text(
                'MyCourses'.tr,
                style: TextStyle(fontSize: 15.sp, color: ColorManager.white),
              ),
              onPressed: () => Get.toNamed(Routes.myCourses),
            ),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CompletionListItemWidget(
                item: data[index],
              );
            },
          );
        }
      },
    );
  }
}
