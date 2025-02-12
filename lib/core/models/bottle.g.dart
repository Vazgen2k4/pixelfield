// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bottle _$BottleFromJson(Map<String, dynamic> json) => Bottle(
      name: json['name'] as String,
      bottleNumber: json['bottleNumber'] as String,
      details: Details.fromJson(json['details'] as Map<String, dynamic>),
      tastingNotes: (json['tastingNotes'] as List<dynamic>)
          .map((e) => TastingNote.fromJson(e as Map<String, dynamic>))
          .toList(),
      history: (json['history'] as List<dynamic>)
          .map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$BottleToJson(Bottle instance) => <String, dynamic>{
      'name': instance.name,
      'bottleNumber': instance.bottleNumber,
      'details': instance.details,
      'tastingNotes': instance.tastingNotes,
      'history': instance.history,
      'imagePath': instance.imagePath,
    };
