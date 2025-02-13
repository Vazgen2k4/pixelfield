import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class TastingNote {
  @HiveField(0)
  final String author;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  TastingNote({
    required this.author,
    required this.title,
    required this.description,
  });

  factory TastingNote.fromJson(Map<String, dynamic> json) {
    return TastingNote(
      author: json['author'],
      title: json['title'],
      description: json['description'],
    );
  }
}

class TastingNoteAdapter extends TypeAdapter<TastingNote> {
  @override
  final int typeId = 3;

  @override
  TastingNote read(BinaryReader reader) {
    return TastingNote(
      author: reader.read(),
      title: reader.read(),
      description: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, TastingNote obj) {
    writer.write(obj.author);
    writer.write(obj.title);
    writer.write(obj.description);
  }
}
