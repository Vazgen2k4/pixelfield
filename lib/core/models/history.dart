import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class History {
  @HiveField(0)
  final String label;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final List<String> imagePaths;

  History({
    required this.label,
    required this.title,
    required this.description,
    required this.imagePaths,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      label: json['label'],
      title: json['title'],
      description: json['description'],
      imagePaths: List<String>.from(json['imagePaths'].map((x) => x)),
    );
  }
}

class HistoryAdapter extends TypeAdapter<History> {
  @override
  final int typeId = 2;

  @override
  History read(BinaryReader reader) {
    return History(
      label: reader.read(),
      title: reader.read(),
      description: reader.read(),
      imagePaths: List<String>.from(reader.read()),
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer.write(obj.label);
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.imagePaths);
  }
}
