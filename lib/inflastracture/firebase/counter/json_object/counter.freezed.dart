// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CounterJsonObject _$CounterJsonObjectFromJson(Map<String, dynamic> json) {
  return _CounterJsonObject.fromJson(json);
}

/// @nodoc
mixin _$CounterJsonObject {
  /// カウンター名
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  /// カウント数
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;

  /// カテゴリ情報
  @JsonKey(name: 'cagegory')
  String get category => throw _privateConstructorUsedError;

  /// 説明
  String? get description => throw _privateConstructorUsedError;

  /// 更新日時
  @JsonKey(name: 'updatedAt')
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounterJsonObjectCopyWith<CounterJsonObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterJsonObjectCopyWith<$Res> {
  factory $CounterJsonObjectCopyWith(
          CounterJsonObject value, $Res Function(CounterJsonObject) then) =
      _$CounterJsonObjectCopyWithImpl<$Res, CounterJsonObject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'count') int count,
      @JsonKey(name: 'cagegory') String category,
      String? description,
      @JsonKey(name: 'updatedAt') Timestamp updatedAt});
}

/// @nodoc
class _$CounterJsonObjectCopyWithImpl<$Res, $Val extends CounterJsonObject>
    implements $CounterJsonObjectCopyWith<$Res> {
  _$CounterJsonObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
    Object? category = null,
    Object? description = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CounterJsonObjectCopyWith<$Res>
    implements $CounterJsonObjectCopyWith<$Res> {
  factory _$$_CounterJsonObjectCopyWith(_$_CounterJsonObject value,
          $Res Function(_$_CounterJsonObject) then) =
      __$$_CounterJsonObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'count') int count,
      @JsonKey(name: 'cagegory') String category,
      String? description,
      @JsonKey(name: 'updatedAt') Timestamp updatedAt});
}

/// @nodoc
class __$$_CounterJsonObjectCopyWithImpl<$Res>
    extends _$CounterJsonObjectCopyWithImpl<$Res, _$_CounterJsonObject>
    implements _$$_CounterJsonObjectCopyWith<$Res> {
  __$$_CounterJsonObjectCopyWithImpl(
      _$_CounterJsonObject _value, $Res Function(_$_CounterJsonObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
    Object? category = null,
    Object? description = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_$_CounterJsonObject(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CounterJsonObject implements _CounterJsonObject {
  const _$_CounterJsonObject(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'count') required this.count,
      @JsonKey(name: 'cagegory') required this.category,
      this.description,
      @JsonKey(name: 'updatedAt') required this.updatedAt});

  factory _$_CounterJsonObject.fromJson(Map<String, dynamic> json) =>
      _$$_CounterJsonObjectFromJson(json);

  /// カウンター名
  @override
  @JsonKey(name: 'name')
  final String name;

  /// カウント数
  @override
  @JsonKey(name: 'count')
  final int count;

  /// カテゴリ情報
  @override
  @JsonKey(name: 'cagegory')
  final String category;

  /// 説明
  @override
  final String? description;

  /// 更新日時
  @override
  @JsonKey(name: 'updatedAt')
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'CounterJsonObject(name: $name, count: $count, category: $category, description: $description, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CounterJsonObject &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, count, category, description, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CounterJsonObjectCopyWith<_$_CounterJsonObject> get copyWith =>
      __$$_CounterJsonObjectCopyWithImpl<_$_CounterJsonObject>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CounterJsonObjectToJson(
      this,
    );
  }
}

abstract class _CounterJsonObject implements CounterJsonObject {
  const factory _CounterJsonObject(
          {@JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'count') required final int count,
          @JsonKey(name: 'cagegory') required final String category,
          final String? description,
          @JsonKey(name: 'updatedAt') required final Timestamp updatedAt}) =
      _$_CounterJsonObject;

  factory _CounterJsonObject.fromJson(Map<String, dynamic> json) =
      _$_CounterJsonObject.fromJson;

  @override

  /// カウンター名
  @JsonKey(name: 'name')
  String get name;
  @override

  /// カウント数
  @JsonKey(name: 'count')
  int get count;
  @override

  /// カテゴリ情報
  @JsonKey(name: 'cagegory')
  String get category;
  @override

  /// 説明
  String? get description;
  @override

  /// 更新日時
  @JsonKey(name: 'updatedAt')
  Timestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_CounterJsonObjectCopyWith<_$_CounterJsonObject> get copyWith =>
      throw _privateConstructorUsedError;
}
