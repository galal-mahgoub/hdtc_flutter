import 'package:hdtc_on/features/course_feature/domain/use_cases/add_question_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/edit_question_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/get_forums_use_case.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/get_notices_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/content.dart';
import '../../../domain/entities/course.dart';
import '../../../domain/entities/forum_data.dart';
import '../../../domain/entities/notice.dart';
import '../../../domain/use_cases/course_details_use_case.dart';
import '../../../domain/use_cases/get_quiz_result_use_case.dart';

class NewLearningPageController extends GetxController {
  CourseDetailsUseCase courseDetailsUseCase;
  AddQuestionUseCase addQuestionUseCase;
  EditQuestionUseCase editQuestionUseCase;
  GetForumsUseCase getForumsUseCase;
  GetNoticesUseCase getNoticesUseCase;
  GetQuizResultUseCase getQuizResultUseCase;
  NewLearningPageController({
    required this.courseDetailsUseCase,
    required this.addQuestionUseCase,
    required this.editQuestionUseCase,
    required this.getForumsUseCase,
    required this.getNoticesUseCase,
    required this.getQuizResultUseCase,
  });

  late PageController pageController;
  TextEditingController titleQuestionController = TextEditingController();
  TextEditingController descriptionQuestionController = TextEditingController();
  TextEditingController searchForumsController = TextEditingController();
  GlobalKey<FormState> formAddQuestion = GlobalKey<FormState>();
  GlobalKey<FormState> formSearch = GlobalKey<FormState>();

  bool isQuestionLoading = false;
  bool isLoading = false;
  bool isNoticesLoading = false;
  bool isSearchLoading = false;
  bool isQuizLoading = false;

  ForumData? forum;
  late Course course;
  List<Content> contents = [];
  List<Notice> notices = [];
  String isEditOrSend = 'send';
  int currentIndex = 0;

  changeViewIndex(int value) {
    currentIndex = value;
    pageController.animateToPage(
      value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
    update();
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
          Get.back(result: true);
        }
      });
    });
  }

  Future<void> addQuestionForums() async {
    if (!formAddQuestion.currentState!.validate()) {
      return;
    }
    isQuestionLoading = true;
    update();

    var result = await addQuestionUseCase(
      courseId: course.id.toString(),
      title: titleQuestionController.text,
      description: descriptionQuestionController.text,
    );

    result.fold((failure) {
      isQuestionLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) async {
      isQuestionLoading = false;
      update();
      ToastManager.showSuccess(result);
      await getForums();
    });
  }

  Future<void> editQuestionForums() async {
    if (!formAddQuestion.currentState!.validate()) {
      return;
    }
    isQuestionLoading = true;
    update();

    var result = await editQuestionUseCase(
      courseId: course.id.toString(),
      title: titleQuestionController.text,
      description: descriptionQuestionController.text,
    );

    result.fold((failure) {
      isQuestionLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) async {
      ToastManager.showSuccess(result);
      await getForums();

      isQuestionLoading = false;
      update();
    });
  }

  Future<void> getForums() async {
    isLoading = true;
    update();

    var result = await getForumsUseCase(
      courseId: course.id.toString(),
      search: searchForumsController.text,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) async {
      forum = result;
      isLoading = false;
      update();
    });
  }

  Future<void> getNotices() async {
    isNoticesLoading = true;
    update();

    var result = await getNoticesUseCase(
      courseId: course.id.toString(),
    );

    result.fold((failure) {
      isNoticesLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) async {
      notices = result;
      isNoticesLoading = false;
      update();
    });
  }

  @override
  void onInit() async {
    course = Get.arguments['course'];

    contents = Get.arguments['contents'];

    pageController = PageController();
    await getNotices();
    super.onInit();
  }

  @override
  void onClose() {
    titleQuestionController.dispose();
    descriptionQuestionController.dispose();
    searchForumsController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
