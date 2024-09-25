// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteering.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VolunteeringImpl _$$VolunteeringImplFromJson(Map<String, dynamic> json) =>
    _$VolunteeringImpl(
      id: json['id'] as String,
      about: json['about'] as String,
      availability: (json['availability'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrl: json['imageUrl'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      name: json['name'] as String,
      purpose: json['purpose'] as String,
      requirements: (json['requirements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      vacancies: (json['vacancies'] as num).toInt(),
      creationDate: (json['creationDate'] as num).toDouble(),
    );

Map<String, dynamic> _$$VolunteeringImplToJson(_$VolunteeringImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'about': instance.about,
      'availability': instance.availability,
      'imageUrl': instance.imageUrl,
      'location': instance.location,
      'name': instance.name,
      'purpose': instance.purpose,
      'requirements': instance.requirements,
      'vacancies': instance.vacancies,
      'creationDate': instance.creationDate,
    };
