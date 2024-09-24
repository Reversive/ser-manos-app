// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      city: json['city'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      number: (json['number'] as num).toInt(),
      state: json['state'] as String,
      street: json['street'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'lat': instance.lat,
      'lng': instance.lng,
      'number': instance.number,
      'state': instance.state,
      'street': instance.street,
    };
