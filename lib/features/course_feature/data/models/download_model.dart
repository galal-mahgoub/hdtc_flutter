import 'package:hdtc_on/features/course_feature/data/models/files_chapter_model.dart';

import '../../domain/entities/download.dart';

class DownLoadModel extends DownLoad {
  DownLoadModel({
    required super.filePath,
    required super.titleCourse,
    required super.idCourse,
    required super.idUser,
    required super.contentDetails,
  });

  factory DownLoadModel.fromJson(Map<String, dynamic> json) {
    return DownLoadModel(
      filePath: json['filePath'],
      titleCourse: json['titleCourse'],
      idCourse: json['idCourse'],
      idUser: json['idUser'],
      contentDetails: FileModel.fromJson(json['contentDetails']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'filePath': filePath,
      'titleCourse': titleCourse,
      'idCourse': idCourse,
      'idUser': idUser,
      'contentDetails': (contentDetails as FileModel).toJson(),
    };
  }
}
