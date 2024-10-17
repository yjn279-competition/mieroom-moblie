// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      birthDate: json['birthDate'] as String,
      gender: json['gender'] as String,
      myNumber: json['myNumber'] as String,
      familyNumbers: (json['familyNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      specialNotes: json['specialNotes'] as String,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'myNumber': instance.myNumber,
      'familyNumbers': instance.familyNumbers,
      'specialNotes': instance.specialNotes,
    };
