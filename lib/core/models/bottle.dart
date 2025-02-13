import 'package:hive/hive.dart';
import 'details.dart';
import 'history.dart';
import 'tasting_note.dart';


@HiveType(typeId: 0)
class Bottle {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String bottleNumber;

  @HiveField(2)
  final Details details;

  @HiveField(3)
  final List<TastingNote> tastingNotes;

  @HiveField(4)
  final List<History> history;

  @HiveField(5)
  final String imagePath;

  Bottle({
    required this.name,
    required this.bottleNumber,
    required this.details,
    required this.tastingNotes,
    required this.history,
    required this.imagePath,
  });

  factory Bottle.fromJson(Map<String, dynamic> json) {
    return Bottle(
      name: json['name'],
      bottleNumber: json['bottleNumber'],
      details: Details.fromJson(json['details']),
      tastingNotes: List<TastingNote>.from(json['tastingNotes'].map((x) => TastingNote.fromJson(x))),
      history: List<History>.from(json['history'].map((x) => History.fromJson(x))),
      imagePath: json['imagePath'],
    );
  }
}

class BottleAdapter extends TypeAdapter<Bottle> {
  @override
  final int typeId = 0;

  @override
  Bottle read(BinaryReader reader) {
    return Bottle(
      name: reader.read(),
      bottleNumber: reader.read(),
      details: reader.read(),
      tastingNotes: List<TastingNote>.from(reader.read()),
      history: List<History>.from(reader.read()),
      imagePath: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Bottle obj) {
    writer.write(obj.name);
    writer.write(obj.bottleNumber);
    writer.write(obj.details);
    writer.write(obj.tastingNotes);
    writer.write(obj.history);
    writer.write(obj.imagePath);
  }
}
