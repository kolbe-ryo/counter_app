// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webview_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WebviewArguments {
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebviewArgumentsCopyWith<WebviewArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebviewArgumentsCopyWith<$Res> {
  factory $WebviewArgumentsCopyWith(
          WebviewArguments value, $Res Function(WebviewArguments) then) =
      _$WebviewArgumentsCopyWithImpl<$Res, WebviewArguments>;
  @useResult
  $Res call({String title, String url});
}

/// @nodoc
class _$WebviewArgumentsCopyWithImpl<$Res, $Val extends WebviewArguments>
    implements $WebviewArgumentsCopyWith<$Res> {
  _$WebviewArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebviewArgumentsCopyWith<$Res>
    implements $WebviewArgumentsCopyWith<$Res> {
  factory _$$_WebviewArgumentsCopyWith(
          _$_WebviewArguments value, $Res Function(_$_WebviewArguments) then) =
      __$$_WebviewArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String url});
}

/// @nodoc
class __$$_WebviewArgumentsCopyWithImpl<$Res>
    extends _$WebviewArgumentsCopyWithImpl<$Res, _$_WebviewArguments>
    implements _$$_WebviewArgumentsCopyWith<$Res> {
  __$$_WebviewArgumentsCopyWithImpl(
      _$_WebviewArguments _value, $Res Function(_$_WebviewArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_$_WebviewArguments(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WebviewArguments extends _WebviewArguments {
  const _$_WebviewArguments({required this.title, required this.url})
      : super._();

  @override
  final String title;
  @override
  final String url;

  @override
  String toString() {
    return 'WebviewArguments(title: $title, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebviewArguments &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebviewArgumentsCopyWith<_$_WebviewArguments> get copyWith =>
      __$$_WebviewArgumentsCopyWithImpl<_$_WebviewArguments>(this, _$identity);
}

abstract class _WebviewArguments extends WebviewArguments {
  const factory _WebviewArguments(
      {required final String title,
      required final String url}) = _$_WebviewArguments;
  const _WebviewArguments._() : super._();

  @override
  String get title;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_WebviewArgumentsCopyWith<_$_WebviewArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
