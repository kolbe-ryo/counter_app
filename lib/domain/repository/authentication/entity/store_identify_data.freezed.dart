// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_identify_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoreIdentifyData {
  StringValue get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreIdentifyDataCopyWith<StoreIdentifyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreIdentifyDataCopyWith<$Res> {
  factory $StoreIdentifyDataCopyWith(
          StoreIdentifyData value, $Res Function(StoreIdentifyData) then) =
      _$StoreIdentifyDataCopyWithImpl<$Res, StoreIdentifyData>;
  @useResult
  $Res call({StringValue id});

  $StringValueCopyWith<$Res> get id;
}

/// @nodoc
class _$StoreIdentifyDataCopyWithImpl<$Res, $Val extends StoreIdentifyData>
    implements $StoreIdentifyDataCopyWith<$Res> {
  _$StoreIdentifyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StringValueCopyWith<$Res> get id {
    return $StringValueCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StoreIdentifyDataCopyWith<$Res>
    implements $StoreIdentifyDataCopyWith<$Res> {
  factory _$$_StoreIdentifyDataCopyWith(_$_StoreIdentifyData value,
          $Res Function(_$_StoreIdentifyData) then) =
      __$$_StoreIdentifyDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StringValue id});

  @override
  $StringValueCopyWith<$Res> get id;
}

/// @nodoc
class __$$_StoreIdentifyDataCopyWithImpl<$Res>
    extends _$StoreIdentifyDataCopyWithImpl<$Res, _$_StoreIdentifyData>
    implements _$$_StoreIdentifyDataCopyWith<$Res> {
  __$$_StoreIdentifyDataCopyWithImpl(
      _$_StoreIdentifyData _value, $Res Function(_$_StoreIdentifyData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_StoreIdentifyData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_StoreIdentifyData implements _StoreIdentifyData {
  const _$_StoreIdentifyData({required this.id});

  @override
  final StringValue id;

  @override
  String toString() {
    return 'StoreIdentifyData._(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreIdentifyData &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreIdentifyDataCopyWith<_$_StoreIdentifyData> get copyWith =>
      __$$_StoreIdentifyDataCopyWithImpl<_$_StoreIdentifyData>(
          this, _$identity);
}

abstract class _StoreIdentifyData implements StoreIdentifyData {
  const factory _StoreIdentifyData({required final StringValue id}) =
      _$_StoreIdentifyData;

  @override
  StringValue get id;
  @override
  @JsonKey(ignore: true)
  _$$_StoreIdentifyDataCopyWith<_$_StoreIdentifyData> get copyWith =>
      throw _privateConstructorUsedError;
}
