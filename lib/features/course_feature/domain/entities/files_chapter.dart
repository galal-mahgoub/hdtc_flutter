import 'package:equatable/equatable.dart';

import 'quiz.dart';

class FilesChapter extends Equatable {
  final int id;
  final String title;
  final int topicsCount;
  final String duration;
  final String status;
  final List<Session> sessions;
  final List<dynamic> textLessons;
  final List<File> files;
  final List<Quiz> quizzes;
  final int? order;
  final String? type;
  final String createdAt;

  const FilesChapter({
    required this.id,
    required this.title,
    required this.topicsCount,
    required this.duration,
    required this.status,
    required this.sessions,
    required this.textLessons,
    required this.files,
    required this.quizzes,
    this.order,
    this.type,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        topicsCount,
        duration,
        status,
        sessions,
        textLessons,
        files,
        quizzes,
        order,
        type,
        createdAt,
      ];
}

class File extends Equatable {
  final int id;
  final String title;
  final bool? authHasRead;
  final String status;
  final String? order;
  final String downloadable;
  final String accessibility;
  final String? description;
  final String storage;
  final String downloadLink;
  final bool? authHasAccess;
  final bool userHasAccess;
  final String file;
  final String volume;
  final String? fileType;
  final bool isVideo;
  final String? interactiveType;
  final String? interactiveFileName;
  final String? interactiveFilePath;
  final String createdAt;
  final String? updatedAt;

  const File({
    required this.id,
    required this.title,
    required this.authHasRead,
    required this.status,
    required this.order,
    required this.downloadable,
    required this.accessibility,
    required this.description,
    required this.storage,
    required this.downloadLink,
    required this.authHasAccess,
    required this.userHasAccess,
    required this.file,
    required this.volume,
    required this.fileType,
    required this.isVideo,
    required this.interactiveType,
    required this.interactiveFileName,
    required this.interactiveFilePath,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        authHasRead,
        status,
        order,
        downloadable,
        accessibility,
        description,
        storage,
        downloadLink,
        authHasAccess,
        userHasAccess,
        file,
        volume,
        fileType,
        isVideo,
        interactiveType,
        interactiveFileName,
        interactiveFilePath,
        createdAt,
        updatedAt,
      ];
}

class Session extends Equatable {
  final int id;
  final String title;
  final bool? authHasRead;
  final bool userHasAccess;
  final bool isFinished;
  final bool isStarted;
  final String status;
  final int? order;
  final String? moderatorSecret;
  final String date;
  final String duration;
  final String? link;
  final String? joinLink;
  final bool canJoin;
  final String sessionApi;
  final String? zoomStartLink;
  final String? apiSecret;
  final String? description;
  final String createdAt;
  final String? updatedAt;
  final dynamic agoraSettings;

  const Session({
    required this.id,
    required this.title,
    required this.authHasRead,
    required this.userHasAccess,
    required this.isFinished,
    required this.isStarted,
    required this.status,
    required this.order,
    required this.moderatorSecret,
    required this.date,
    required this.duration,
    required this.link,
    required this.joinLink,
    required this.canJoin,
    required this.sessionApi,
    required this.zoomStartLink,
    required this.apiSecret,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.agoraSettings,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        authHasRead,
        userHasAccess,
        isFinished,
        isStarted,
        status,
        order,
        moderatorSecret,
        date,
        duration,
        link,
        joinLink,
        canJoin,
        sessionApi,
        zoomStartLink,
        apiSecret,
        description,
        createdAt,
        updatedAt,
        agoraSettings,
      ];
}
