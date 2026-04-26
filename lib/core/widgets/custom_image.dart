import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/color_manager.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.path,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);
  final dynamic path;
  final BoxFit fit;
  final double? height, width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (path is File) {
      return Image.file(
        path,
        fit: fit,
        color: color,
        height: height,
        width: width,
      );
    }
    if (path is String &&
        (path.contains("file_picker") || path.contains("cache"))) {
      return Image.file(
        File(path),
        fit: fit,
        color: color,
        height: height,
        width: width,
      );
    }
    if (path is Uint8List) {
      return Image.memory(
        path,
        fit: fit,
        color: color,
        height: height,
        width: width,
      );
    }

    if (path.startsWith('http') ||
        path.startsWith('https') ||
        path.startsWith('www.')) {
      return CachedNetworkImage(
        imageUrl: path,
        fit: fit,
        width: width,
        height: height,
        color: color,
        errorWidget: (BuildContext context, _, stackTrace) {
          return const Center(
            child: Icon(Icons.error),
          );
        },
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
            child: SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                color: ColorManager.primary300Color,
                value: downloadProgress.progress,
              ),
            ),
          );
        },
      );
    }
    if (path.endsWith('.svg')) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          path,
          fit: fit,
          height: height,
          width: width,
          colorFilter: color == null
              ? null
              : ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                ),
        ),
      );
    }
    return Image.asset(
      path,
      fit: fit,
      color: color,
      height: height,
      width: width,
    );
  }
}
