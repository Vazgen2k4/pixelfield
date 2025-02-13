

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';
import 'package:test_pixelfield/core/resources/resources.dart';

class BorderHistoryWidget extends StatelessWidget {
  const BorderHistoryWidget({
    super.key,
    required this.isLast,
    this.width = 32,
    this.squaresWidth = 16,
  });

  final bool isLast;
  final double width;
  final double squaresWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          if (!isLast) ...[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: AppColors.primary,
                height: 320,
                width: 2,
              ),
            ),
            Positioned(
              top: 100,
              left: width / 2 - squaresWidth / 2,
              child: SvgPicture.asset(
                AppIcons.squares,
                width: squaresWidth,
              ),
            ),
          ],
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ],
      ),
    );
  }
}
