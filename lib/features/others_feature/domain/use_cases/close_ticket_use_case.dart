import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class CloseTicketUseCase {
  final BaseOthersRepository baseOthersRepository;

  CloseTicketUseCase({required this.baseOthersRepository});

  Future<Either<Failure, String>> call({
    required String ticketId,
  }) async {
    return await baseOthersRepository.closeTicket(
      ticketId: ticketId,
    );
  }
}
