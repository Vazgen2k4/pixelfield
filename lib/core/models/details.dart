import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Details {
  @HiveField(0)
  final String distillery;

  @HiveField(1)
  final String region;

  @HiveField(2)
  final String country;

  @HiveField(3)
  final String type;

  @HiveField(4)
  final String ageStatement;

  @HiveField(5)
  final String filled;

  @HiveField(6)
  final String bottled;

  @HiveField(7)
  final String caskNumber;

  @HiveField(8)
  final double abv;

  @HiveField(9)
  final String size;

  @HiveField(10)
  final String finish;

  Details({
    required this.distillery,
    required this.region,
    required this.country,
    required this.type,
    required this.ageStatement,
    required this.filled,
    required this.bottled,
    required this.caskNumber,
    required this.abv,
    required this.size,
    required this.finish,
  });
}



class DetailsAdapter extends TypeAdapter<Details> {
  @override
  final int typeId = 1;

  @override
  Details read(BinaryReader reader) {
    return Details(
      distillery: reader.read(),
      region: reader.read(),
      country: reader.read(),
      type: reader.read(),
      ageStatement: reader.read(),
      filled: reader.read(),
      bottled: reader.read(),
      caskNumber: reader.read(),
      abv: reader.read(),
      size: reader.read(),
      finish: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Details obj) {
    writer.write(obj.distillery);
    writer.write(obj.region);
    writer.write(obj.country);
    writer.write(obj.type);
    writer.write(obj.ageStatement);
    writer.write(obj.filled);
    writer.write(obj.bottled);
    writer.write(obj.caskNumber);
    writer.write(obj.abv);
    writer.write(obj.size);
    writer.write(obj.finish);
  }
}