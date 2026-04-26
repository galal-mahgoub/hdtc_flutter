import 'dart:io';

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/services/user_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../errors/failures.dart';
import '../languages/app_translations.dart';
import '../routes/app_pages.dart';
import '../theme/color_manager.dart';
import '../theme/text_manager.dart';
import '../widgets/button_widget.dart';
import 'toast_manager.dart';

class Utils {
  Utils._();

  static String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case AuthFailure:
        return failure.message!;
      case ValidationFailure:
        return failure.message!;
      case ServerFailure:
        return LocaleKeys.serverFailure.tr;
      case NetworkFailure:
        return LocaleKeys.networkFailure.tr;

      case UnVerifiedFailure:
        Get.toNamed(Routes.verifyCode, arguments: true);
        return failure.message ?? LocaleKeys.unVerifiedFailure.tr;

      case UnAuthenticatedFailure:
        Get.offAllNamed(Routes.login);
        return failure.message!;
      default:
        return LocaleKeys.unExpectedError.tr;
    }
  }

  static Future<PlatformFile> attachFiles({bool onlyImage = false}) async {
    PlatformFile file = PlatformFile(name: '', size: 0);
    try {
      final result = await FilePicker.platform
          .pickFiles(type: onlyImage ? FileType.image : FileType.any);

      if (result != null) {
        file = result.files.first;
      }
    } catch (e) {
      ToastManager.showError(e.toString());
    }
    return file;
  }

  static String getFileType(String extension) {
    switch (extension.toLowerCase()) {
      // Images
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'bmp':
        return 'image';

      // Documents
      case 'pdf':
        return 'application';
      case 'doc':
      case 'docx':
        return 'application/msword';
      case 'xls':
      case 'xlsx':
        return 'application/vnd.ms-excel';
      case 'ppt':
      case 'pptx':
        return 'application/vnd.ms-powerpoint';

      // Audio
      case 'mp3':
        return 'audio';
      case 'wav':
        return 'audio/x-wav';
      case 'ogg':
        return 'audio/ogg';

      // Video
      case 'mp4':
        return 'video';
      case 'avi':
        return 'video/x-msvideo';
      case 'mkv':
        return 'video/x-matroska';

      // Compressed Archives
      case 'zip':
        return 'application/zip';
      case 'rar':
        return 'application/x-rar-compressed';
      case 'tar':
        return 'application/x-tar';
      case 'gz':
        return 'application/gzip';

      // Text
      case 'txt':
        return 'text/plain';
      case 'csv':
        return 'text/csv';
      case 'json':
        return 'application/json';
      case 'xml':
        return 'application/xml';

      // Programming
      case 'js':
        return 'application/javascript';
      case 'html':
        return 'text/html';
      case 'css':
        return 'text/css';
      case 'java':
        return 'text/x-java-source';
      case 'py':
        return 'text/x-python';

      // Fonts
      case 'ttf':
        return 'font/ttf';
      case 'otf':
        return 'font/otf';

      // Other
      case 'exe':
        return 'application/octet-stream';

      // Add more cases for other file types as needed

      default:
        return 'unknown';
    }
  }

  static Event buildEvent(
      {String? title,
      String description = '',
      int date = 0,
      int duration = 0}) {
    return Event(
      title: title!,
      description: description.isNotEmpty ? description : null,
      // location: 'Flutter app',
      startDate: date > 0
          ? DateTime.fromMillisecondsSinceEpoch(date * 1000)
          : DateTime.now(),
      endDate: date > 0
          ? DateTime.fromMillisecondsSinceEpoch(date * 1000)
              .add(Duration(minutes: duration))
          : DateTime.now().add(const Duration(minutes: 30)),
      allDay: false,
      iosParams: const IOSParams(
        reminder: Duration(minutes: 40),
        url: "http://example.com",
      ),
      androidParams: const AndroidParams(
        emailInvites: ["test@example.com"],
      ),
    );
  }

  // ex: duration = 210
  static String formatDuration(String time) {
    // Convert the string to an integer representing seconds
    int durationInSeconds = int.parse(time);

    // Create a Duration object
    Duration duration = Duration(minutes: durationInSeconds);

    // Calculate hours, minutes, and seconds
    int hours = duration.inHours;
    int minutes = (duration.inMinutes % 60);
    // int seconds = (duration.inSeconds % 60);

    // Format the time string
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';

    return formattedTime;
  }

  static String formatDurationVideo(String date) {
    Duration duration = parseDuration(date);

    String twoDigits(int n) => n.toString().padLeft(2, '0');

    if (duration.inHours > 0) {
      // If the duration has hours, format as hours:minutes:seconds
      return '${duration.inHours}:${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}';
    } else {
      // If there are no hours, format as minutes:seconds
      return '${duration.inMinutes}:${twoDigits(duration.inSeconds.remainder(60))}';
    }
  }

  static Duration parseDuration(String durationString) {
    List<String> parts = durationString.split(':');
    int hours = parts.length > 2 ? int.parse(parts[0]) : 0;
    int minutes = int.parse(parts[parts.length - 2]);
    int seconds = int.parse(parts[parts.length - 1].split('.')[0]);
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  static getBackUntilMain({required String stopRoute, dynamic result}) {
    if (Get.currentRoute == stopRoute) {
      return;
    }
    Get.back(result: result);
    getBackUntilMain(stopRoute: stopRoute, result: result);
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<void> launchMail(String email) async {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: email);
    if (!await launchUrl(emailLaunchUri)) {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  static Future<File?> pickPicture() async {
    final ImagePicker picker = ImagePicker();

    bool? isCamera;
    await Get.dialog(
      AlertDialog(
        scrollable: true,
        backgroundColor: ColorManager.whiteColor,
        elevation: 0,
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(
                Icons.camera,
                color: ColorManager.primary300Color,
              ),
              title: Text(
                LocaleKeys.camera.tr,
                style: TextManager.font16Text300W500,
              ),
              onTap: () {
                isCamera = true;
                Get.back();
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.image,
                color: ColorManager.primary300Color,
              ),
              title: Text(
                LocaleKeys.gallery.tr,
                style: TextManager.font16Text300W500,
              ),
              onTap: () {
                isCamera = false;
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
    if (isCamera == null) return null;
    final XFile? image = await picker.pickImage(
      source: isCamera! ? ImageSource.camera : ImageSource.gallery,
    );

    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static Future<void> launchInBrowser(String url) async {
    final Uri uriParse = Uri.parse(url);
    if (!await launchUrl(uriParse, mode: LaunchMode.externalApplication)) {
      throw 'could not launch $url';
    }
  }

  static void close({
    GestureTapCallback? onTapOk,
    required bool isLoading,
    required String title,
    required String content,
  }) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: ColorManager.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 15.r),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.sp,
            color: ColorManager.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        titlePadding: EdgeInsets.only(top: 15.r, bottom: 15.r),
        contentPadding: EdgeInsets.zero,
        content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.sp, color: ColorManager.grey5),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                      isLoading: isLoading,
                      colorBtn: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                      text: Text(
                        'Ok'.tr,
                        style: TextStyle(
                            fontSize: 15.sp, color: ColorManager.white),
                      ),
                      onPressed: onTapOk,
                      width: 1.sw,
                      paddingHorizontal: 10,
                      paddingVertical: 10,
                      marginHorizontal: 15,
                      radius: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: ButtonWidget(
                      colorBtn: ColorManager.grey10,
                      text: Text(
                        'Cancel'.tr,
                        style: TextStyle(
                            fontSize: 15.sp, color: ColorManager.black),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      width: 1.sw,
                      paddingHorizontal: 10,
                      paddingVertical: 10,
                      marginHorizontal: 15,
                      radius: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
            ]),
      ),
    );
  }
}
