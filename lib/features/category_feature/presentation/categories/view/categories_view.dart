import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/text_manager.dart';
import '../controller/categories_controller.dart';
import 'components/all_categories_list_widget.dart';
import 'components/trend_categories_list_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Categories'.tr,
              style: TextManager.font16Text300W600,
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () => Future.wait([
              controller.getAllCategories(),
              controller.getTrendCategories(),
            ]),
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                TrendCategoriesListWidget(),
                AllCategoriesListWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
