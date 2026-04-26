import 'package:get/get.dart';

import '../../domain/entities/video.dart';
import 'task_info_model.dart';

class VideoModel extends Video {
  const VideoModel({
    required super.courseId,
    required super.itemId,
    required super.type,
    required super.title,
    required super.courseTitle,
    required super.taskInfo,
  });
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      courseId: Rx(json["courseId"]),
      itemId: Rx(json["itemId"]),
      type: Rx(json["type"]),
      title: Rx(json["title"]),
      courseTitle: Rx(json["courseTitle"]),
      taskInfo: Rx(TaskInfoModel.fromJson(json['taskInfo'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId.value,
      'itemId': itemId.value,
      'type': type.value,
      'title': title.value,
      'courseTitle': courseTitle.value,
      'taskInfo': (taskInfo.value as TaskInfoModel).toJson(),
    };
  }
}
