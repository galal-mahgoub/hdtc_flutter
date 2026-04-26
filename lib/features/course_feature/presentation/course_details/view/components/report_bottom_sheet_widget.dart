import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controller/courses_details_controller.dart';
import 'drop_down_widget.dart';

class ReportBottomSheetCustom extends StatelessWidget {
  const ReportBottomSheetCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return Form(
          key: controller.formReport,
          child: Padding(
            padding: EdgeInsets.only(
              top: 15.r,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
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
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'MessageReviewer'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: ColorManager.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            DropDownWidget(
                              isError: controller.isReportError,
                              data: controller.reasons.map((selectedCountry) {
                                return DropdownMenuItem<String>(
                                  value: selectedCountry,
                                  child: Text(selectedCountry,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.sp)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                controller.isReportError = false;
                                controller.selectedValueReport = value!;
                                controller.update();
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextField(
                              keyboardType: TextInputType.text,
                              hintText: 'ReasonBody'.tr,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide:
                                    const BorderSide(color: ColorManager.grey6),
                              ),
                              controller: controller.reasonReportController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'EnterReasonBody'.tr;
                                }
                                return null;
                              },
                              onEditingComplete: () {
                                FocusScope.of(context).unfocus();
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ButtonWidget(
                              isLoading: controller.isReportLoading,
                              colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                              text: Text(
                                'Report'.tr,
                                style: TextStyle(
                                    fontSize: 15.sp, color: ColorManager.white),
                              ),
                              onPressed: () => controller.addReport(),
                              width: 1.sw,
                              paddingHorizontal: 10,
                              paddingVertical: 10,
                              marginHorizontal: 5,
                              radius: 10,
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
