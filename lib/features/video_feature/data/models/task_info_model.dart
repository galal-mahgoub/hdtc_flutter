// ignore_for_file: must_be_immutable

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

import '../../domain/entities/task_info.dart';

class TaskInfoModel extends TaskInfo {
  TaskInfoModel({
    required super.name,
    required super.link,
    required super.taskId,
    required super.progress,
    required super.status,
  });

  factory TaskInfoModel.fromJson(Map<String, dynamic> json) {
    return TaskInfoModel(
      name: Rx(json['name']),
      link: Rx(json['link']),
      taskId: Rx(json['taskId']),
      progress: Rx(json['progress']),
      status: checkStatus(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name.value,
      'link': link.value,
      'taskId': taskId.value,
      'progress': progress.value,
      'status': status.value.name,
    };
  }
}

Rx<DownloadTaskStatus> checkStatus(String status) {
  switch (status) {
    case 'canceled':
      return DownloadTaskStatus.canceled.obs;
    case 'complete':
      return DownloadTaskStatus.complete.obs;
    case 'enqueued':
      return DownloadTaskStatus.enqueued.obs;
    case 'failed':
      return DownloadTaskStatus.failed.obs;
    case 'paused':
      return DownloadTaskStatus.paused.obs;
    case 'running':
      return DownloadTaskStatus.running.obs;

    default:
      return DownloadTaskStatus.undefined.obs;
  }
}
