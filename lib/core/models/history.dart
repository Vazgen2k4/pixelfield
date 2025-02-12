import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History {
  final String label;
  final String title;
  final String description;
  final List<String> imagePaths;

  History({
    required this.label,
    required this.title,
    required this.description,
    required this.imagePaths,
  });

  factory History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}