import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/models/history.dart';
import 'package:test_pixelfield/features/collection/presentation/widgets/history_item_widget.dart';

class HistoryTabContent extends StatelessWidget {
  final List<History> histories;
  const HistoryTabContent(this.histories, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: histories.length,
      itemBuilder: (context, index) {
        final history = histories[index];
        return HistoryItemWidget(
          history: history,
          isLast: index == histories.length - 1,
        );
      },
    );
  }
}

