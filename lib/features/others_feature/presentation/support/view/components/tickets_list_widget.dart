import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/empty_widget.dart';
import '../../../../domain/entities/ticket.dart';
import '../../controllers/support_controller.dart';
import 'add_ticket_bottom_sheet.dart';
import 'tickets_list_item_widget.dart';

class TicketsListWidget extends StatelessWidget {
  const TicketsListWidget({
    required this.data,
    required this.type,
    super.key,
  });

  final List<Ticket> data;
  final String type;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const SizedBox();
        } else if (data.isEmpty) {
          return SizedBox(
            height: Get.height / 2,
            child: EmptyWidget(
                message: 'NoTickets'.tr,
                nameBtn: Text(
                  'SubmitRequest'.tr,
                  style: TextStyle(fontSize: 15.sp, color: ColorManager.white),
                ),
                onPressed: () {
                  controller.file = PlatformFile(name: '', size: 0);
                  controller.subjectAddController.text = '';
                  controller.messageAddController.text = '';
                  controller.selectedValueDepartments = null;

                  controller.selectedValueCourses = null;
                  Get.bottomSheet(
                    const AddTicketBottomSheetCustom(),
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                  );
                }),
          );
        } else {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) => TicketsListItemWidget(
              item: data[index],
            ),
            separatorBuilder: (context, index) => 16.verticalSpace,
          );
        }
      },
    );
  }
}
