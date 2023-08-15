// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenticate_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticateUserData {
  String get email => throw _privateConstructorUsedError;
  StringValue get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticateUserDataCopyWith<AuthenticateUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticateUserDataCopyWith<$Res> {
  factory $AuthenticateUserDataCopyWith(AuthenticateUserData value,
          $Res Function(AuthenticateUserData) then) =
      _$AuthenticateUserDataCopyWithImpl<$Res, AuthenticateUserData>;
  @useResult
  $Res call({String email, StringValue password});

  $StringValueCopyWith<$Res> get password;
}

/// @nodoc
class _$AuthenticateUserDataCopyWithImpl<$Res,
        $Val extends AuthenticateUserData>
    implements $AuthenticateUserDataCopyWith<$Res> {
  _$AuthenticateUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StringValueCopyWith<$Res> get password {
    return $StringValueCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthenticateUserDataCopyWith<$Res>
    implements $AuthenticateUserDataCopyWith<$Res> {
  factory _$$_AuthenticateUserDataCopyWith(_$_AuthenticateUserData value,
          $Res Function(_$_AuthenticateUserData) then) =
      __$$_AuthenticateUserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, StringValue password});

  @override
  $StringValueCopyWith<$Res> get password;
}

/// @nodoc
class __$$_AuthenticateUserDataCopyWithImpl<$Res>
    extends _$AuthenticateUserDataCopyWithImpl<$Res, _$_AuthenticateUserData>
    implements _$$_AuthenticateUserDataCopyWith<$Res> {
  __$$_AuthenticateUserDataCopyWithImpl(_$_AuthenticateUserData _value,
      $Res Function(_$_AuthenticateUserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_AuthenticateUserData(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_AuthenticateUserData implements _AuthenticateUserData {
  const _$_AuthenticateUserData({required this.email, required this.password});

  @override
  final String email;
  @override
  final StringValue password;

  @override
  String toString() {
    return 'AuthenticateUserData._(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticateUserData &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticateUserDataCopyWith<_$_AuthenticateUserData> get copyWith =>
      __$$_AuthenticateUserDataCopyWithImpl<_$_AuthenticateUserData>(
          this, _$identity);
}

abstract class _AuthenticateUserData implements AuthenticateUserData {
  const factory _AuthenticateUserData(
      {required final String email,
      required final StringValue password}) = _$_AuthenticateUserData;

  @override
  String get email;
  @override
  StringValue get password;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticateUserDataCopyWith<_$_AuthenticateUserData> get copyWith =>
      throw _privateConstructorUsedError;
}
