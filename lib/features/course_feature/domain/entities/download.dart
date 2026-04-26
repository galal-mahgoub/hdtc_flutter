import 'files_chapter.dart';

class DownLoad {
  DownLoad({
    String? filePath,
    String? titleCourse,
    int? idCourse,
    String? idUser,
    File? contentDetails,
  }) {
    _filePath = filePath;
    _titleCourse = titleCourse;
    _idCourse = idCourse;
    _idUser = idUser;
    _contentDetails = contentDetails;
  }

  String? _filePath;

  File? _contentDetails;

  String? _titleCourse;

  int? _idCourse;

  String? _idUser;

  String? get filePath => _filePath;

  String? get titleCourse => _titleCourse;

  int? get idCourse => _idCourse;

  String? get idUser => _idUser;

  File? get contentDetails => _contentDetails;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownLoad &&
          runtimeType == other.runtimeType &&
          _titleCourse == other._titleCourse &&
          _idUser == other._idUser &&
          _idCourse == other._idCourse;

  @override
  int get hashCode =>
      _titleCourse.hashCode ^ _idUser.hashCode ^ _idCourse.hashCode;

  @override
  String toString() {
    return 'DownLoadModel{_filePath: $_filePath, _contentDetails: $_contentDetails, _titleCourse: $_titleCourse, _idCourse: $_idCourse, _idUser: $_idUser}';
  }
}
