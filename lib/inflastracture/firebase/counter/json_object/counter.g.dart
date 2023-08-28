// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CounterJsonObject _$$_CounterJsonObjectFromJson(Map<String, dynamic> json) =>
    _$_CounterJsonObject(
      name: json['name'] as String,
      count: json['count'] as int,
      category: json['cagegory'] as String,
      description: json['description'] as String?,
      updatedAt: const TimestampConverter().fromJson(json['updatedAt'] as int),
    );

Map<String, dynamic> _$$_CounterJsonObjectToJson(
        _$_CounterJsonObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'cagegory': instance.category,
      'description': instance.description,
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
