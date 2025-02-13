import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/models/history.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';

class HistoryItemContentWidget extends StatelessWidget {
  const HistoryItemContentWidget({
    super.key,
    required this.history,
  });

  final History history;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        AutoSizeText(
          history.label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            height: 16 / 12,
          ),
        ),
        AutoSizeText(
          history.title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            height: 26 / 22,
          ),
        ),
        AutoSizeText(
          history.description,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: AppColors.blackSecondary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.attach_file_rounded,
                    size: 16,
                  ),
                  Text(
                    'Attachments',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 8,
                children: List.generate(3, _mocksAttachments),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mocksAttachments(index) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.greyPrimary,
          ),
        ),
      ),
    );
  }
}
