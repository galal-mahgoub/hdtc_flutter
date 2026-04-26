import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class ReplyTicketUseCase {
  final BaseOthersRepository baseOthersRepository;

  ReplyTicketUseCase({required this.baseOthersRepository});

  Future<Either<Failure, String>> call({
    required String ticketId,
    required String message,
    required PlatformFile file,
  }) async {
    return await baseOthersRepository.replyTicket(
      ticketId: ticketId,
      message: message,
      file: file,
    );
  }
}
