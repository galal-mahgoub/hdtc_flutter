import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class SendTicketUseCase {
  final BaseOthersRepository baseOthersRepository;

  SendTicketUseCase({required this.baseOthersRepository});

  Future<Either<Failure, String>> call({
    required String departmentId,
    required String webinarId,
    required String title,
    required String type,
    required PlatformFile file,
    required String message,
  }) async {
    return await baseOthersRepository.sendTicket(
      departmentId: departmentId,
      webinarId: webinarId,
      title: title,
      type: type,
      file: file,
      message: message,
    );
  }
}
