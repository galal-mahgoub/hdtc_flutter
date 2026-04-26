import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/core/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/item.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.item,
    required this.onDeletePressed,
  });

  final Item item;
  final void Function(BuildContext)? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.r, horizontal: 15.r),
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
              onPressed: onDeletePressed,
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
          padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 12.r),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  height: item.type == 'meeting' ? 75.h : 65.h,
                  width: item.type == 'meeting' ? 85.w : 110.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        item.type == 'meeting' ? 15.r : 10.r),
                    child: CustomImage(
                      path: item.image.isNotEmpty ? item.image : null,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
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
                      if (item.type == 'meeting')
                        Column(
                          children: [
                            Text(
                              '${item.day} | ${item.time?.start ?? ''}-${item.time?.end ?? ''}',
                              maxLines: 2,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 11.sp,
                                color: ColorManager.grey5,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      CustomRatingBar(
                        value: item.rate,
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
                                    item.teacherName,
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
                          Text(
                            item.priceString,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              color: context.theme.primaryColor,
                            ),
                          ),
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
  }
}
