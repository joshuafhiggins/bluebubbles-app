// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bridge_definitions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(int field0) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(int field0)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(int field0)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterResult_Success value) success,
    required TResult Function(RegisterResult_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterResult_Success value)? success,
    TResult? Function(RegisterResult_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterResult_Success value)? success,
    TResult Function(RegisterResult_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResultCopyWith<$Res> {
  factory $RegisterResultCopyWith(
          RegisterResult value, $Res Function(RegisterResult) then) =
      _$RegisterResultCopyWithImpl<$Res, RegisterResult>;
}

/// @nodoc
class _$RegisterResultCopyWithImpl<$Res, $Val extends RegisterResult>
    implements $RegisterResultCopyWith<$Res> {
  _$RegisterResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegisterResult_SuccessCopyWith<$Res> {
  factory _$$RegisterResult_SuccessCopyWith(_$RegisterResult_Success value,
          $Res Function(_$RegisterResult_Success) then) =
      __$$RegisterResult_SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterResult_SuccessCopyWithImpl<$Res>
    extends _$RegisterResultCopyWithImpl<$Res, _$RegisterResult_Success>
    implements _$$RegisterResult_SuccessCopyWith<$Res> {
  __$$RegisterResult_SuccessCopyWithImpl(_$RegisterResult_Success _value,
      $Res Function(_$RegisterResult_Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterResult_Success implements RegisterResult_Success {
  const _$RegisterResult_Success();

  @override
  String toString() {
    return 'RegisterResult.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterResult_Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(int field0) failed,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(int field0)? failed,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(int field0)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterResult_Success value) success,
    required TResult Function(RegisterResult_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterResult_Success value)? success,
    TResult? Function(RegisterResult_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterResult_Success value)? success,
    TResult Function(RegisterResult_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RegisterResult_Success implements RegisterResult {
  const factory RegisterResult_Success() = _$RegisterResult_Success;
}

/// @nodoc
abstract class _$$RegisterResult_FailedCopyWith<$Res> {
  factory _$$RegisterResult_FailedCopyWith(_$RegisterResult_Failed value,
          $Res Function(_$RegisterResult_Failed) then) =
      __$$RegisterResult_FailedCopyWithImpl<$Res>;
  @useResult
  $Res call({int field0});
}

/// @nodoc
class __$$RegisterResult_FailedCopyWithImpl<$Res>
    extends _$RegisterResultCopyWithImpl<$Res, _$RegisterResult_Failed>
    implements _$$RegisterResult_FailedCopyWith<$Res> {
  __$$RegisterResult_FailedCopyWithImpl(_$RegisterResult_Failed _value,
      $Res Function(_$RegisterResult_Failed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$RegisterResult_Failed(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RegisterResult_Failed implements RegisterResult_Failed {
  const _$RegisterResult_Failed(this.field0);

  @override
  final int field0;

  @override
  String toString() {
    return 'RegisterResult.failed(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResult_Failed &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterResult_FailedCopyWith<_$RegisterResult_Failed> get copyWith =>
      __$$RegisterResult_FailedCopyWithImpl<_$RegisterResult_Failed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(int field0) failed,
  }) {
    return failed(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(int field0)? failed,
  }) {
    return failed?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(int field0)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterResult_Success value) success,
    required TResult Function(RegisterResult_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterResult_Success value)? success,
    TResult? Function(RegisterResult_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterResult_Success value)? success,
    TResult Function(RegisterResult_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class RegisterResult_Failed implements RegisterResult {
  const factory RegisterResult_Failed(final int field0) =
      _$RegisterResult_Failed;

  int get field0;
  @JsonKey(ignore: true)
  _$$RegisterResult_FailedCopyWith<_$RegisterResult_Failed> get copyWith =>
      throw _privateConstructorUsedError;
}
