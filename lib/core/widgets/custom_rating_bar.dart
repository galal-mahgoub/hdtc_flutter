import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../theme/color_manager.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: 16,
      maxRating: 5.0,
      initialRating: value,
      itemCount: 5,
      direction: Axis.horizontal,
      ignoreGestures: true,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: ColorManager.yellow,
        ),
        empty: const Icon(
          Icons.star,
          color: ColorManager.grey5,
        ),
        half: const Icon(Icons.star),
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
