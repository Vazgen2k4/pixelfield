// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      distillery: json['distillery'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      type: json['type'] as String,
      ageStatement: json['ageStatement'] as String,
      filled: json['filled'] as String,
      bottled: json['bottled'] as String,
      caskNumber: json['caskNumber'] as String,
      abv: (json['abv'] as num).toDouble(),
      size: json['size'] as String,
      finish: json['finish'] as String,
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'distillery': instance.distillery,
      'region': instance.region,
      'country': instance.country,
      'type': instance.type,
      'ageStatement': instance.ageStatement,
      'filled': instance.filled,
      'bottled': instance.bottled,
      'caskNumber': instance.caskNumber,
      'abv': instance.abv,
      'size': instance.size,
      'finish': instance.finish,
    };
