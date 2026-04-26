import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/video.dart';
import '../repositories/base_video_repository.dart';

class SaveVideosUseCase {
  final BaseVideoRepository baseVideoRepository;

  SaveVideosUseCase({required this.baseVideoRepository});

  Future<Either<Failure, Unit>> call({required List<Video> videos}) async {
    return await baseVideoRepository.writeVideos(
      videos: videos,
    );
  }
}
