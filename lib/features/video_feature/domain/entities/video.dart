import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import 'task_info.dart';

class Video extends Equatable {
  final Rx<String> courseId;
  final Rx<String> itemId;
  final Rx<String> type;
  final Rx<String> title;
  final Rx<String> courseTitle;
  final Rx<TaskInfo> taskInfo;

  const Video({
    required this.courseId,
    required this.itemId,
    required this.type,
    required this.title,
    required this.courseTitle,
    required this.taskInfo,
  });

  @override
  List<Object?> get props => [
        courseId,itemId,
        type,
        title,
        courseTitle,
        taskInfo,
      ];
}
