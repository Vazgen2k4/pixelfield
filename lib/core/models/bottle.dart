import 'package:json_annotation/json_annotation.dart';
import 'package:test_pixelfield/core/models/details.dart';
import 'package:test_pixelfield/core/models/history.dart';
import 'package:test_pixelfield/core/models/tasting_note.dart';

part 'bottle.g.dart';

@JsonSerializable()
class Bottle {
  final String name;

  final String bottleNumber;

  final Details details;

  final List<TastingNote> tastingNotes;

  final List<History> history;

  final String imagePath;

  Bottle({
    required this.name,
    required this.bottleNumber,
    required this.details,
    required this.tastingNotes,
    required this.history,
    required this.imagePath,
  });

  factory Bottle.fromJson(Map<String, dynamic> json) => _$BottleFromJson(json);
  Map<String, dynamic> toJson() => _$BottleToJson(this);
}
