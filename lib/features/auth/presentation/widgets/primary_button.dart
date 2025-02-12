import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/theme/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primary),
          padding: WidgetStateProperty.all(EdgeInsets.all(16.0)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.blackSecondary,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            height: 24 / 16,
          ),
        ),
      ),
    );
  }
}
