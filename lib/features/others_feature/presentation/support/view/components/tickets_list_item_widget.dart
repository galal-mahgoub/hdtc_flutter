import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../domain/entities/ticket.dart';
import '../../controllers/support_controller.dart';

class TicketsListItemWidget extends StatelessWidget {
  const TicketsListItemWidget({
    super.key,
    required this.item,
  });

  final Ticket item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportController>(
      builder: (controller) {
        return InkWell(
          onTap: () async {
            await Get.toNamed(Routes.supportDetails, arguments: {'item': item})!
                .then((value) {
              if (value != null) {
                return controller.refreshSupport();
              }
            });
          },
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(
              horizontal: 10.r,
              vertical: 10.r,
            ),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(13.r),
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  child: Icon(
                    FontAwesomeIcons.solidCommentDots,
                    size: 25.sp,
                    color: ColorManager.white,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 13.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              DateFormat('dd MMM yyyy | HH:mm',
                                      Get.locale?.languageCode ?? 'EN')
                                  .format(DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(item.createdAt) * 1000)),
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.grey5,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 3.r, horizontal: 8.r),
                            decoration: BoxDecoration(
                              color: item.status == 'open'
                                  ? ColorManager.yellow.withOpacity(.1)
                                  : item.status == 'replied'
                                      ? context.theme.primaryColor
                                          .withOpacity(.1)
                                      : ColorManager.grey13.withOpacity(.1),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(13.r),
                            ),
                            child: Text(
                              item.status.capitalizeFirst ?? '',
                              maxLines: 1,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10.sp,
                                color: item.status == 'open'
                                    ? ColorManager.yellow
                                    : item.status == 'replied'
                                        ? context.theme.primaryColor
                                        : ColorManager.grey4,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
