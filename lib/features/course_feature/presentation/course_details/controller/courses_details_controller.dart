import 'package:hdtc_on/core/utils/toast_manager.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/add_course_free_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/add_course_review_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/add_favorite_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/add_report_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/course_details_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/get_course_content_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/get_quiz_result_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/get_reasons_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/reply_to_comment_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/content.dart';
import '../../../domain/entities/course.dart';
import '../../../domain/entities/files_chapter.dart';
import '../../../domain/use_cases/send_course_comment_use_case.dart';

class CoursesDetailsController extends GetxController {
  CourseDetailsUseCase courseDetailsUseCase;
  AddFavoriteUseCase addFavoriteUseCase;
  GetReasonsUseCase getReasonsUseCase;
  AddReportUseCase addReportUseCase;
  GetCourseContentUseCase getCourseContentUseCase;
  SendCourseCommentUseCase sendCourseCommentUseCase;
  ReplyToCommentUseCase replyToCommentUseCase;
  AddCourseReviewUseCase addCourseReviewUseCase;
  AddCourseFreeUseCase addCourseFreeUseCase;
  GetQuizResultUseCase getQuizResultUseCase;
  CoursesDetailsController({
    required this.courseDetailsUseCase,
    required this.addFavoriteUseCase,
    required this.getReasonsUseCase,
    required this.addReportUseCase,
    required this.getCourseContentUseCase,
    required this.sendCourseCommentUseCase,
    required this.replyToCommentUseCase,
    required this.addCourseReviewUseCase,
    required this.addCourseFreeUseCase,
    required this.getQuizResultUseCase,
  });

  static CoursesDetailsController get to => Get.find();

  late PageController pageController;
  GlobalKey<FormState> formComment = GlobalKey<FormState>();
  TextEditingController reasonReportController = TextEditingController();
  TextEditingController messageCommentController = TextEditingController();
  TextEditingController descriptionReviewController = TextEditingController();
  GlobalKey<FormState> formReport = GlobalKey<FormState>();
  GlobalKey<FormState> formReview = GlobalKey<FormState>();

  bool isLoading = false;
  bool isAddFavLoading = false;
  bool isReportLoading = false;
  bool isNoticesLoading = false;
  bool isForumLoading = false;
  bool showLoadingVideo = false;
  bool isCommentLoading = false;
  bool isReviewLoading = false;
  bool isAddFreeLoading = false;
  bool isQuizLoading = false;
  bool isReportError = false;
  bool isPause = false;

  Course? course;
  List<String> lengthInfoList = [];
  List<String> reasons = [];
  List<Content> contents = [];

  File? itemContentDetails;
  String id = '';
  String type = '';
  String selectedValueReport = 'SelectReason'.tr;

  int currentIndex = 0;
  int currentIndexSliderPrerequisites = 0;
  double contentQualityReview = 0.0;
  double instructorSkillsReview = 0.0;
  double purchaseWorthReview = 0.0;
  double supportQualityReview = 0.0;

  Future<void> getCourseDetails() async {
    lengthInfoList.clear();
    isLoading = true;
    update();

    var result = await courseDetailsUseCase(
      courseId: id,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      Get.back(closeOverlays: true);
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      course = result;
      isLoading = false;
      if (result.quizzes!.isNotEmpty) {
        lengthInfoList.add('Quiz'.tr);
      }
      if (result.certificate!.isNotEmpty) {
        lengthInfoList.add('Certificate'.tr);
      }
      if (result.isDownloadable!) {
        lengthInfoList.add('Downloadable'.tr);
      }

      update();
    });
  }

  Future<void> addFavourite() async {
    if (isAddFavLoading) return;
    isAddFavLoading = true;
    update();

    var result = await addFavoriteUseCase(
      courseId: id,
    );

    result.fold((failure) {
      isAddFavLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      course!.isFavorite = !course!.isFavorite;
      isAddFavLoading = false;
      update();
    });
  }

  Future<void> getReasons() async {
    isReportLoading = true;
    update();

    var result = await getReasonsUseCase();

    result.fold((failure) {
      isReportLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) {
      reasons = result;
      isReportLoading = false;
      update();
    });
  }

  Future<void> addReport() async {
    if (!formReport.currentState!.validate() ||
        selectedValueReport == 'SelectReason'.tr) {
      if (selectedValueReport == 'SelectReason'.tr) {
        isReportError = true;
        update();
      }
      return;
    }
    if (selectedValueReport == 'SelectReason'.tr) {
      isReportError = true;
      update();
      return;
    }

    isReportLoading = true;
    update();

    var result = await addReportUseCase(
      courseId: id,
      reason: selectedValueReport,
      message: reasonReportController.text,
    );
    Get.log(result.toString());
    result.fold((failure) {
      isReportLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      if (Get.isBottomSheetOpen!) {
        Get.back();
      }
      isReportLoading = false;
      update();

      ToastManager.showSuccess(result);
    });
  }

  Future<void> getCourseContent() async {
    isLoading = true;
    update();

    var result = await getCourseContentUseCase(
      courseId: id,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) {
      contents = result;
      isLoading = false;
      update();
    });
  }

  Future<void> sendComment() async {
    if (!formComment.currentState!.validate()) {
      return;
    }

    isCommentLoading = true;
    update();

    var result = await sendCourseCommentUseCase(
      courseId: id,
      comment: messageCommentController.text,
      itemName: type,
    );

    result.fold((failure) {
      isCommentLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isCommentLoading = false;
      messageCommentController.clear();
      update();

      if (Get.isBottomSheetOpen!) {
        Get.back();
      }
      ToastManager.showSuccess(result);
    });
  }

  Future<void> replyToComment(String id) async {
    if (!formComment.currentState!.validate()) {
      return;
    }

    isCommentLoading = true;
    update();

    var result = await replyToCommentUseCase(
      commentId: id,
      reply: messageCommentController.text,
    );

    result.fold((failure) {
      isCommentLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isCommentLoading = false;
      update();
      if (Get.isBottomSheetOpen!) {
        Get.back();
      }
      ToastManager.showSuccess(result);
    });
  }

  Future<void> sendReview() async {
    if (!formReview.currentState!.validate()) {
      return;
    }

    isReviewLoading = true;
    update();

    var result = await addCourseReviewUseCase(
      courseId: id,
      description: descriptionReviewController.text,
      contentQuality: contentQualityReview,
      instructorSkills: instructorSkillsReview,
      purchaseWorth: purchaseWorthReview,
      supportQuality: supportQualityReview,
    );

    result.fold((failure) {
      isReviewLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isReviewLoading = false;
      update();
      if (Get.isBottomSheetOpen!) {
        Get.back();
      }
      ToastManager.showSuccess(result);
    });
  }

  Future<void> addCourseFree() async {
    isAddFreeLoading = true;
    update();

    var result = await addCourseFreeUseCase(
      courseId: id,
    );

    result.fold((failure) {
      isAddFreeLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isAddFreeLoading = false;
      update();
      if (Get.isDialogOpen!) {
        Get.back();
      }
      ToastManager.showSuccess(result);
      await getCourseDetails();
    });
  }

  Future<void> getQuizResult(String quizId) async {
    isQuizLoading = true;
    update();

    var result = await getQuizResultUseCase(
      quizId: quizId,
    );

    result.fold((failure) {
      isQuizLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isQuizLoading = false;
      update();
      await Get.toNamed(
        Routes.quizResultDetails,
        arguments: {
          'quizResultDetails': result,
        },
      )?.then((value) {
        if (value != null) {
          initData();
        }
      });
    });
  }

  initData() {
    Future.wait([
      getCourseDetails(),
      getReasons(),
      getCourseContent(),
    ]);
  }

  changeViewIndex(int value) {
    currentIndex = value;
    pageController.animateToPage(
      value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
    update();
  }

  @override
  void onInit() {
    id = Get.arguments['id'] ?? '';

    type = Get.arguments['type'] ?? '';

    pageController = PageController();

    initData();
    super.onInit();
  }

  @override
  void onClose() {
    reasonReportController.dispose();
    messageCommentController.dispose();
    descriptionReviewController.dispose();
    super.onClose();
  }
}
