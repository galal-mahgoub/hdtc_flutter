import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/core/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../domain/entities/favorite.dart';
import '../../controller/favourites_controller.dart';

class FavouriteListItemWidget extends StatelessWidget {
  const FavouriteListItemWidget({
    super.key,
    required this.item,
  });

  final Favorite item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritesController>(
      builder: (controller) {
        return InkWell(
          onTap: () async {
            await Get.toNamed(
              Routes.courseDetails,
              arguments: {
                'id': item.webinar!.id.toString(),
                'type': item.webinar!.type,
              },
            )!
                .then(
              (value) => controller.getFavorites(),
            );
          },
          child: Slidable(
            // Specify a key if the Slidable is dismissible.
            key: ValueKey(item.id),
            // The end action pane is the one at the right or the bottom side.
            endActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const StretchMotion(),
              closeThreshold: .4,
              extentRatio: .25,
              // All actions are defined in the children parameter.
              children: [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (context) {
                    if (item.webinar?.id == null) return;
                    controller.deleteFavorite(item.id.toString());
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                  borderRadius: BorderRadius.only(
                    topRight: Get.locale?.languageCode == 'en'
                        ? Radius.circular(10.r)
                        : const Radius.circular(0),
                    bottomRight: Get.locale?.languageCode == 'en'
                        ? Radius.circular(10.r)
                        : const Radius.circular(0),
                    topLeft: Get.locale?.languageCode == 'en'
                        ? const Radius.circular(0)
                        : Radius.circular(10.r),
                    bottomLeft: Get.locale?.languageCode == 'en'
                        ? const Radius.circular(0)
                        : Radius.circular(10.r),
                  ),
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(8).r,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 70.h,
                            width: 1.sw,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: CustomImage(
                                path: item.webinar?.image != null &&
                                        item.webinar!.image.isNotEmpty
                                    ? item.webinar!.image
                                    : null,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: Container(
                              height: 6.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.r)),
                                  border: Border.all(
                                      color: ColorManager.white, width: 2.w)),
                              margin: EdgeInsetsDirectional.only(
                                  bottom: 10.r, start: 10.r, end: 10.r),
                              child: LinearProgressIndicator(
                                minHeight: 5.h,
                                color: context.theme.primaryColor,
                                backgroundColor: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                value: item.webinar?.progressPercent != null &&
                                        item.webinar!.progressPercent! > 0
                                    ? (item.webinar!.progressPercent!
                                            .toDouble()) /
                                        100
                                    : 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.webinar?.title ?? '',
                            maxLines: 1,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.black,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomRatingBar(
                            value: item.webinar?.rate ?? 0,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: ColorManager.grey4,
                                      size: 15.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        DateFormat(
                                                'dd MMM yyyy',
                                                GetStorage().read<String>(
                                                        'language_code') ??
                                                    'EN')
                                            .format(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    (int.tryParse(item.webinar
                                                                    ?.createdAt ??
                                                                '0') ??
                                                            0) *
                                                        1000)),
                                        maxLines: 1,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 8.sp,
                                          color: ColorManager.grey1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              item.webinar?.free != null && item.webinar!.free!
                                  ? Text(
                                      'Free'.tr,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 12.sp,
                                        color: context.theme.primaryColor,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
