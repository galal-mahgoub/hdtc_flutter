import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../controllers/support_details_controller.dart';
import 'components/close_ticket_dialog.dart';
import 'components/reply_bottom_sheet_widget.dart';
import 'components/support_details_list_item_widget.dart';

class SupportDetailsView extends StatelessWidget {
  const SupportDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            backgroundColor: ColorManager.white13,
            centerTitle: true,
            title: Text(
              controller.item?.title ?? '',
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16).r,
            children: [
              if (controller.item!.webinar != null &&
                  controller.item!.webinar!.title.isNotEmpty)
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    border: Border.all(color: ColorManager.grey6),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration:  BoxDecoration(
                          color: context.theme.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.video_call,
                          size: 25.sp,
                          color: ColorManager.white,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This is a course support message',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: ColorManager.grey8,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            controller.item!.webinar?.title ?? '',
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 13.sp,
                                color: ColorManager.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.scrollConversationController,
                itemCount: controller.item!.conversations.length,
                itemBuilder: (context, index) => SupportDetailsListItemWidget(
                  item: controller.item!.conversations[index],
                ),
              ),
            ],
          ),
          bottomNavigationBar: controller.item!.status == "close"
              ? null
              : Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r)),
                    color: ColorManager.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                          text: Text(
                            'Reply'.tr,
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManager.white),
                          ),
                          onPressed: () {
                            controller.replyController.text = '';
                            controller.file = PlatformFile(name: '', size: 0);
                            controller.update();
                            Get.bottomSheet(
                              const ReplyBottomSheetCustom(),
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                            );
                          },
                          width: 1.sw,
                          paddingHorizontal: 10,
                          paddingVertical: 10,
                          radius: 10,
                        ),
                      ),
                      if (controller.item!.status != "close")
                        SizedBox(
                          width: 10.w,
                        ),
                      if (controller.item!.status != "close")
                        IconButton(
                          onPressed: () => Get.dialog(
                            const CloseTicketDialog(),
                            barrierDismissible: false,
                          ),
                          icon: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: ColorManager.red, width: 1.w),
                              color: Colors.transparent,
                            ),
                            child: Icon(
                              Icons.close,
                              size: 27.sp,
                              color: ColorManager.red,
                            ),
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
