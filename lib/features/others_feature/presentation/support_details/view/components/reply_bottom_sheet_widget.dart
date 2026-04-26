import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controllers/support_details_controller.dart';

class ReplyBottomSheetCustom extends StatelessWidget {
  const ReplyBottomSheetCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportDetailsController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(
            top: 15.r,
          ),
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
                          borderRadius: BorderRadius.all(Radius.circular(13.r)),
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
                padding: EdgeInsets.all(10.r),
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
                        'ReplySupport'.tr,
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
                        key: controller.formReply,
                        child: CustomTextField(
                          controller: controller.replyController,
                          keyboardType: TextInputType.text,
                          hintText: 'MessageBody'.tr,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                const BorderSide(color: ColorManager.grey2),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'EnterMessageBody'.tr;
                            } else if (value.length < 2) {
                              return 'EnterMore2Chars'.tr;
                            }
                            return null;
                          },
                          onEditingComplete: () {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                      ),
                      if (controller.file.name.isNotEmpty)
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 1.sw -
                                80.w, // Set your desired maximum width here
                          ),
                          margin: EdgeInsets.only(top: 15.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.r,
                            ),
                            decoration: BoxDecoration(
                              color: ColorManager.grey2,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.file.name.toString(),
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 13.sp,
                                          color: ColorManager.grey5,
                                        ),
                                      ),
                                      Text(
                                        controller.size.toString(),
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 9.sp,
                                          color: ColorManager.grey5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.file =
                                        PlatformFile(name: '', size: 0);
                                    controller.update();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: ColorManager.grey5,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.attachFiles();
                            },
                            icon: Container(
                              padding: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    color: context.theme.primaryColor,
                                    width: 1.w),
                                color: Colors.transparent,
                              ),
                              child: Icon(
                                Icons.attachment,
                                size: 27.sp,
                                color: context.theme.primaryColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ButtonWidget(
                              isLoading: controller.isReplyTicketLoading,
                              colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                              text: Text(
                                'Reply'.tr,
                                style: TextStyle(
                                    fontSize: 15.sp, color: ColorManager.white),
                              ),
                              onPressed: () => controller.replyTicket(),
                              width: 1.sw,
                              paddingHorizontal: 10,
                              paddingVertical: 10,
                              marginHorizontal: 5,
                              radius: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
