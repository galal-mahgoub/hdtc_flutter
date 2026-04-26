import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/empty_widget.dart';
import '../../../../../blog_feature/domain/entities/comment.dart';
import '../../controllers/comments_controller.dart';
import 'comments_list_item_widget.dart';
import 'comments_loading_widget.dart';

class CommentsListWidget extends StatelessWidget {
  const CommentsListWidget({
    required this.data,
    required this.type,
    super.key,
  });

  final List<Comment> data;
  final String type;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentsController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const CommentsLoadingWidget();
        } else if (data.isEmpty) {
          return SizedBox(
            height: Get.height / 2,
            child: EmptyWidget(
             
              message: 'NoComments'.tr,
            ),
          );
        } else {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CommentsListItemWidget(
                item: data[index],
                type: type,
              );
            },
            separatorBuilder: (context, index) => 16.verticalSpace,
          );
        }
      },
    );
  }
}
