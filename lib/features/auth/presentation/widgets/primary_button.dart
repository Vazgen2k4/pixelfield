import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final EdgeInsets padding;

  const PrimaryButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      text,
      style: TextStyle(
        color: AppColors.blackSecondary,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        height: 24 / 16,
      ),
    );

    if (icon != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.blackSecondary,
            size: 24.0,
          ),
          SizedBox(width: 8),
          child,
        ],
      );
    }

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        padding: WidgetStateProperty.all(padding),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
