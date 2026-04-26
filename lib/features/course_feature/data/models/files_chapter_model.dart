import 'package:hdtc_on/features/course_feature/data/models/quiz_model.dart';

import '../../domain/entities/files_chapter.dart';

class FilesChapterModel extends FilesChapter {
  const FilesChapterModel({
    required super.id,
    required super.title,
    required super.topicsCount,
    required super.duration,
    required super.status,
    required super.textLessons,
    required super.files,
    required super.sessions,
    required super.quizzes,
    super.order,
    super.type,
    required super.createdAt,
  });

  factory FilesChapterModel.fromJson(Map<String, dynamic> json) {
    return FilesChapterModel(
      id: json['id'],
      title: json['title'],
      topicsCount: json['topics_count'],
      duration: json['duration'],
      status: json['status'],
      textLessons: json['textLessons'],
      files: (json['files'] as List)
          .map((fileJson) => FileModel.fromJson(fileJson))
          .toList(),
      sessions: (json['sessions'] as List)
          .map((sessionJson) => SessionModel.fromJson(sessionJson))
          .toList(),
      quizzes: json['quizzes'] == null
          ? []
          : List.from(json['quizzes'])
              .map(
                (e) => QuizModel.fromJson(e),
              )
              .toList(),
      order: json['order'],
      type: json['type'],
      createdAt: json['created_at'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'topics_count': topicsCount,
      'duration': duration,
      'status': status,
      'textLessons': textLessons,
      'files': files.map((file) => (file as FileModel).toJson()).toList(),
      'quizzes': quizzes,
      'order': order,
      'type': type,
      'created_at': createdAt,
    };
  }
}

class FileModel extends File {
  const FileModel({
    required super.id,
    required super.title,
    required super.authHasRead,
    required super.status,
    required super.order,
    required super.downloadable,
    required super.accessibility,
    required super.description,
    required super.storage,
    required super.downloadLink,
    required super.authHasAccess,
    required super.userHasAccess,
    required super.file,
    required super.volume,
    required super.fileType,
    required super.isVideo,
    required super.interactiveType,
    required super.interactiveFileName,
    required super.interactiveFilePath,
    required super.createdAt,
    required super.updatedAt,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      id: json['id'],
      title: json['title'],
      authHasRead: json['auth_has_read'],
      status: json['status'],
      order: json['order'],
      downloadable: json['downloadable']?.toString() ?? '0',
      accessibility: json['accessibility'],
      description: json['description'],
      storage: json['storage'],
      downloadLink: json['download_link'],
      authHasAccess: json['auth_has_access'],
      userHasAccess: json['user_has_access'],
      file: json['file'],
      volume: json['volume'],
      fileType: json['file_type'] ?? '',
      isVideo: json['is_video'],
      interactiveType: json['interactive_type'],
      interactiveFileName: json['interactive_file_name'],
      interactiveFilePath: json['interactive_file_path'],
      createdAt: json['created_at'].toString(),
      updatedAt: json['updated_at'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'auth_has_read': authHasRead,
      'status': status,
      'order': order,
      'downloadable': downloadable,
      'accessibility': accessibility,
      'description': description,
      'storage': storage,
      'download_link': downloadLink,
      'auth_has_access': authHasAccess,
      'user_has_access': userHasAccess,
      'file': file,
      'volume': volume,
      'file_type': fileType,
      'is_video': isVideo,
      'interactive_type': interactiveType,
      'interactive_file_name': interactiveFileName,
      'interactive_file_path': interactiveFilePath,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class SessionModel extends Session {
  const SessionModel({
    required super.id,
    required super.title,
    required super.authHasRead,
    required super.userHasAccess,
    required super.isFinished,
    required super.isStarted,
    required super.status,
    required super.order,
    required super.moderatorSecret,
    required super.date,
    required super.duration,
    required super.link,
    required super.joinLink,
    required super.canJoin,
    required super.sessionApi,
    required super.zoomStartLink,
    required super.apiSecret,
    required super.description,
    required super.createdAt,
    required super.updatedAt,
    required super.agoraSettings,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      id: json['id'],
      title: json['title'],
      authHasRead: json['auth_has_read'],
      userHasAccess: json['user_has_access'],
      isFinished: json['is_finished'],
      isStarted: json['is_started'],
      status: json['status'],
      order: int.tryParse(json['order'].toString()),
      moderatorSecret: json['moderator_secret'],
      date: json['date'],
      duration: json['duration'],
      link: json['link'],
      joinLink: json['join_link'],
      canJoin: json['can_join'],
      sessionApi: json['session_api'],
      zoomStartLink: json['zoom_start_link'],
      apiSecret: json['api_secret'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      agoraSettings: json['agora_settings'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'auth_has_read': authHasRead,
      'user_has_access': userHasAccess,
      'is_finished': isFinished,
      'is_started': isStarted,
      'status': status,
      'order': order,
      'moderator_secret': moderatorSecret,
      'date': date,
      'duration': duration,
      'link': link,
      'join_link': joinLink,
      'can_join': canJoin,
      'session_api': sessionApi,
      'zoom_start_link': zoomStartLink,
      'api_secret': apiSecret,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'agora_settings': agoraSettings,
    };
  }
}
