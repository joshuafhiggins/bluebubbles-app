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
mixin _$DartMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartNormalMessage field0) message,
    required TResult Function(DartRenameMessage field0) renameMessage,
    required TResult Function(DartChangeParticipantMessage field0)
        changeParticipants,
    required TResult Function(DartReactMessage field0) react,
    required TResult Function() delivered,
    required TResult Function() read,
    required TResult Function() typing,
    required TResult Function(DartUnsendMessage field0) unsend,
    required TResult Function(DartEditMessage field0) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartNormalMessage field0)? message,
    TResult? Function(DartRenameMessage field0)? renameMessage,
    TResult? Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult? Function(DartReactMessage field0)? react,
    TResult? Function()? delivered,
    TResult? Function()? read,
    TResult? Function()? typing,
    TResult? Function(DartUnsendMessage field0)? unsend,
    TResult? Function(DartEditMessage field0)? edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartNormalMessage field0)? message,
    TResult Function(DartRenameMessage field0)? renameMessage,
    TResult Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult Function(DartReactMessage field0)? react,
    TResult Function()? delivered,
    TResult Function()? read,
    TResult Function()? typing,
    TResult Function(DartUnsendMessage field0)? unsend,
    TResult Function(DartEditMessage field0)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartMessage_Message value) message,
    required TResult Function(DartMessage_RenameMessage value) renameMessage,
    required TResult Function(DartMessage_ChangeParticipants value)
        changeParticipants,
    required TResult Function(DartMessage_React value) react,
    required TResult Function(DartMessage_Delivered value) delivered,
    required TResult Function(DartMessage_Read value) read,
    required TResult Function(DartMessage_Typing value) typing,
    required TResult Function(DartMessage_Unsend value) unsend,
    required TResult Function(DartMessage_Edit value) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartMessage_Message value)? message,
    TResult? Function(DartMessage_RenameMessage value)? renameMessage,
    TResult? Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult? Function(DartMessage_React value)? react,
    TResult? Function(DartMessage_Delivered value)? delivered,
    TResult? Function(DartMessage_Read value)? read,
    TResult? Function(DartMessage_Typing value)? typing,
    TResult? Function(DartMessage_Unsend value)? unsend,
    TResult? Function(DartMessage_Edit value)? edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartMessage_Message value)? message,
    TResult Function(DartMessage_RenameMessage value)? renameMessage,
    TResult Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult Function(DartMessage_React value)? react,
    TResult Function(DartMessage_Delivered value)? delivered,
    TResult Function(DartMessage_Read value)? read,
    TResult Function(DartMessage_Typing value)? typing,
    TResult Function(DartMessage_Unsend value)? unsend,
    TResult Function(DartMessage_Edit value)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DartMessageCopyWith<$Res> {
  factory $DartMessageCopyWith(
          DartMessage value, $Res Function(DartMessage) then) =
      _$DartMessageCopyWithImpl<$Res, DartMessage>;
}

/// @nodoc
class _$DartMessageCopyWithImpl<$Res, $Val extends DartMessage>
    implements $DartMessageCopyWith<$Res> {
  _$DartMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DartMessage_MessageCopyWith<$Res> {
  factory _$$DartMessage_MessageCopyWith(_$DartMessage_Message value,
          $Res Function(_$DartMessage_Message) then) =
      __$$DartMessage_MessageCopyWithImpl<$Res>;
  @useResult
  $Res call({DartNormalMessage field0});
}

/// @nodoc
class __$$DartMessage_MessageCopyWithImpl<$Res>
    extends _$DartMessageCopyWithImpl<$Res, _$DartMessage_Message>
    implements _$$DartMessage_MessageCopyWith<$Res> {
  __$$DartMessage_MessageCopyWithImpl(
      _$DartMessage_Message _value, $Res Function(_$DartMessage_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DartMessage_Message(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DartNormalMessage,
    ));
  }
}

/// @nodoc

class _$DartMessage_Message implements DartMessage_Message {
  const _$DartMessage_Message(this.field0);

  @override
  final DartNormalMessage field0;

  @override
  String toString() {
    return 'DartMessage.message(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DartMessage_Message &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DartMessage_MessageCopyWith<_$DartMessage_Message> get copyWith =>
      __$$DartMessage_MessageCopyWithImpl<_$DartMessage_Message>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartNormalMessage field0) message,
    required TResult Function(DartRenameMessage field0) renameMessage,
    required TResult Function(DartChangeParticipantMessage field0)
        changeParticipants,
    required TResult Function(DartReactMessage field0) react,
    required TResult Function() delivered,
    required TResult Function() read,
    required TResult Function() typing,
    required TResult Function(DartUnsendMessage field0) unsend,
    required TResult Function(DartEditMessage field0) edit,
  }) {
    return message(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartNormalMessage field0)? message,
    TResult? Function(DartRenameMessage field0)? renameMessage,
    TResult? Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult? Function(DartReactMessage field0)? react,
    TResult? Function()? delivered,
    TResult? Function()? read,
    TResult? Function()? typing,
    TResult? Function(DartUnsendMessage field0)? unsend,
    TResult? Function(DartEditMessage field0)? edit,
  }) {
    return message?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartNormalMessage field0)? message,
    TResult Function(DartRenameMessage field0)? renameMessage,
    TResult Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult Function(DartReactMessage field0)? react,
    TResult Function()? delivered,
    TResult Function()? read,
    TResult Function()? typing,
    TResult Function(DartUnsendMessage field0)? unsend,
    TResult Function(DartEditMessage field0)? edit,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartMessage_Message value) message,
    required TResult Function(DartMessage_RenameMessage value) renameMessage,
    required TResult Function(DartMessage_ChangeParticipants value)
        changeParticipants,
    required TResult Function(DartMessage_React value) react,
    required TResult Function(DartMessage_Delivered value) delivered,
    required TResult Function(DartMessage_Read value) read,
    required TResult Function(DartMessage_Typing value) typing,
    required TResult Function(DartMessage_Unsend value) unsend,
    required TResult Function(DartMessage_Edit value) edit,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartMessage_Message value)? message,
    TResult? Function(DartMessage_RenameMessage value)? renameMessage,
    TResult? Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult? Function(DartMessage_React value)? react,
    TResult? Function(DartMessage_Delivered value)? delivered,
    TResult? Function(DartMessage_Read value)? read,
    TResult? Function(DartMessage_Typing value)? typing,
    TResult? Function(DartMessage_Unsend value)? unsend,
    TResult? Function(DartMessage_Edit value)? edit,
  }) {
    return message?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartMessage_Message value)? message,
    TResult Function(DartMessage_RenameMessage value)? renameMessage,
    TResult Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult Function(DartMessage_React value)? react,
    TResult Function(DartMessage_Delivered value)? delivered,
    TResult Function(DartMessage_Read value)? read,
    TResult Function(DartMessage_Typing value)? typing,
    TResult Function(DartMessage_Unsend value)? unsend,
    TResult Function(DartMessage_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this);
    }
    return orElse();
  }
}

abstract class DartMessage_Message implements DartMessage {
  const factory DartMessage_Message(final DartNormalMessage field0) =
      _$DartMessage_Message;

  DartNormalMessage get field0;
  @JsonKey(ignore: true)
  _$$DartMessage_MessageCopyWith<_$DartMessage_Message> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DartMessage_RenameMessageCopyWith<$Res> {
  factory _$$DartMessage_RenameMessageCopyWith(
          _$DartMessage_RenameMessage value,
          $Res Function(_$DartMessage_RenameMessage) then) =
      __$$DartMessage_RenameMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({DartRenameMessage field0});
}

/// @nodoc
class __$$DartMessage_RenameMessageCopyWithImpl<$Res>
    extends _$DartMessageCopyWithImpl<$Res, _$DartMessage_RenameMessage>
    implements _$$DartMessage_RenameMessageCopyWith<$Res> {
  __$$DartMessage_RenameMessageCopyWithImpl(_$DartMessage_RenameMessage _value,
      $Res Function(_$DartMessage_RenameMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DartMessage_RenameMessage(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DartRenameMessage,
    ));
  }
}

/// @nodoc

class _$DartMessage_RenameMessage implements DartMessage_RenameMessage {
  const _$DartMessage_RenameMessage(this.field0);

  @override
  final DartRenameMessage field0;

  @override
  String toString() {
    return 'DartMessage.renameMessage(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DartMessage_RenameMessage &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DartMessage_RenameMessageCopyWith<_$DartMessage_RenameMessage>
      get copyWith => __$$DartMessage_RenameMessageCopyWithImpl<
          _$DartMessage_RenameMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartNormalMessage field0) message,
    required TResult Function(DartRenameMessage field0) renameMessage,
    required TResult Function(DartChangeParticipantMessage field0)
        changeParticipants,
    required TResult Function(DartReactMessage field0) react,
    required TResult Function() delivered,
    required TResult Function() read,
    required TResult Function() typing,
    required TResult Function(DartUnsendMessage field0) unsend,
    required TResult Function(DartEditMessage field0) edit,
  }) {
    return renameMessage(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartNormalMessage field0)? message,
    TResult? Function(DartRenameMessage field0)? renameMessage,
    TResult? Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult? Function(DartReactMessage field0)? react,
    TResult? Function()? delivered,
    TResult? Function()? read,
    TResult? Function()? typing,
    TResult? Function(DartUnsendMessage field0)? unsend,
    TResult? Function(DartEditMessage field0)? edit,
  }) {
    return renameMessage?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartNormalMessage field0)? message,
    TResult Function(DartRenameMessage field0)? renameMessage,
    TResult Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult Function(DartReactMessage field0)? react,
    TResult Function()? delivered,
    TResult Function()? read,
    TResult Function()? typing,
    TResult Function(DartUnsendMessage field0)? unsend,
    TResult Function(DartEditMessage field0)? edit,
    required TResult orElse(),
  }) {
    if (renameMessage != null) {
      return renameMessage(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartMessage_Message value) message,
    required TResult Function(DartMessage_RenameMessage value) renameMessage,
    required TResult Function(DartMessage_ChangeParticipants value)
        changeParticipants,
    required TResult Function(DartMessage_React value) react,
    required TResult Function(DartMessage_Delivered value) delivered,
    required TResult Function(DartMessage_Read value) read,
    required TResult Function(DartMessage_Typing value) typing,
    required TResult Function(DartMessage_Unsend value) unsend,
    required TResult Function(DartMessage_Edit value) edit,
  }) {
    return renameMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartMessage_Message value)? message,
    TResult? Function(DartMessage_RenameMessage value)? renameMessage,
    TResult? Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult? Function(DartMessage_React value)? react,
    TResult? Function(DartMessage_Delivered value)? delivered,
    TResult? Function(DartMessage_Read value)? read,
    TResult? Function(DartMessage_Typing value)? typing,
    TResult? Function(DartMessage_Unsend value)? unsend,
    TResult? Function(DartMessage_Edit value)? edit,
  }) {
    return renameMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartMessage_Message value)? message,
    TResult Function(DartMessage_RenameMessage value)? renameMessage,
    TResult Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult Function(DartMessage_React value)? react,
    TResult Function(DartMessage_Delivered value)? delivered,
    TResult Function(DartMessage_Read value)? read,
    TResult Function(DartMessage_Typing value)? typing,
    TResult Function(DartMessage_Unsend value)? unsend,
    TResult Function(DartMessage_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (renameMessage != null) {
      return renameMessage(this);
    }
    return orElse();
  }
}

abstract class DartMessage_RenameMessage implements DartMessage {
  const factory DartMessage_RenameMessage(final DartRenameMessage field0) =
      _$DartMessage_RenameMessage;

  DartRenameMessage get field0;
  @JsonKey(ignore: true)
  _$$DartMessage_RenameMessageCopyWith<_$DartMessage_RenameMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DartMessage_ChangeParticipantsCopyWith<$Res> {
  factory _$$DartMessage_ChangeParticipantsCopyWith(
          _$DartMessage_ChangeParticipants value,
          $Res Function(_$DartMessage_ChangeParticipants) then) =
      __$$DartMessage_ChangeParticipantsCopyWithImpl<$Res>;
  @useResult
  $Res call({DartChangeParticipantMessage field0});
}

/// @nodoc
class __$$DartMessage_ChangeParticipantsCopyWithImpl<$Res>
    extends _$DartMessageCopyWithImpl<$Res, _$DartMessage_ChangeParticipants>
    implements _$$DartMessage_ChangeParticipantsCopyWith<$Res> {
  __$$DartMessage_ChangeParticipantsCopyWithImpl(
      _$DartMessage_ChangeParticipants _value,
      $Res Function(_$DartMessage_ChangeParticipants) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DartMessage_ChangeParticipants(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DartChangeParticipantMessage,
    ));
  }
}

/// @nodoc

class _$DartMessage_ChangeParticipants
    implements DartMessage_ChangeParticipants {
  const _$DartMessage_ChangeParticipants(this.field0);

  @override
  final DartChangeParticipantMessage field0;

  @override
  String toString() {
    return 'DartMessage.changeParticipants(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DartMessage_ChangeParticipants &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DartMessage_ChangeParticipantsCopyWith<_$DartMessage_ChangeParticipants>
      get copyWith => __$$DartMessage_ChangeParticipantsCopyWithImpl<
          _$DartMessage_ChangeParticipants>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartNormalMessage field0) message,
    required TResult Function(DartRenameMessage field0) renameMessage,
    required TResult Function(DartChangeParticipantMessage field0)
        changeParticipants,
    required TResult Function(DartReactMessage field0) react,
    required TResult Function() delivered,
    required TResult Function() read,
    required TResult Function() typing,
    required TResult Function(DartUnsendMessage field0) unsend,
    required TResult Function(DartEditMessage field0) edit,
  }) {
    return changeParticipants(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartNormalMessage field0)? message,
    TResult? Function(DartRenameMessage field0)? renameMessage,
    TResult? Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult? Function(DartReactMessage field0)? react,
    TResult? Function()? delivered,
    TResult? Function()? read,
    TResult? Function()? typing,
    TResult? Function(DartUnsendMessage field0)? unsend,
    TResult? Function(DartEditMessage field0)? edit,
  }) {
    return changeParticipants?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartNormalMessage field0)? message,
    TResult Function(DartRenameMessage field0)? renameMessage,
    TResult Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult Function(DartReactMessage field0)? react,
    TResult Function()? delivered,
    TResult Function()? read,
    TResult Function()? typing,
    TResult Function(DartUnsendMessage field0)? unsend,
    TResult Function(DartEditMessage field0)? edit,
    required TResult orElse(),
  }) {
    if (changeParticipants != null) {
      return changeParticipants(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartMessage_Message value) message,
    required TResult Function(DartMessage_RenameMessage value) renameMessage,
    required TResult Function(DartMessage_ChangeParticipants value)
        changeParticipants,
    required TResult Function(DartMessage_React value) react,
    required TResult Function(DartMessage_Delivered value) delivered,
    required TResult Function(DartMessage_Read value) read,
    required TResult Function(DartMessage_Typing value) typing,
    required TResult Function(DartMessage_Unsend value) unsend,
    required TResult Function(DartMessage_Edit value) edit,
  }) {
    return changeParticipants(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartMessage_Message value)? message,
    TResult? Function(DartMessage_RenameMessage value)? renameMessage,
    TResult? Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult? Function(DartMessage_React value)? react,
    TResult? Function(DartMessage_Delivered value)? delivered,
    TResult? Function(DartMessage_Read value)? read,
    TResult? Function(DartMessage_Typing value)? typing,
    TResult? Function(DartMessage_Unsend value)? unsend,
    TResult? Function(DartMessage_Edit value)? edit,
  }) {
    return changeParticipants?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartMessage_Message value)? message,
    TResult Function(DartMessage_RenameMessage value)? renameMessage,
    TResult Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult Function(DartMessage_React value)? react,
    TResult Function(DartMessage_Delivered value)? delivered,
    TResult Function(DartMessage_Read value)? read,
    TResult Function(DartMessage_Typing value)? typing,
    TResult Function(DartMessage_Unsend value)? unsend,
    TResult Function(DartMessage_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (changeParticipants != null) {
      return changeParticipants(this);
    }
    return orElse();
  }
}

abstract class DartMessage_ChangeParticipants implements DartMessage {
  const factory DartMessage_ChangeParticipants(
          final DartChangeParticipantMessage field0) =
      _$DartMessage_ChangeParticipants;

  DartChangeParticipantMessage get field0;
  @JsonKey(ignore: true)
  _$$DartMessage_ChangeParticipantsCopyWith<_$DartMessage_ChangeParticipants>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DartMessage_ReactCopyWith<$Res> {
  factory _$$DartMessage_ReactCopyWith(
          _$DartMessage_React value, $Res Function(_$DartMessage_React) then) =
      __$$DartMessage_ReactCopyWithImpl<$Res>;
  @useResult
  $Res call({DartReactMessage field0});
}

/// @nodoc
class __$$DartMessage_ReactCopyWithImpl<$Res>
    extends _$DartMessageCopyWithImpl<$Res, _$DartMessage_React>
    implements _$$DartMessage_ReactCopyWith<$Res> {
  __$$DartMessage_ReactCopyWithImpl(
      _$DartMessage_React _value, $Res Function(_$DartMessage_React) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DartMessage_React(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DartReactMessage,
    ));
  }
}

/// @nodoc

class _$DartMessage_React implements DartMessage_React {
  const _$DartMessage_React(this.field0);

  @override
  final DartReactMessage field0;

  @override
  String toString() {
    return 'DartMessage.react(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DartMessage_React &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DartMessage_ReactCopyWith<_$DartMessage_React> get copyWith =>
      __$$DartMessage_ReactCopyWithImpl<_$DartMessage_React>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartNormalMessage field0) message,
    required TResult Function(DartRenameMessage field0) renameMessage,
    required TResult Function(DartChangeParticipantMessage field0)
        changeParticipants,
    required TResult Function(DartReactMessage field0) react,
    required TResult Function() delivered,
    required TResult Function() read,
    required TResult Function() typing,
    required TResult Function(DartUnsendMessage field0) unsend,
    required TResult Function(DartEditMessage field0) edit,
  }) {
    return react(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartNormalMessage field0)? message,
    TResult? Function(DartRenameMessage field0)? renameMessage,
    TResult? Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult? Function(DartReactMessage field0)? react,
    TResult? Function()? delivered,
    TResult? Function()? read,
    TResult? Function()? typing,
    TResult? Function(DartUnsendMessage field0)? unsend,
    TResult? Function(DartEditMessage field0)? edit,
  }) {
    return react?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartNormalMessage field0)? message,
    TResult Function(DartRenameMessage field0)? renameMessage,
    TResult Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult Function(DartReactMessage field0)? react,
    TResult Function()? delivered,
    TResult Function()? read,
    TResult Function()? typing,
    TResult Function(DartUnsendMessage field0)? unsend,
    TResult Function(DartEditMessage field0)? edit,
    required TResult orElse(),
  }) {
    if (react != null) {
      return react(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartMessage_Message value) message,
    required TResult Function(DartMessage_RenameMessage value) renameMessage,
    required TResult Function(DartMessage_ChangeParticipants value)
        changeParticipants,
    required TResult Function(DartMessage_React value) react,
    required TResult Function(DartMessage_Delivered value) delivered,
    required TResult Function(DartMessage_Read value) read,
    required TResult Function(DartMessage_Typing value) typing,
    required TResult Function(DartMessage_Unsend value) unsend,
    required TResult Function(DartMessage_Edit value) edit,
  }) {
    return react(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartMessage_Message value)? message,
    TResult? Function(DartMessage_RenameMessage value)? renameMessage,
    TResult? Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult? Function(DartMessage_React value)? react,
    TResult? Function(DartMessage_Delivered value)? delivered,
    TResult? Function(DartMessage_Read value)? read,
    TResult? Function(DartMessage_Typing value)? typing,
    TResult? Function(DartMessage_Unsend value)? unsend,
    TResult? Function(DartMessage_Edit value)? edit,
  }) {
    return react?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartMessage_Message value)? message,
    TResult Function(DartMessage_RenameMessage value)? renameMessage,
    TResult Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult Function(DartMessage_React value)? react,
    TResult Function(DartMessage_Delivered value)? delivered,
    TResult Function(DartMessage_Read value)? read,
    TResult Function(DartMessage_Typing value)? typing,
    TResult Function(DartMessage_Unsend value)? unsend,
    TResult Function(DartMessage_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (react != null) {
      return react(this);
    }
    return orElse();
  }
}

abstract class DartMessage_React implements DartMessage {
  const factory DartMessage_React(final DartReactMessage field0) =
      _$DartMessage_React;

  DartReactMessage get field0;
  @JsonKey(ignore: true)
  _$$DartMessage_ReactCopyWith<_$DartMessage_React> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DartMessage_DeliveredCopyWith<$Res> {
  factory _$$DartMessage_DeliveredCopyWith(_$DartMessage_Delivered value,
          $Res Function(_$DartMessage_Delivered) then) =
      __$$DartMessage_DeliveredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DartMessage_DeliveredCopyWithImpl<$Res>
    extends _$DartMessageCopyWithImpl<$Res, _$DartMessage_Delivered>
    implements _$$DartMessage_DeliveredCopyWith<$Res> {
  __$$DartMessage_DeliveredCopyWithImpl(_$DartMessage_Delivered _value,
      $Res Function(_$DartMessage_Delivered) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DartMessage_Delivered implements DartMessage_Delivered {
  const _$DartMessage_Delivered();

  @override
  String toString() {
    return 'DartMessage.delivered()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DartMessage_Delivered);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartNormalMessage field0) message,
    required TResult Function(DartRenameMessage field0) renameMessage,
    required TResult Function(DartChangeParticipantMessage field0)
        changeParticipants,
    required TResult Function(DartReactMessage field0) react,
    required TResult Function() delivered,
    required TResult Function() read,
    required TResult Function() typing,
    required TResult Function(DartUnsendMessage field0) unsend,
    required TResult Function(DartEditMessage field0) edit,
  }) {
    return delivered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartNormalMessage field0)? message,
    TResult? Function(DartRenameMessage field0)? renameMessage,
    TResult? Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult? Function(DartReactMessage field0)? react,
    TResult? Function()? delivered,
    TResult? Function()? read,
    TResult? Function()? typing,
    TResult? Function(DartUnsendMessage field0)? unsend,
    TResult? Function(DartEditMessage field0)? edit,
  }) {
    return delivered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartNormalMessage field0)? message,
    TResult Function(DartRenameMessage field0)? renameMessage,
    TResult Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult Function(DartReactMessage field0)? react,
    TResult Function()? delivered,
    TResult Function()? read,
    TResult Function()? typing,
    TResult Function(DartUnsendMessage field0)? unsend,
    TResult Function(DartEditMessage field0)? edit,
    required TResult orElse(),
  }) {
    if (delivered != null) {
      return delivered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartMessage_Message value) message,
    required TResult Function(DartMessage_RenameMessage value) renameMessage,
    required TResult Function(DartMessage_ChangeParticipants value)
        changeParticipants,
    required TResult Function(DartMessage_React value) react,
    required TResult Function(DartMessage_Delivered value) delivered,
    required TResult Function(DartMessage_Read value) read,
    required TResult Function(DartMessage_Typing value) typing,
    required TResult Function(DartMessage_Unsend value) unsend,
    required TResult Function(DartMessage_Edit value) edit,
  }) {
    return delivered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartMessage_Message value)? message,
    TResult? Function(DartMessage_RenameMessage value)? renameMessage,
    TResult? Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult? Function(DartMessage_React value)? react,
    TResult? Function(DartMessage_Delivered value)? delivered,
    TResult? Function(DartMessage_Read value)? read,
    TResult? Function(DartMessage_Typing value)? typing,
    TResult? Function(DartMessage_Unsend value)? unsend,
    TResult? Function(DartMessage_Edit value)? edit,
  }) {
    return delivered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartMessage_Message value)? message,
    TResult Function(DartMessage_RenameMessage value)? renameMessage,
    TResult Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult Function(DartMessage_React value)? react,
    TResult Function(DartMessage_Delivered value)? delivered,
    TResult Function(DartMessage_Read value)? read,
    TResult Function(DartMessage_Typing value)? typing,
    TResult Function(DartMessage_Unsend value)? unsend,
    TResult Function(DartMessage_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (delivered != null) {
      return delivered(this);
    }
    return orElse();
  }
}

abstract class DartMessage_Delivered implements DartMessage {
  const factory DartMessage_Delivered() = _$DartMessage_Delivered;
}

/// @nodoc
abstract class _$$DartMessage_ReadCopyWith<$Res> {
  factory _$$DartMessage_ReadCopyWith(
          _$DartMessage_Read value, $Res Function(_$DartMessage_Read) then) =
      __$$DartMessage_ReadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DartMessage_ReadCopyWithImpl<$Res>
    extends _$DartMessageCopyWithImpl<$Res, _$DartMessage_Read>
    implements _$$DartMessage_ReadCopyWith<$Res> {
  __$$DartMessage_ReadCopyWithImpl(
      _$DartMessage_Read _value, $Res Function(_$DartMessage_Read) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DartMessage_Read implements DartMessage_Read {
  const _$DartMessage_Read();

  @override
  String toString() {
    return 'DartMessage.read()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DartMessage_Read);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartNormalMessage field0) message,
    required TResult Function(DartRenameMessage field0) renameMessage,
    required TResult Function(DartChangeParticipantMessage field0)
        changeParticipants,
    required TResult Function(DartReactMessage field0) react,
    required TResult Function() delivered,
    required TResult Function() read,
    required TResult Function() typing,
    required TResult Function(DartUnsendMessage field0) unsend,
    required TResult Function(DartEditMessage field0) edit,
  }) {
    return read();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartNormalMessage field0)? message,
    TResult? Function(DartRenameMessage field0)? renameMessage,
    TResult? Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult? Function(DartReactMessage field0)? react,
    TResult? Function()? delivered,
    TResult? Function()? read,
    TResult? Function()? typing,
    TResult? Function(DartUnsendMessage field0)? unsend,
    TResult? Function(DartEditMessage field0)? edit,
  }) {
    return read?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartNormalMessage field0)? message,
    TResult Function(DartRenameMessage field0)? renameMessage,
    TResult Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult Function(DartReactMessage field0)? react,
    TResult Function()? delivered,
    TResult Function()? read,
    TResult Function()? typing,
    TResult Function(DartUnsendMessage field0)? unsend,
    TResult Function(DartEditMessage field0)? edit,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartMessage_Message value) message,
    required TResult Function(DartMessage_RenameMessage value) renameMessage,
    required TResult Function(DartMessage_ChangeParticipants value)
        changeParticipants,
    required TResult Function(DartMessage_React value) react,
    required TResult Function(DartMessage_Delivered value) delivered,
    required TResult Function(DartMessage_Read value) read,
    required TResult Function(DartMessage_Typing value) typing,
    required TResult Function(DartMessage_Unsend value) unsend,
    required TResult Function(DartMessage_Edit value) edit,
  }) {
    return read(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartMessage_Message value)? message,
    TResult? Function(DartMessage_RenameMessage value)? renameMessage,
    TResult? Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult? Function(DartMessage_React value)? react,
    TResult? Function(DartMessage_Delivered value)? delivered,
    TResult? Function(DartMessage_Read value)? read,
    TResult? Function(DartMessage_Typing value)? typing,
    TResult? Function(DartMessage_Unsend value)? unsend,
    TResult? Function(DartMessage_Edit value)? edit,
  }) {
    return read?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartMessage_Message value)? message,
    TResult Function(DartMessage_RenameMessage value)? renameMessage,
    TResult Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult Function(DartMessage_React value)? react,
    TResult Function(DartMessage_Delivered value)? delivered,
    TResult Function(DartMessage_Read value)? read,
    TResult Function(DartMessage_Typing value)? typing,
    TResult Function(DartMessage_Unsend value)? unsend,
    TResult Function(DartMessage_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read(this);
    }
    return orElse();
  }
}

abstract class DartMessage_Read implements DartMessage {
  const factory DartMessage_Read() = _$DartMessage_Read;
}

/// @nodoc
abstract class _$$DartMessage_TypingCopyWith<$Res> {
  factory _$$DartMessage_TypingCopyWith(_$DartMessage_Typing value,
          $Res Function(_$DartMessage_Typing) then) =
      __$$DartMessage_TypingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DartMessage_TypingCopyWithImpl<$Res>
    extends _$DartMessageCopyWithImpl<$Res, _$DartMessage_Typing>
    implements _$$DartMessage_TypingCopyWith<$Res> {
  __$$DartMessage_TypingCopyWithImpl(
      _$DartMessage_Typing _value, $Res Function(_$DartMessage_Typing) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DartMessage_Typing implements DartMessage_Typing {
  const _$DartMessage_Typing();

  @override
  String toString() {
    return 'DartMessage.typing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DartMessage_Typing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartNormalMessage field0) message,
    required TResult Function(DartRenameMessage field0) renameMessage,
    required TResult Function(DartChangeParticipantMessage field0)
        changeParticipants,
    required TResult Function(DartReactMessage field0) react,
    required TResult Function() delivered,
    required TResult Function() read,
    required TResult Function() typing,
    required TResult Function(DartUnsendMessage field0) unsend,
    required TResult Function(DartEditMessage field0) edit,
  }) {
    return typing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartNormalMessage field0)? message,
    TResult? Function(DartRenameMessage field0)? renameMessage,
    TResult? Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult? Function(DartReactMessage field0)? react,
    TResult? Function()? delivered,
    TResult? Function()? read,
    TResult? Function()? typing,
    TResult? Function(DartUnsendMessage field0)? unsend,
    TResult? Function(DartEditMessage field0)? edit,
  }) {
    return typing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartNormalMessage field0)? message,
    TResult Function(DartRenameMessage field0)? renameMessage,
    TResult Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult Function(DartReactMessage field0)? react,
    TResult Function()? delivered,
    TResult Function()? read,
    TResult Function()? typing,
    TResult Function(DartUnsendMessage field0)? unsend,
    TResult Function(DartEditMessage field0)? edit,
    required TResult orElse(),
  }) {
    if (typing != null) {
      return typing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartMessage_Message value) message,
    required TResult Function(DartMessage_RenameMessage value) renameMessage,
    required TResult Function(DartMessage_ChangeParticipants value)
        changeParticipants,
    required TResult Function(DartMessage_React value) react,
    required TResult Function(DartMessage_Delivered value) delivered,
    required TResult Function(DartMessage_Read value) read,
    required TResult Function(DartMessage_Typing value) typing,
    required TResult Function(DartMessage_Unsend value) unsend,
    required TResult Function(DartMessage_Edit value) edit,
  }) {
    return typing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartMessage_Message value)? message,
    TResult? Function(DartMessage_RenameMessage value)? renameMessage,
    TResult? Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult? Function(DartMessage_React value)? react,
    TResult? Function(DartMessage_Delivered value)? delivered,
    TResult? Function(DartMessage_Read value)? read,
    TResult? Function(DartMessage_Typing value)? typing,
    TResult? Function(DartMessage_Unsend value)? unsend,
    TResult? Function(DartMessage_Edit value)? edit,
  }) {
    return typing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartMessage_Message value)? message,
    TResult Function(DartMessage_RenameMessage value)? renameMessage,
    TResult Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult Function(DartMessage_React value)? react,
    TResult Function(DartMessage_Delivered value)? delivered,
    TResult Function(DartMessage_Read value)? read,
    TResult Function(DartMessage_Typing value)? typing,
    TResult Function(DartMessage_Unsend value)? unsend,
    TResult Function(DartMessage_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (typing != null) {
      return typing(this);
    }
    return orElse();
  }
}

abstract class DartMessage_Typing implements DartMessage {
  const factory DartMessage_Typing() = _$DartMessage_Typing;
}

/// @nodoc
abstract class _$$DartMessage_UnsendCopyWith<$Res> {
  factory _$$DartMessage_UnsendCopyWith(_$DartMessage_Unsend value,
          $Res Function(_$DartMessage_Unsend) then) =
      __$$DartMessage_UnsendCopyWithImpl<$Res>;
  @useResult
  $Res call({DartUnsendMessage field0});
}

/// @nodoc
class __$$DartMessage_UnsendCopyWithImpl<$Res>
    extends _$DartMessageCopyWithImpl<$Res, _$DartMessage_Unsend>
    implements _$$DartMessage_UnsendCopyWith<$Res> {
  __$$DartMessage_UnsendCopyWithImpl(
      _$DartMessage_Unsend _value, $Res Function(_$DartMessage_Unsend) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DartMessage_Unsend(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DartUnsendMessage,
    ));
  }
}

/// @nodoc

class _$DartMessage_Unsend implements DartMessage_Unsend {
  const _$DartMessage_Unsend(this.field0);

  @override
  final DartUnsendMessage field0;

  @override
  String toString() {
    return 'DartMessage.unsend(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DartMessage_Unsend &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DartMessage_UnsendCopyWith<_$DartMessage_Unsend> get copyWith =>
      __$$DartMessage_UnsendCopyWithImpl<_$DartMessage_Unsend>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartNormalMessage field0) message,
    required TResult Function(DartRenameMessage field0) renameMessage,
    required TResult Function(DartChangeParticipantMessage field0)
        changeParticipants,
    required TResult Function(DartReactMessage field0) react,
    required TResult Function() delivered,
    required TResult Function() read,
    required TResult Function() typing,
    required TResult Function(DartUnsendMessage field0) unsend,
    required TResult Function(DartEditMessage field0) edit,
  }) {
    return unsend(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartNormalMessage field0)? message,
    TResult? Function(DartRenameMessage field0)? renameMessage,
    TResult? Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult? Function(DartReactMessage field0)? react,
    TResult? Function()? delivered,
    TResult? Function()? read,
    TResult? Function()? typing,
    TResult? Function(DartUnsendMessage field0)? unsend,
    TResult? Function(DartEditMessage field0)? edit,
  }) {
    return unsend?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartNormalMessage field0)? message,
    TResult Function(DartRenameMessage field0)? renameMessage,
    TResult Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult Function(DartReactMessage field0)? react,
    TResult Function()? delivered,
    TResult Function()? read,
    TResult Function()? typing,
    TResult Function(DartUnsendMessage field0)? unsend,
    TResult Function(DartEditMessage field0)? edit,
    required TResult orElse(),
  }) {
    if (unsend != null) {
      return unsend(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartMessage_Message value) message,
    required TResult Function(DartMessage_RenameMessage value) renameMessage,
    required TResult Function(DartMessage_ChangeParticipants value)
        changeParticipants,
    required TResult Function(DartMessage_React value) react,
    required TResult Function(DartMessage_Delivered value) delivered,
    required TResult Function(DartMessage_Read value) read,
    required TResult Function(DartMessage_Typing value) typing,
    required TResult Function(DartMessage_Unsend value) unsend,
    required TResult Function(DartMessage_Edit value) edit,
  }) {
    return unsend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartMessage_Message value)? message,
    TResult? Function(DartMessage_RenameMessage value)? renameMessage,
    TResult? Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult? Function(DartMessage_React value)? react,
    TResult? Function(DartMessage_Delivered value)? delivered,
    TResult? Function(DartMessage_Read value)? read,
    TResult? Function(DartMessage_Typing value)? typing,
    TResult? Function(DartMessage_Unsend value)? unsend,
    TResult? Function(DartMessage_Edit value)? edit,
  }) {
    return unsend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartMessage_Message value)? message,
    TResult Function(DartMessage_RenameMessage value)? renameMessage,
    TResult Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult Function(DartMessage_React value)? react,
    TResult Function(DartMessage_Delivered value)? delivered,
    TResult Function(DartMessage_Read value)? read,
    TResult Function(DartMessage_Typing value)? typing,
    TResult Function(DartMessage_Unsend value)? unsend,
    TResult Function(DartMessage_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (unsend != null) {
      return unsend(this);
    }
    return orElse();
  }
}

abstract class DartMessage_Unsend implements DartMessage {
  const factory DartMessage_Unsend(final DartUnsendMessage field0) =
      _$DartMessage_Unsend;

  DartUnsendMessage get field0;
  @JsonKey(ignore: true)
  _$$DartMessage_UnsendCopyWith<_$DartMessage_Unsend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DartMessage_EditCopyWith<$Res> {
  factory _$$DartMessage_EditCopyWith(
          _$DartMessage_Edit value, $Res Function(_$DartMessage_Edit) then) =
      __$$DartMessage_EditCopyWithImpl<$Res>;
  @useResult
  $Res call({DartEditMessage field0});
}

/// @nodoc
class __$$DartMessage_EditCopyWithImpl<$Res>
    extends _$DartMessageCopyWithImpl<$Res, _$DartMessage_Edit>
    implements _$$DartMessage_EditCopyWith<$Res> {
  __$$DartMessage_EditCopyWithImpl(
      _$DartMessage_Edit _value, $Res Function(_$DartMessage_Edit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$DartMessage_Edit(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DartEditMessage,
    ));
  }
}

/// @nodoc

class _$DartMessage_Edit implements DartMessage_Edit {
  const _$DartMessage_Edit(this.field0);

  @override
  final DartEditMessage field0;

  @override
  String toString() {
    return 'DartMessage.edit(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DartMessage_Edit &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DartMessage_EditCopyWith<_$DartMessage_Edit> get copyWith =>
      __$$DartMessage_EditCopyWithImpl<_$DartMessage_Edit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartNormalMessage field0) message,
    required TResult Function(DartRenameMessage field0) renameMessage,
    required TResult Function(DartChangeParticipantMessage field0)
        changeParticipants,
    required TResult Function(DartReactMessage field0) react,
    required TResult Function() delivered,
    required TResult Function() read,
    required TResult Function() typing,
    required TResult Function(DartUnsendMessage field0) unsend,
    required TResult Function(DartEditMessage field0) edit,
  }) {
    return edit(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartNormalMessage field0)? message,
    TResult? Function(DartRenameMessage field0)? renameMessage,
    TResult? Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult? Function(DartReactMessage field0)? react,
    TResult? Function()? delivered,
    TResult? Function()? read,
    TResult? Function()? typing,
    TResult? Function(DartUnsendMessage field0)? unsend,
    TResult? Function(DartEditMessage field0)? edit,
  }) {
    return edit?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartNormalMessage field0)? message,
    TResult Function(DartRenameMessage field0)? renameMessage,
    TResult Function(DartChangeParticipantMessage field0)? changeParticipants,
    TResult Function(DartReactMessage field0)? react,
    TResult Function()? delivered,
    TResult Function()? read,
    TResult Function()? typing,
    TResult Function(DartUnsendMessage field0)? unsend,
    TResult Function(DartEditMessage field0)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartMessage_Message value) message,
    required TResult Function(DartMessage_RenameMessage value) renameMessage,
    required TResult Function(DartMessage_ChangeParticipants value)
        changeParticipants,
    required TResult Function(DartMessage_React value) react,
    required TResult Function(DartMessage_Delivered value) delivered,
    required TResult Function(DartMessage_Read value) read,
    required TResult Function(DartMessage_Typing value) typing,
    required TResult Function(DartMessage_Unsend value) unsend,
    required TResult Function(DartMessage_Edit value) edit,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartMessage_Message value)? message,
    TResult? Function(DartMessage_RenameMessage value)? renameMessage,
    TResult? Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult? Function(DartMessage_React value)? react,
    TResult? Function(DartMessage_Delivered value)? delivered,
    TResult? Function(DartMessage_Read value)? read,
    TResult? Function(DartMessage_Typing value)? typing,
    TResult? Function(DartMessage_Unsend value)? unsend,
    TResult? Function(DartMessage_Edit value)? edit,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartMessage_Message value)? message,
    TResult Function(DartMessage_RenameMessage value)? renameMessage,
    TResult Function(DartMessage_ChangeParticipants value)? changeParticipants,
    TResult Function(DartMessage_React value)? react,
    TResult Function(DartMessage_Delivered value)? delivered,
    TResult Function(DartMessage_Read value)? read,
    TResult Function(DartMessage_Typing value)? typing,
    TResult Function(DartMessage_Unsend value)? unsend,
    TResult Function(DartMessage_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class DartMessage_Edit implements DartMessage {
  const factory DartMessage_Edit(final DartEditMessage field0) =
      _$DartMessage_Edit;

  DartEditMessage get field0;
  @JsonKey(ignore: true)
  _$$DartMessage_EditCopyWith<_$DartMessage_Edit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DartRecievedMessage {
  DartIMessage get msg => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartIMessage msg) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartIMessage msg)? message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartIMessage msg)? message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartRecievedMessage_Message value) message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartRecievedMessage_Message value)? message,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartRecievedMessage_Message value)? message,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DartRecievedMessageCopyWith<DartRecievedMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DartRecievedMessageCopyWith<$Res> {
  factory $DartRecievedMessageCopyWith(
          DartRecievedMessage value, $Res Function(DartRecievedMessage) then) =
      _$DartRecievedMessageCopyWithImpl<$Res, DartRecievedMessage>;
  @useResult
  $Res call({DartIMessage msg});
}

/// @nodoc
class _$DartRecievedMessageCopyWithImpl<$Res, $Val extends DartRecievedMessage>
    implements $DartRecievedMessageCopyWith<$Res> {
  _$DartRecievedMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_value.copyWith(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as DartIMessage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DartRecievedMessage_MessageCopyWith<$Res>
    implements $DartRecievedMessageCopyWith<$Res> {
  factory _$$DartRecievedMessage_MessageCopyWith(
          _$DartRecievedMessage_Message value,
          $Res Function(_$DartRecievedMessage_Message) then) =
      __$$DartRecievedMessage_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DartIMessage msg});
}

/// @nodoc
class __$$DartRecievedMessage_MessageCopyWithImpl<$Res>
    extends _$DartRecievedMessageCopyWithImpl<$Res,
        _$DartRecievedMessage_Message>
    implements _$$DartRecievedMessage_MessageCopyWith<$Res> {
  __$$DartRecievedMessage_MessageCopyWithImpl(
      _$DartRecievedMessage_Message _value,
      $Res Function(_$DartRecievedMessage_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$DartRecievedMessage_Message(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as DartIMessage,
    ));
  }
}

/// @nodoc

class _$DartRecievedMessage_Message implements DartRecievedMessage_Message {
  const _$DartRecievedMessage_Message({required this.msg});

  @override
  final DartIMessage msg;

  @override
  String toString() {
    return 'DartRecievedMessage.message(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DartRecievedMessage_Message &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DartRecievedMessage_MessageCopyWith<_$DartRecievedMessage_Message>
      get copyWith => __$$DartRecievedMessage_MessageCopyWithImpl<
          _$DartRecievedMessage_Message>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartIMessage msg) message,
  }) {
    return message(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartIMessage msg)? message,
  }) {
    return message?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartIMessage msg)? message,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartRecievedMessage_Message value) message,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartRecievedMessage_Message value)? message,
  }) {
    return message?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartRecievedMessage_Message value)? message,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this);
    }
    return orElse();
  }
}

abstract class DartRecievedMessage_Message implements DartRecievedMessage {
  const factory DartRecievedMessage_Message({required final DartIMessage msg}) =
      _$DartRecievedMessage_Message;

  @override
  DartIMessage get msg;
  @override
  @JsonKey(ignore: true)
  _$$DartRecievedMessage_MessageCopyWith<_$DartRecievedMessage_Message>
      get copyWith => throw _privateConstructorUsedError;
}
