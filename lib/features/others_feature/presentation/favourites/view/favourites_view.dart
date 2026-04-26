import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_loading.dart';
import 'package:hdtc_on/features/auth_feature/presentation/mainlayout/controllers/mainlayout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../controller/favourites_controller.dart';
import 'components/favourite_list_item_view.dart';
import 'components/favourites_loading.dart';

class FavouritesView extends GetView<FavouritesController> {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritesController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Favorites'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: CustomLoading(
            widget: controller.isLoading
                ? const FavouritesLoading()
                : controller.favourites.isEmpty
                    ? EmptyWidget(
                      
                        bgColor: ColorManager.white11,
                        message: 'NoFavorited'.tr,
                        nameBtn: Text(
                          'Courses'.tr,
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.white),
                        ),
                        onPressed: () {
                          Get.back();
                          MainLayoutController.to.changeIndex(2);
                        },
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(16).r,
                        itemCount: controller.favourites.length,
                        itemBuilder: (context, index) =>
                            FavouriteListItemWidget(
                          item: controller.favourites[index],
                        ),
                        separatorBuilder: (context, index) => 16.verticalSpace,
                      ),
            isLoading: controller.isDeleteLoading,
          ),
        );
      },
    );
  }
}
