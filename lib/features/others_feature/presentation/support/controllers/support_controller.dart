import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/get_purchases_courses_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_departments_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_myclass_tickets_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_tickets_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/send_ticket_use_case.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../course_feature/domain/entities/course.dart';
import '../../../domain/entities/department.dart';
import '../../../domain/entities/ticket.dart';

class SupportController extends GetxController {
  GetTicketsUseCase getTicketsUseCase;
  GetMyClassTicketsUseCase getMyClassTicketsUseCase;
  GetDepartmentUseCase getDepartmentUseCase;
  GetPurchasesCoursesUseCase getPurchasesCoursesUseCase;
  SendTicketUseCase sendTicketUseCase;
  SupportController({
    required this.getTicketsUseCase,
    required this.getMyClassTicketsUseCase,
    required this.getDepartmentUseCase,
    required this.getPurchasesCoursesUseCase,
    required this.sendTicketUseCase,
  });

  late PageController pageController;
  int currentIndex = 0;
  int subscribePlanIndex = 0;

  GlobalKey<FormState> formAdd = GlobalKey<FormState>();
  TextEditingController subjectAddController = TextEditingController();
  TextEditingController messageAddController = TextEditingController();

  String size = '';
  bool isLoading = false;
  bool isPurchasesLoading = false;
  bool isDepartmentsLoading = false;
  bool isSendLoading = false;

  Department? selectedValueDepartments;
  Course? selectedValueCourses;

  List<Ticket> tickets = [];
  List<Ticket> myCourseSupport = [];
  List<Department> departments = [];
  List<Course> courses = [];
  PlatformFile file = PlatformFile(name: '', size: 0);

  changeViewIndex(int value) {
    currentIndex = value;
    pageController.animateToPage(
      value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
    update();
  }

  Future<void> sendTicket() async {
    if (currentIndex == 0 && selectedValueDepartments == null) {
      ToastManager.showError('SelectDepartment'.tr);
    } else if (currentIndex == 1 && selectedValueCourses == null) {
      ToastManager.showError('SelectCourse'.tr);
    }

    if (!formAdd.currentState!.validate() ||
        (currentIndex == 0 && selectedValueDepartments == null) ||
        (currentIndex == 1 && selectedValueCourses == null)) {
      return;
    }
    isSendLoading = true;
    update();
    var result = await sendTicketUseCase(
      title: subjectAddController.text,
      type: currentIndex == 0 ? 'platform_support' : 'course_support',
      departmentId: currentIndex == 0
          ? selectedValueDepartments?.id.toString() ?? ''
          : '',
      webinarId:
          currentIndex == 0 ? '' : selectedValueCourses?.id.toString() ?? '',
      file: file,
      message: messageAddController.text,
    );

    result.fold((failure) {
      isSendLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isSendLoading = false;
      update();
      refreshSupport();
      Get.back();
      ToastManager.showSuccess(result);
    });
  }

  Future<void> getTickets() async {
    isLoading = true;
    update();
    var result = await getTicketsUseCase();

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      tickets = result;
      isLoading = false;
      update();
    });
  }

  Future<void> getMyClassSupports() async {
    isLoading = true;
    update();
    var result = await getMyClassTicketsUseCase();

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      myCourseSupport = result;
      isLoading = false;
      update();
    });
  }

  Future<void> getDepartments() async {
    isDepartmentsLoading = true;
    update();
    var result = await getDepartmentUseCase();

    result.fold((failure) {
      isDepartmentsLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      departments = result;
      isDepartmentsLoading = false;
      update();
    });
  }

  Future<void> getPurchasesCourses() async {
    isPurchasesLoading = true;
    update();
    var result = await getPurchasesCoursesUseCase();

    result.fold((failure) {
      isPurchasesLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      courses = result;
      isPurchasesLoading = false;
      update();
    });
  }

  void attachFiles() async {
    try {
      file = await Utils.attachFiles(onlyImage: true);

      if (file.name.isNotEmpty) {
        Get.log('file.extension******${file.extension}');
        Get.log('file.path******${file.path.toString().split('/').last}');
        Get.log('fileName******${file.name}');
        Get.log(
            'mediaType******${Utils.getFileType(file.extension.toString().toLowerCase())}');

        const kb = 1024;
        const mb = kb * 1024;
        const gb = mb * 1024;

        if (file.size >= gb) {
          size = '${(file.size / gb).toStringAsFixed(2)} GB';
        } else if (file.size >= mb) {
          size = '${(file.size / mb).toStringAsFixed(2)} MB';
        } else if (file.size >= kb) {
          size = '${(file.size / kb).toStringAsFixed(2)} KB';
        } else {
          size = '$file.value.size bytes';
        }
      }
      update();
    } catch (e) {
      ToastManager.showError(e.toString());
    }
  }

  Future refreshSupport() async {
    if (UserService.to.currentUser.value!.roleName == 'user') {
      await Future.wait([
        getTickets(),
        getDepartments(),
        getPurchasesCourses(),
      ]);
    } else {
      await Future.wait([
        getTickets(),
        getMyClassSupports(),
        getDepartments(),
        getPurchasesCourses(),
      ]);
    }
  }

  @override
  Future<void> onInit() async {
    pageController = PageController();

    await refreshSupport();
    super.onInit();
  }
}
