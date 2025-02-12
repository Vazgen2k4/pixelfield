import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/theme/app_colors.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SecondaryButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            height: 24 / 16,
            letterSpacing: 32 * 0.005,
          ),
        ),
      ),
    );
  }
}

