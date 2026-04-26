import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverlayImageZoomable extends StatelessWidget {
  const OverlayImageZoomable({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10.r),
        child: Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              tooltip: 'Close',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
