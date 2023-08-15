// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'string_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StringValue {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StringValueCopyWith<StringValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StringValueCopyWith<$Res> {
  factory $StringValueCopyWith(
          StringValue value, $Res Function(StringValue) then) =
      _$StringValueCopyWithImpl<$Res, StringValue>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$StringValueCopyWithImpl<$Res, $Val extends StringValue>
    implements $StringValueCopyWith<$Res> {
  _$StringValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StringValueCopyWith<$Res>
    implements $StringValueCopyWith<$Res> {
  factory _$$_StringValueCopyWith(
          _$_StringValue value, $Res Function(_$_StringValue) then) =
      __$$_StringValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_StringValueCopyWithImpl<$Res>
    extends _$StringValueCopyWithImpl<$Res, _$_StringValue>
    implements _$$_StringValueCopyWith<$Res> {
  __$$_StringValueCopyWithImpl(
      _$_StringValue _value, $Res Function(_$_StringValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_StringValue(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StringValue extends _StringValue {
  _$_StringValue([this.value = '']) : super._();

  @override
  @JsonKey()
  final String value;

  @override
  String toString() {
    return 'StringValue(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StringValue &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StringValueCopyWith<_$_StringValue> get copyWith =>
      __$$_StringValueCopyWithImpl<_$_StringValue>(this, _$identity);
}

abstract class _StringValue extends StringValue {
  factory _StringValue([final String value]) = _$_StringValue;
  _StringValue._() : super._();

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_StringValueCopyWith<_$_StringValue> get copyWith =>
      throw _privateConstructorUsedError;
}
