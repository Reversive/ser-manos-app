// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      id: (json['id'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String,
      source: json['source'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'source': instance.source,
      'title': instance.title,
      'summary': instance.summary,
      'content': instance.content,
    };
