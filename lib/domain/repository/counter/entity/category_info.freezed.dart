// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryInfo {
  /// カテゴリ名
  String get name => throw _privateConstructorUsedError;

  /// カテゴリカラー
  Color get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryInfoCopyWith<CategoryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInfoCopyWith<$Res> {
  factory $CategoryInfoCopyWith(
          CategoryInfo value, $Res Function(CategoryInfo) then) =
      _$CategoryInfoCopyWithImpl<$Res, CategoryInfo>;
  @useResult
  $Res call({String name, Color color});
}

/// @nodoc
class _$CategoryInfoCopyWithImpl<$Res, $Val extends CategoryInfo>
    implements $CategoryInfoCopyWith<$Res> {
  _$CategoryInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryInfoCopyWith<$Res>
    implements $CategoryInfoCopyWith<$Res> {
  factory _$$_CategoryInfoCopyWith(
          _$_CategoryInfo value, $Res Function(_$_CategoryInfo) then) =
      __$$_CategoryInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Color color});
}

/// @nodoc
class __$$_CategoryInfoCopyWithImpl<$Res>
    extends _$CategoryInfoCopyWithImpl<$Res, _$_CategoryInfo>
    implements _$$_CategoryInfoCopyWith<$Res> {
  __$$_CategoryInfoCopyWithImpl(
      _$_CategoryInfo _value, $Res Function(_$_CategoryInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_$_CategoryInfo(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_CategoryInfo extends _CategoryInfo {
  _$_CategoryInfo([this.name = '', this.color = Colors.white]) : super._();

  /// カテゴリ名
  @override
  @JsonKey()
  final String name;

  /// カテゴリカラー
  @override
  @JsonKey()
  final Color color;

  @override
  String toString() {
    return 'CategoryInfo(name: $name, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryInfoCopyWith<_$_CategoryInfo> get copyWith =>
      __$$_CategoryInfoCopyWithImpl<_$_CategoryInfo>(this, _$identity);
}

abstract class _CategoryInfo extends CategoryInfo {
  factory _CategoryInfo([final String name, final Color color]) =
      _$_CategoryInfo;
  _CategoryInfo._() : super._();

  @override

  /// カテゴリ名
  String get name;
  @override

  /// カテゴリカラー
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryInfoCopyWith<_$_CategoryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
