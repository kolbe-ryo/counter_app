// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CountValue {
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountValueCopyWith<CountValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountValueCopyWith<$Res> {
  factory $CountValueCopyWith(
          CountValue value, $Res Function(CountValue) then) =
      _$CountValueCopyWithImpl<$Res, CountValue>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class _$CountValueCopyWithImpl<$Res, $Val extends CountValue>
    implements $CountValueCopyWith<$Res> {
  _$CountValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountValueCopyWith<$Res>
    implements $CountValueCopyWith<$Res> {
  factory _$$_CountValueCopyWith(
          _$_CountValue value, $Res Function(_$_CountValue) then) =
      __$$_CountValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$_CountValueCopyWithImpl<$Res>
    extends _$CountValueCopyWithImpl<$Res, _$_CountValue>
    implements _$$_CountValueCopyWith<$Res> {
  __$$_CountValueCopyWithImpl(
      _$_CountValue _value, $Res Function(_$_CountValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$_CountValue(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CountValue extends _CountValue {
  const _$_CountValue([this.count = 0]) : super._();

  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'CountValue(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountValue &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountValueCopyWith<_$_CountValue> get copyWith =>
      __$$_CountValueCopyWithImpl<_$_CountValue>(this, _$identity);
}

abstract class _CountValue extends CountValue {
  const factory _CountValue([final int count]) = _$_CountValue;
  const _CountValue._() : super._();

  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_CountValueCopyWith<_$_CountValue> get copyWith =>
      throw _privateConstructorUsedError;
}
