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

/// @nodoc
mixin _$Counter {
  StringValue get name => throw _privateConstructorUsedError;
  CountValue get count => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  UpdatedDatetimeValue get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterCopyWith<Counter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterCopyWith<$Res> {
  factory $CounterCopyWith(Counter value, $Res Function(Counter) then) =
      _$CounterCopyWithImpl<$Res, Counter>;
  @useResult
  $Res call(
      {StringValue name,
      CountValue count,
      String? description,
      UpdatedDatetimeValue lastUpdated});

  $StringValueCopyWith<$Res> get name;
  $CountValueCopyWith<$Res> get count;
  $UpdatedDatetimeValueCopyWith<$Res> get lastUpdated;
}

/// @nodoc
class _$CounterCopyWithImpl<$Res, $Val extends Counter>
    implements $CounterCopyWith<$Res> {
  _$CounterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
    Object? description = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StringValue,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as CountValue,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as UpdatedDatetimeValue,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StringValueCopyWith<$Res> get name {
    return $StringValueCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CountValueCopyWith<$Res> get count {
    return $CountValueCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UpdatedDatetimeValueCopyWith<$Res> get lastUpdated {
    return $UpdatedDatetimeValueCopyWith<$Res>(_value.lastUpdated, (value) {
      return _then(_value.copyWith(lastUpdated: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CounterCopyWith<$Res> implements $CounterCopyWith<$Res> {
  factory _$$_CounterCopyWith(
          _$_Counter value, $Res Function(_$_Counter) then) =
      __$$_CounterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringValue name,
      CountValue count,
      String? description,
      UpdatedDatetimeValue lastUpdated});

  @override
  $StringValueCopyWith<$Res> get name;
  @override
  $CountValueCopyWith<$Res> get count;
  @override
  $UpdatedDatetimeValueCopyWith<$Res> get lastUpdated;
}

/// @nodoc
class __$$_CounterCopyWithImpl<$Res>
    extends _$CounterCopyWithImpl<$Res, _$_Counter>
    implements _$$_CounterCopyWith<$Res> {
  __$$_CounterCopyWithImpl(_$_Counter _value, $Res Function(_$_Counter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
    Object? description = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_$_Counter(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StringValue,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as CountValue,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as UpdatedDatetimeValue,
    ));
  }
}

/// @nodoc

class _$_Counter extends _Counter {
  const _$_Counter(
      {required this.name,
      required this.count,
      this.description,
      required this.lastUpdated})
      : super._();

  @override
  final StringValue name;
  @override
  final CountValue count;
  @override
  final String? description;
  @override
  final UpdatedDatetimeValue lastUpdated;

  @override
  String toString() {
    return 'Counter(name: $name, count: $count, description: $description, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Counter &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, count, description, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CounterCopyWith<_$_Counter> get copyWith =>
      __$$_CounterCopyWithImpl<_$_Counter>(this, _$identity);
}

abstract class _Counter extends Counter {
  const factory _Counter(
      {required final StringValue name,
      required final CountValue count,
      final String? description,
      required final UpdatedDatetimeValue lastUpdated}) = _$_Counter;
  const _Counter._() : super._();

  @override
  StringValue get name;
  @override
  CountValue get count;
  @override
  String? get description;
  @override
  UpdatedDatetimeValue get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_CounterCopyWith<_$_Counter> get copyWith =>
      throw _privateConstructorUsedError;
}
