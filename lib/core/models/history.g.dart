// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      label: json['label'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imagePaths: (json['imagePaths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'label': instance.label,
      'title': instance.title,
      'description': instance.description,
      'imagePaths': instance.imagePaths,
    };
