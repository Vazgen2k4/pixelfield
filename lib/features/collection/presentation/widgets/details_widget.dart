
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            height: 24 / 16,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColors.greySecondary,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            height: 24 / 16,
          ),
        ),
      ],
    );
  }
}
