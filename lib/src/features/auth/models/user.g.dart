// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      completed: json['completed'] as bool? ?? false,
      email: json['email'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      birthdate: json['birthdate'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'surname': instance.surname,
      'completed': instance.completed,
      'email': instance.email,
      'image': instance.image,
      'phone': instance.phone,
      'birthdate': instance.birthdate,
      'gender': _$GenderEnumMap[instance.gender],
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.nonBinary: 'nonBinary',
};
