import 'package:hdtc_on/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pod_player/pod_player.dart';

import '../theme/color_manager.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    super.key,
    required this.videoDemo,
    required this.videoDemoSource,
    this.isPause = false,
  });

  final String videoDemo;
  final String videoDemoSource;
  final bool isPause;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  bool showIconRefreshVideo = false;
  bool showLoadingVideo = false;
  bool isPlay = false;
  bool isMute = false;
  String currentDurationVideo = '00:00';

  late final PodPlayerController podPlayerController;

  @override
  void initState() {
    refreshVideoPlayer();
    super.initState();
  }

  String extractVideoId(String url) {
    RegExp regExp = RegExp(r"vimeo\.com\/(\d+)");
    RegExp regExp2 = RegExp(r"\/video\/(\d+)");
    RegExpMatch? match = regExp.firstMatch(url);
    RegExpMatch? match2 = regExp2.firstMatch(url);
    if (match != null && match.groupCount == 1) {
      return match.group(1) ?? '';
    } else if (match2 != null && match2.groupCount == 1) {
      return match2.group(1) ?? '';
    }
    {
      return '';
    }
  }

  refreshVideoPlayer() async {
    try {
      if (widget.videoDemo.isNotEmpty) {
        podPlayerController = PodPlayerController(
          playVideoFrom: widget.videoDemoSource == 'youtube'
              ? PlayVideoFrom.youtube(widget.videoDemo)
              : widget.videoDemoSource == 'vimeo' ||
                      widget.videoDemoSource == 'iframe'
                  ? PlayVideoFrom.vimeoPrivateVideos(
                      extractVideoId(widget.videoDemo),
                      httpHeaders: {
                        'Accept': 'application/vnd.vimeo.*+json;version=3.4',
                        'Content-Type': 'application/json',
                        "Authorization":
                            "bearer 9599b0ead91c939cf3f778201c14194c"
                      },
                    )
                  : PlayVideoFrom.network(widget.videoDemo),
          podPlayerConfig: const PodPlayerConfig(
            autoPlay: false,
            isLooping: false,
          ),
        )..initialise();

        if (podPlayerController.isInitialised) {
          showIconRefreshVideo = false;
        }
        showLoadingVideo = false;

        podPlayerController.addListener(() {
          setState(() {
            currentDurationVideo = Utils.formatDurationVideo(
                podPlayerController.currentVideoPosition.toString());
            isMute = podPlayerController.isMute;
            isPlay = podPlayerController.isVideoPlaying;
          });
        });
      }
    } catch (error) {
      showLoadingVideo = false;
      showIconRefreshVideo = true;
    }
  }

  @override
  void dispose() {
    podPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          child: PodVideoPlayer(controller: podPlayerController),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            color: ColorManager.white,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  podPlayerController.togglePlayPause();
                },
                child: Icon(
                  isPlay
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                  size: 35.sp,
                  color: ColorManager.grey11,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Text(
                  '$currentDurationVideo/${Utils.formatDurationVideo(podPlayerController.totalVideoLength.toString())}',
                  style: TextStyle(
                    color: ColorManager.grey9,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  podPlayerController.toggleVolume();
                },
                child: Icon(
                  isMute ? Icons.volume_mute : Icons.volume_down,
                  size: 35.sp,
                  color: ColorManager.grey11,
                ),
              ),
              InkWell(
                onTap: () {
                  if (podPlayerController.isFullScreen) {
                    podPlayerController.disableFullScreen(context);
                  } else {
                    podPlayerController.enableFullScreen();
                  }
                },
                child: Icon(
                  Icons.fullscreen,
                  size: 35.sp,
                  color: ColorManager.grey11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
