import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/core/models/tasting_note.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';
import 'package:test_pixelfield/core/presentation/widgets/title.dart';

class NotesTabContent extends StatelessWidget {
  final Bottle bottle;
  const NotesTabContent(this.bottle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Container(
          color: AppColors.blackSecondary,
          width: double.infinity,
          height: 223,
          child: Icon(
            Icons.play_arrow_rounded,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 8),
        
        TitleWidget(
          text: 'Tasting notes',
          textAlign: TextAlign.left,
        ),
        TitleWidget.subtitle(
          text: 'by Charles MacLean MBE',
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8),
        ...bottle.tastingNotes.map((note) => _NoteWidget(note: note)),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleWidget(text: 'Tasting notes'),
            Icon(
              Icons.arrow_back,
              color: AppColors.white,
              size: 24,
            ),
          ],
        ),
        SizedBox(height: 8),
        ...bottle.tastingNotes.map((note) => _NoteWidget(note: note)),
      ],
    );
  }
}

class _NoteWidget extends StatelessWidget {
  const _NoteWidget({
    required this.note,
  });

  final TastingNote note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      color: AppColors.blackSecondary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            note.title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              height: 24 / 16,
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              note.description,
              style: TextStyle(
                color: AppColors.greySecondary,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                height: 24 / 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
