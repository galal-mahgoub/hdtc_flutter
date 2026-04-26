// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

class TaskInfo extends Equatable {
  Rx<String> name;
  Rx<String> link;
  Rx<String> taskId;
  Rx<int> progress;
  Rx<DownloadTaskStatus> status;

  TaskInfo({
    required this.name,
    required this.link,
    required this.taskId,
    required this.progress,
    required this.status,
  });

  @override
  List<Object?> get props => [
        name,
        link,
        taskId,
        progress,
        status,
      ];
}
