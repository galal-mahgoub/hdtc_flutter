import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_video_repository.dart';

class RemoveVideosUseCase {
  final BaseVideoRepository baseVideoRepository;

  RemoveVideosUseCase({required this.baseVideoRepository});

  Future<Either<Failure, Unit>> call() async {
    return await baseVideoRepository.removeVideos();
  }
}
