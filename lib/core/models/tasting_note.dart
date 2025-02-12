import 'package:json_annotation/json_annotation.dart';

 part 'tasting_note.g.dart';

@JsonSerializable()
class TastingNote {
  final String author;
  final String title;
  final String description;

  TastingNote({
    required this.author,
    required this.title,
    required this.description,
  });

  factory TastingNote.fromJson(Map<String, dynamic> json) =>
      _$TastingNoteFromJson(json);
  Map<String, dynamic> toJson() => _$TastingNoteToJson(this);
}