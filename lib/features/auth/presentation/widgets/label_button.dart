
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/theme/app_colors.dart';
import 'package:test_pixelfield/features/auth/presentation/widgets/secondary_button.dart';

class LabelButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final String label;

  const LabelButtonWidget({
    super.key,
    required this.text,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.greySecondary,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              height: 1,
              letterSpacing: 32 * 0.005,
            ),
          ),
        ),
        SecondaryButtonWidget(
          text: text,
          onPressed: onPressed,
        ),
      ],
    );
  }
}

