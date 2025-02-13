import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final bool _isSubtitle;

  const TitleWidget({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
  }) : _isSubtitle = false;

  const TitleWidget.subtitle({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
  }) : _isSubtitle = true;

  @override
  Widget build(BuildContext context) {
    final style = _isSubtitle
        ? TextStyle(
            color: AppColors.greyPrimary,
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            height: 24 / 16,
            letterSpacing: 32 * 0.005,
          )
        : TextStyle(
            color: AppColors.greyPrimary,
            fontSize: _isSubtitle ? 16.0 : 32.0,
            fontWeight: FontWeight.w500,
            height: _isSubtitle ? 24 / 16 : 40 / 32,
          
          );

    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
