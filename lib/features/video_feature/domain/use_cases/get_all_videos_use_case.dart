import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/video.dart';
import '../repositories/base_video_repository.dart';

class GetAllVideosUseCase {
  final BaseVideoRepository baseVideoRepository;

  GetAllVideosUseCase({required this.baseVideoRepository});

  Future<Either<Failure, List<Video>>> call() async {
    return await baseVideoRepository.readVideos();
  }
}
