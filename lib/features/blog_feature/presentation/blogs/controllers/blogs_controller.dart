import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/blog.dart';
import '../../../domain/entities/blog_category.dart';
import '../../../domain/use_cases/blogs_categories_use_case.dart';
import '../../../domain/use_cases/blogs_use_case.dart';

class BlogsController extends GetxController {
  BlogsUseCase blogsUseCase;
  BlogsCategoriesUseCase blogsCategoriesUseCase;
  BlogsController({
    required this.blogsUseCase,
    required this.blogsCategoriesUseCase,
  });

  List<Blog> blogs = [];
  List<BlogCategory> blogsCategories = [];
  bool isLoading = false;
  bool isFilterLoading = false;

  BlogCategory selectedBlogCategory = const BlogCategory(id: 0, title: 'All');

  selectCategoryFilter(BlogCategory value) {
    selectedBlogCategory = value;
    update();
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
    getBlogs(
      categoryId: value.id,
    );
  }

  Future<void> getBlogs({int? categoryId}) async {
    isLoading = true;
    update();

    var result = await blogsUseCase(
      categoryId: categoryId == 0 ? null : categoryId,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) {
      blogs = result;
      isLoading = false;
      update();
    });
  }

  Future<void> getBlogsCategories() async {
    isFilterLoading = true;
    update();

    var result = await blogsCategoriesUseCase();

    result.fold((failure) {
      isFilterLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) {
      blogsCategories = [const BlogCategory(id: 0, title: 'All'), ...result];
      isFilterLoading = false;
      update();
    });
  }

  @override
  void onInit() async {
    await Future.wait([
      getBlogs(),
      getBlogsCategories(),
    ]);
    super.onInit();
  }
}
