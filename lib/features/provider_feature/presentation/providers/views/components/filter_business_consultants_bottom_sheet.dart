import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/button_widget.dart';
import '../../controllers/providers_controller.dart';

class FilterBusinessConsultantsBottomSheet extends StatelessWidget {
  const FilterBusinessConsultantsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProvidersController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(top: 15.r),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Get.back(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsetsDirectional.only(end: 10.r),
                          padding: EdgeInsets.all(15.r),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r)),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 22.sp,
                            color: ColorManager.black,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(
                    vertical: 24.r,
                    horizontal: 24.r,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13.r),
                      topRight: Radius.circular(13.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'sortBy'.tr,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: '',
                        groupValue: controller.businessConsultantsSortBy,
                        onChanged: (value) => controller
                            .changeBusinessConsultantsSortBy(value ?? ''),
                        activeColor: context.theme.primaryColor,
                        title: Text(
                          'All'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: 'top_sale',
                        groupValue: controller.businessConsultantsSortBy,
                        onChanged: (value) => controller
                            .changeBusinessConsultantsSortBy(value ?? ''),
                        activeColor: context.theme.primaryColor,
                        title: Text(
                          'bestSeller'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: 'top_rate',
                        groupValue: controller.businessConsultantsSortBy,
                        onChanged: (value) => controller
                            .changeBusinessConsultantsSortBy(value ?? ''),
                        activeColor: context.theme.primaryColor,
                        title: Text(
                          'bestRated'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      Text(
                        'Filter'.tr,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      SwitchListTile(
                        title: Text(
                          'AvailableMeetings'.tr,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorManager.black,
                          ),
                        ),
                        value: controller.switchAvailableMeetings,
                        activeColor: context.theme.primaryColor,
                        onChanged: (value) {
                          controller.switchAvailableMeetings = value;
                          controller.update();
                        },
                      ),
                      SwitchListTile(
                        title: Text(
                          'FreeMeetings'.tr,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorManager.black,
                          ),
                        ),
                        value: controller.switchFreeMeetings,
                        activeColor: context.theme.primaryColor,
                        onChanged: (value) {
                          controller.switchFreeMeetings = value;
                          controller.update();
                        },
                      ),
                      SwitchListTile(
                        title: Text(
                          'MeetingDiscount'.tr,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorManager.black,
                          ),
                        ),
                        value: controller.switchDiscount,
                        activeColor: context.theme.primaryColor,
                        onChanged: (value) {
                          controller.switchDiscount = value;
                          controller.update();
                        },
                      ),
                      SwitchListTile(
                        title: Text(
                          'DownloadableContent'.tr,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorManager.black,
                          ),
                        ),
                        value: controller.switchDownloadable,
                        onChanged: (value) {
                          controller.switchDownloadable = value;
                          controller.update();
                        },
                        activeColor: context.theme.primaryColor,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ButtonWidget(
                        colorBtn: context.theme.primaryColor,
                        text: Text(
                          'FilterItem'.tr,
                          style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        onPressed: () async {
                          if (Get.isBottomSheetOpen!) {
                            Get.back();
                          }
                          controller.getBusinessConsultations();
                        },
                        width: 1.sw,
                        paddingHorizontal: 10,
                        paddingVertical: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
