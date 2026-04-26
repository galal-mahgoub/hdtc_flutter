import 'package:flutter_html/flutter_html.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

import '../../../../../../core/widgets/overlay_image_zoomable.dart';
import '../../../../domain/entities/ticket.dart';
import '../../controllers/support_details_controller.dart';

class SupportDetailsListItemWidget extends StatelessWidget {
  const SupportDetailsListItemWidget({
    super.key,
    required this.item,
  });

  final Conversation item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportDetailsController>(
      builder: (controller) {
        return item.sender != null && item.sender!.fullName.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth:
                          1.sw - 80.w, // Set your desired maximum width here
                    ),
                    margin: EdgeInsets.only(top: 10.r),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.r,
                      vertical: 10.r,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(10.r),
                        topEnd: Radius.circular(10.r),
                        bottomStart: Radius.circular(10.r),
                      ),
                    ),
                    child: Html(
                      data: item.message,
                      style: {
                        // Add any custom styles here
                        "body": Style(
                          fontSize: FontSize(12.sp),
                          color: ColorManager.white,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      },
                    ),
                  ),
                  item.attach != null && item.attach!.isNotEmpty
                      ? InkWell(
                          onTap: () {
                            SwipeImageGallery(
                              context: context,
                              itemBuilder: (context, index) {
                                return CustomImage(path: item.attach);
                              },
                              transitionDuration: 100,
                              itemCount: 1,
                              overlayController: controller.overlayController,
                              onSwipe: (index) {
                                Get.find<SupportDetailsController>()
                                    .overlayController
                                    .add(OverlayImageZoomable(
                                      title: '${index + 1}/1',
                                    ));
                              },
                              initialOverlay: const OverlayImageZoomable(
                                title: '1/1',
                              ),
                            ).show();
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 1.sw -
                                  80.w, // Set your desired maximum width here
                            ),
                            margin: EdgeInsets.only(top: 10.r),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.r,
                                vertical: 5.r,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.grey2,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                                border: Border.all(color: ColorManager.grey5),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.attachment,
                                    size: 20.sp,
                                    color: ColorManager.grey5,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Flexible(
                                    child: Text(
                                      item.attach?.split('/').last.toString() ??
                                          '',
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 13.sp,
                                        color: ColorManager.grey5,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '12 kb',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 11.sp,
                                      color: ColorManager.grey5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    DateFormat('dd MMM yyyy | HH:mm',
                            GetStorage().read<String>('language_code') ?? 'EN')
                        .format(DateTime.fromMillisecondsSinceEpoch(
                            int.parse(item.createdAt) * 1000)),
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 11.sp,
                      color: ColorManager.grey6,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40.r,
                        width: 40.r,
                        margin: EdgeInsets.only(top: 10.r),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(55.r),
                          child: CustomImage(
                            path: item.supporter.avatar.isNotEmpty
                                ? item.supporter.avatar
                                : null,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 1.sw -
                                    110.w, // Set your desired maximum width here
                              ),
                              margin: EdgeInsets.only(top: 10.r),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.r,
                                vertical: 10.r,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.grey10,
                                borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(10.r),
                                  topEnd: Radius.circular(10.r),
                                  bottomStart: const Radius.circular(0),
                                  bottomEnd: Radius.circular(10.r),
                                ),
                              ),
                              child: Html(
                                data: item.message,
                                style: {
                                  // Add any custom styles here
                                  "body": Style(
                                    fontSize: FontSize(12.sp),
                                    color: ColorManager.black,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                },
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              DateFormat(
                                      'dd MMM yyyy | HH:mm',
                                      GetStorage()
                                              .read<String>('language_code') ??
                                          'EN')
                                  .format(DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(item.createdAt) * 1000)),
                              maxLines: 1,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 11.sp,
                                color: ColorManager.grey6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  item.attach != null && item.attach!.isNotEmpty
                      ? InkWell(
                          onTap: () {
                            SwipeImageGallery(
                              context: context,
                              itemBuilder: (context, index) {
                                return CustomImage(path: item.attach);
                              },
                              transitionDuration: 100,
                              itemCount: 1,
                              overlayController:
                                  Get.find<SupportDetailsController>()
                                      .overlayController,
                              onSwipe: (index) {
                                Get.find<SupportDetailsController>()
                                    .overlayController
                                    .add(OverlayImageZoomable(
                                      title: '${index + 1}/1',
                                    ));
                              },
                              initialOverlay: const OverlayImageZoomable(
                                title: '1/1',
                              ),
                            ).show();
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 1.sw -
                                  80.w, // Set your desired maximum width here
                            ),
                            margin: EdgeInsets.only(top: 10.r),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.r,
                                vertical: 5.r,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.grey2,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                                border: Border.all(color: ColorManager.grey5),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.attachment,
                                    size: 20.sp,
                                    color: ColorManager.grey5,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Flexible(
                                    child: Text(
                                      item.attach?.split('/').last.toString() ??
                                          '',
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 13.sp,
                                        color: ColorManager.grey5,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '12 kb',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 11.sp,
                                      color: ColorManager.grey5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              );
      },
    );
  }
}
