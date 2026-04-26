import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controllers/new_learning_page_controller.dart';

class AddQuestionBottomSheetCustom extends StatelessWidget {
  const AddQuestionBottomSheetCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewLearningPageController>(
      builder: (controller) {
        return Padding(
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
                  onTap: () => Get.back(),
                  child: Container(
                      margin: EdgeInsetsDirectional.only(end: 10.r),
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.all(Radius.circular(13.r)),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 22.sp,
                        color: ColorManager.black,
                      )),
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
                          'New Question'.tr,
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
                        Form(
                          key: controller.formAddQuestion,
                          child: Column(
                            children: [
                              CustomTextField(
                                hintText: 'Title'.tr,
                                keyboardType: TextInputType.text,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: const BorderSide(
                                      color: ColorManager.grey6, width: 0.5),
                                ),
                                prefixWidget: Icon(
                                  Icons.person,
                                  size: 20.sp,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'EnterTitle'.tr;
                                  }
                                  return null;
                                },
                                controller: controller.titleQuestionController,
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              CustomTextField(
                                keyboardType: TextInputType.text,
                                hintText: 'Description',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: const BorderSide(
                                      color: ColorManager.grey10),
                                ),
                                controller:
                                    controller.descriptionQuestionController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'EnterDescription'.tr;
                                  }
                                  return null;
                                },
                                onEditingComplete: () {
                                  FocusScope.of(context).unfocus();
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ButtonWidget(
                          isLoading: controller.isQuestionLoading,
                          colorBtn: UserService.to.isKsa.value
                              ? Colors.green[400]
                              : ColorManager.green,
                          text: Text(
                            controller.isEditOrSend == 'send'
                                ? 'Send'.tr
                                : 'Edit'.tr,
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManager.white),
                          ),
                          onPressed: () {
                            controller.isEditOrSend == 'send'
                                ? controller.addQuestionForums()
                                : controller.editQuestionForums();
                          },
                          width: 1.sw,
                          paddingHorizontal: 10,
                          paddingVertical: 10,
                          marginHorizontal: 5,
                          radius: 10,
                        ),
                      ],
                    ),
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
