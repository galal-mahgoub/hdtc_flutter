import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/languages/app_translations.dart';
import '../../../../../../core/widgets/empty_widget.dart';
import '../../../../domain/entities/notice.dart';
import '../../controllers/new_learning_page_controller.dart';
import 'notices_bottom_sheet_widget.dart';

class NoticesListNewLearningPageWidget extends StatelessWidget {
  const NoticesListNewLearningPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewLearningPageController>(
      builder: (controller) {
        return controller.isNoticesLoading
            ? const NoticeLoading()
            : controller.notices.isNotEmpty
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.notices.length,
                    itemBuilder: (context, index) {
                      Notice notice = controller.notices[index];
                      return InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            NoticesBottomSheetCustom(
                              notice: notice,
                            ),
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.r, vertical: 10.r),
                          margin: EdgeInsets.symmetric(vertical: 5.r),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            color: ColorManager.white,
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.r),
                                  decoration: BoxDecoration(
                                    color: notice.color == 'danger'
                                        ? ColorManager.orange
                                        : notice.color == 'warning'
                                            ? ColorManager.yellow
                                            : notice.color == 'info'
                                                ? ColorManager.blue6
                                                : context.theme.primaryColor,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(13.r),
                                  ),
                                  child: Icon(
                                    notice.color == 'danger'
                                        ? FontAwesomeIcons.triangleExclamation
                                        : notice.color == 'warning'
                                            ? FontAwesomeIcons.circleExclamation
                                            : notice.color == 'info'
                                                ? Icons.sim_card_alert_rounded
                                                : FontAwesomeIcons
                                                    .solidCircleCheck,
                                    size: 20.sp,
                                    color: ColorManager.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.r),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          notice.title,
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
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    color: ColorManager.grey4,
                                                    size: 15.sp,
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      notice.creator.fullName,
                                                      maxLines: 1,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 8.sp,
                                                        color:
                                                            ColorManager.grey1,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                              Get.locale
                                                                      ?.languageCode ??
                                                                  'EN')
                                                          .format(DateTime
                                                              .fromMillisecondsSinceEpoch(
                                                                  notice.createdAt *
                                                                      1000)),
                                                      maxLines: 1,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 8.sp,
                                                        color:
                                                            ColorManager.grey1,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : SizedBox(
                    height: Get.height / 2,
                    child: Center(
                      child: EmptyWidget(
                        message: LocaleKeys.noNoticesAvailable.tr,
                      ),
                    ),
                  );
      },
    );
  }
}

class NoticeLoading extends StatelessWidget {
  const NoticeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 70.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: ColorManager.white6,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 10.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: ColorManager.white6,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 10.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: ColorManager.white6,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 10.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: ColorManager.white6,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 10.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: ColorManager.white6,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Container(
                          height: 10.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: ColorManager.white6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => 16.verticalSpace,
      ),
    );
  }
}
