// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatusImpl _$$UserStatusImplFromJson(Map<String, dynamic> json) =>
    _$UserStatusImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      isInShelter: json['isInShelter'] as bool,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$UserStatusImplToJson(_$UserStatusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'isInShelter': instance.isInShelter,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
