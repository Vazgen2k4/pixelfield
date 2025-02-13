import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/models/history.dart';
import 'package:test_pixelfield/features/collection/presentation/widgets/border_history_widget.dart';
import 'package:test_pixelfield/features/collection/presentation/widgets/history_item_content_widget.dart';

class HistoryItemWidget extends StatelessWidget {
  final History history;
  final bool isLast;

  const HistoryItemWidget({
    super.key,
    required this.history,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 24,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BorderHistoryWidget(isLast: isLast),
        Expanded(child: HistoryItemContentWidget(history: history)),
      ],
    );
  }
}
