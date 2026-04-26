import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/ticket.dart';
import '../repositories/base_others_repository.dart';

class GetTicketsUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetTicketsUseCase({required this.baseOthersRepository});

  Future<Either<Failure,List<Ticket>>> call() async {
    return await baseOthersRepository.getTickets();
  }
}
