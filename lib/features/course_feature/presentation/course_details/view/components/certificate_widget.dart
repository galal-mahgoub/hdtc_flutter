import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/certificate.dart';

class CertificateWidget extends StatelessWidget {
  const CertificateWidget({
    super.key,
    required this.certificates,
  });

  final List<Certificate> certificates;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Text(
            'Certificate'.tr,
            style: TextStyle(
              fontSize: 13.sp,
              color: ColorManager.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          height: 70.h,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            scrollDirection: Axis.horizontal,
            itemCount: certificates.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: () async {
                  // Get.find<RootController>()
                  //     .openAnyThingFromCourseDetails(index: PageType.certificate);
                  // Get.toNamed(Routes.root);
                },
                child: Container(
                  width: 1.sw - 100.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.r,
                    vertical: 10.r,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: ColorManager.orange,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                          child: Icon(
                            Icons.settings,
                            size: 20.sp,
                            color: ColorManager.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              certificates[index].title ?? '',
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              DateFormat('dd MMM yyyy',
                                      Get.locale?.languageCode ?? 'EN')
                                  .format(DateTime.fromMillisecondsSinceEpoch(
                                      (int.tryParse(certificates[index]
                                                  .createdAt
                                                  .toString()) ??
                                              0) *
                                          1000)),
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: ColorManager.grey5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => 16.horizontalSpace,
          ),
        ),
      ],
    );
  }
}
