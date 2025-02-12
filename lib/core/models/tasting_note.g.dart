// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasting_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TastingNote _$TastingNoteFromJson(Map<String, dynamic> json) => TastingNote(
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TastingNoteToJson(TastingNote instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
    };
