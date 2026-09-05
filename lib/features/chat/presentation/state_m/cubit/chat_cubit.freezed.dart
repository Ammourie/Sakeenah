// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInit,
    required TResult Function(String? message) chatLoading,
    required TResult Function(ChatSocket data) successCreateChatSocket,
    required TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)
        messageListLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) chatError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInit,
    TResult? Function(String? message)? chatLoading,
    TResult? Function(ChatSocket data)? successCreateChatSocket,
    TResult? Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? chatError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInit,
    TResult Function(String? message)? chatLoading,
    TResult Function(ChatSocket data)? successCreateChatSocket,
    TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? chatError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitState value) chatInit,
    required TResult Function(ChatLoadingState value) chatLoading,
    required TResult Function(SuccessCreateChatSocket value)
        successCreateChatSocket,
    required TResult Function(MessageListLoadedState value) messageListLoaded,
    required TResult Function(ChatErrorState value) chatError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitState value)? chatInit,
    TResult? Function(ChatLoadingState value)? chatLoading,
    TResult? Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult? Function(MessageListLoadedState value)? messageListLoaded,
    TResult? Function(ChatErrorState value)? chatError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitState value)? chatInit,
    TResult Function(ChatLoadingState value)? chatLoading,
    TResult Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult Function(MessageListLoadedState value)? messageListLoaded,
    TResult Function(ChatErrorState value)? chatError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatInitStateImplCopyWith<$Res> {
  factory _$$ChatInitStateImplCopyWith(
          _$ChatInitStateImpl value, $Res Function(_$ChatInitStateImpl) then) =
      __$$ChatInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatInitStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatInitStateImpl>
    implements _$$ChatInitStateImplCopyWith<$Res> {
  __$$ChatInitStateImplCopyWithImpl(
      _$ChatInitStateImpl _value, $Res Function(_$ChatInitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatInitStateImpl
    with DiagnosticableTreeMixin
    implements ChatInitState {
  const _$ChatInitStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState.chatInit()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ChatState.chatInit'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInit,
    required TResult Function(String? message) chatLoading,
    required TResult Function(ChatSocket data) successCreateChatSocket,
    required TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)
        messageListLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) chatError,
  }) {
    return chatInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInit,
    TResult? Function(String? message)? chatLoading,
    TResult? Function(ChatSocket data)? successCreateChatSocket,
    TResult? Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? chatError,
  }) {
    return chatInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInit,
    TResult Function(String? message)? chatLoading,
    TResult Function(ChatSocket data)? successCreateChatSocket,
    TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? chatError,
    required TResult orElse(),
  }) {
    if (chatInit != null) {
      return chatInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitState value) chatInit,
    required TResult Function(ChatLoadingState value) chatLoading,
    required TResult Function(SuccessCreateChatSocket value)
        successCreateChatSocket,
    required TResult Function(MessageListLoadedState value) messageListLoaded,
    required TResult Function(ChatErrorState value) chatError,
  }) {
    return chatInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitState value)? chatInit,
    TResult? Function(ChatLoadingState value)? chatLoading,
    TResult? Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult? Function(MessageListLoadedState value)? messageListLoaded,
    TResult? Function(ChatErrorState value)? chatError,
  }) {
    return chatInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitState value)? chatInit,
    TResult Function(ChatLoadingState value)? chatLoading,
    TResult Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult Function(MessageListLoadedState value)? messageListLoaded,
    TResult Function(ChatErrorState value)? chatError,
    required TResult orElse(),
  }) {
    if (chatInit != null) {
      return chatInit(this);
    }
    return orElse();
  }
}

abstract class ChatInitState implements ChatState {
  const factory ChatInitState() = _$ChatInitStateImpl;
}

/// @nodoc
abstract class _$$ChatLoadingStateImplCopyWith<$Res> {
  factory _$$ChatLoadingStateImplCopyWith(_$ChatLoadingStateImpl value,
          $Res Function(_$ChatLoadingStateImpl) then) =
      __$$ChatLoadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ChatLoadingStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatLoadingStateImpl>
    implements _$$ChatLoadingStateImplCopyWith<$Res> {
  __$$ChatLoadingStateImplCopyWithImpl(_$ChatLoadingStateImpl _value,
      $Res Function(_$ChatLoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ChatLoadingStateImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatLoadingStateImpl
    with DiagnosticableTreeMixin
    implements ChatLoadingState {
  const _$ChatLoadingStateImpl({this.message});

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState.chatLoading(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState.chatLoading'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatLoadingStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatLoadingStateImplCopyWith<_$ChatLoadingStateImpl> get copyWith =>
      __$$ChatLoadingStateImplCopyWithImpl<_$ChatLoadingStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInit,
    required TResult Function(String? message) chatLoading,
    required TResult Function(ChatSocket data) successCreateChatSocket,
    required TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)
        messageListLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) chatError,
  }) {
    return chatLoading(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInit,
    TResult? Function(String? message)? chatLoading,
    TResult? Function(ChatSocket data)? successCreateChatSocket,
    TResult? Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? chatError,
  }) {
    return chatLoading?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInit,
    TResult Function(String? message)? chatLoading,
    TResult Function(ChatSocket data)? successCreateChatSocket,
    TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? chatError,
    required TResult orElse(),
  }) {
    if (chatLoading != null) {
      return chatLoading(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitState value) chatInit,
    required TResult Function(ChatLoadingState value) chatLoading,
    required TResult Function(SuccessCreateChatSocket value)
        successCreateChatSocket,
    required TResult Function(MessageListLoadedState value) messageListLoaded,
    required TResult Function(ChatErrorState value) chatError,
  }) {
    return chatLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitState value)? chatInit,
    TResult? Function(ChatLoadingState value)? chatLoading,
    TResult? Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult? Function(MessageListLoadedState value)? messageListLoaded,
    TResult? Function(ChatErrorState value)? chatError,
  }) {
    return chatLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitState value)? chatInit,
    TResult Function(ChatLoadingState value)? chatLoading,
    TResult Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult Function(MessageListLoadedState value)? messageListLoaded,
    TResult Function(ChatErrorState value)? chatError,
    required TResult orElse(),
  }) {
    if (chatLoading != null) {
      return chatLoading(this);
    }
    return orElse();
  }
}

abstract class ChatLoadingState implements ChatState {
  const factory ChatLoadingState({final String? message}) =
      _$ChatLoadingStateImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$ChatLoadingStateImplCopyWith<_$ChatLoadingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCreateChatSocketImplCopyWith<$Res> {
  factory _$$SuccessCreateChatSocketImplCopyWith(
          _$SuccessCreateChatSocketImpl value,
          $Res Function(_$SuccessCreateChatSocketImpl) then) =
      __$$SuccessCreateChatSocketImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatSocket data});
}

/// @nodoc
class __$$SuccessCreateChatSocketImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$SuccessCreateChatSocketImpl>
    implements _$$SuccessCreateChatSocketImplCopyWith<$Res> {
  __$$SuccessCreateChatSocketImplCopyWithImpl(
      _$SuccessCreateChatSocketImpl _value,
      $Res Function(_$SuccessCreateChatSocketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessCreateChatSocketImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ChatSocket,
    ));
  }
}

/// @nodoc

class _$SuccessCreateChatSocketImpl
    with DiagnosticableTreeMixin
    implements SuccessCreateChatSocket {
  const _$SuccessCreateChatSocketImpl({required this.data});

  @override
  final ChatSocket data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState.successCreateChatSocket(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState.successCreateChatSocket'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessCreateChatSocketImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCreateChatSocketImplCopyWith<_$SuccessCreateChatSocketImpl>
      get copyWith => __$$SuccessCreateChatSocketImplCopyWithImpl<
          _$SuccessCreateChatSocketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInit,
    required TResult Function(String? message) chatLoading,
    required TResult Function(ChatSocket data) successCreateChatSocket,
    required TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)
        messageListLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) chatError,
  }) {
    return successCreateChatSocket(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInit,
    TResult? Function(String? message)? chatLoading,
    TResult? Function(ChatSocket data)? successCreateChatSocket,
    TResult? Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? chatError,
  }) {
    return successCreateChatSocket?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInit,
    TResult Function(String? message)? chatLoading,
    TResult Function(ChatSocket data)? successCreateChatSocket,
    TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? chatError,
    required TResult orElse(),
  }) {
    if (successCreateChatSocket != null) {
      return successCreateChatSocket(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitState value) chatInit,
    required TResult Function(ChatLoadingState value) chatLoading,
    required TResult Function(SuccessCreateChatSocket value)
        successCreateChatSocket,
    required TResult Function(MessageListLoadedState value) messageListLoaded,
    required TResult Function(ChatErrorState value) chatError,
  }) {
    return successCreateChatSocket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitState value)? chatInit,
    TResult? Function(ChatLoadingState value)? chatLoading,
    TResult? Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult? Function(MessageListLoadedState value)? messageListLoaded,
    TResult? Function(ChatErrorState value)? chatError,
  }) {
    return successCreateChatSocket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitState value)? chatInit,
    TResult Function(ChatLoadingState value)? chatLoading,
    TResult Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult Function(MessageListLoadedState value)? messageListLoaded,
    TResult Function(ChatErrorState value)? chatError,
    required TResult orElse(),
  }) {
    if (successCreateChatSocket != null) {
      return successCreateChatSocket(this);
    }
    return orElse();
  }
}

abstract class SuccessCreateChatSocket implements ChatState {
  const factory SuccessCreateChatSocket({required final ChatSocket data}) =
      _$SuccessCreateChatSocketImpl;

  ChatSocket get data;
  @JsonKey(ignore: true)
  _$$SuccessCreateChatSocketImplCopyWith<_$SuccessCreateChatSocketImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageListLoadedStateImplCopyWith<$Res> {
  factory _$$MessageListLoadedStateImplCopyWith(
          _$MessageListLoadedStateImpl value,
          $Res Function(_$MessageListLoadedStateImpl) then) =
      __$$MessageListLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MessageListEntity data, ChatReadyInfo chatInfo});
}

/// @nodoc
class __$$MessageListLoadedStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$MessageListLoadedStateImpl>
    implements _$$MessageListLoadedStateImplCopyWith<$Res> {
  __$$MessageListLoadedStateImplCopyWithImpl(
      _$MessageListLoadedStateImpl _value,
      $Res Function(_$MessageListLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? chatInfo = null,
  }) {
    return _then(_$MessageListLoadedStateImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MessageListEntity,
      chatInfo: null == chatInfo
          ? _value.chatInfo
          : chatInfo // ignore: cast_nullable_to_non_nullable
              as ChatReadyInfo,
    ));
  }
}

/// @nodoc

class _$MessageListLoadedStateImpl
    with DiagnosticableTreeMixin
    implements MessageListLoadedState {
  const _$MessageListLoadedStateImpl(
      {required this.data, required this.chatInfo});

  @override
  final MessageListEntity data;
  @override
  final ChatReadyInfo chatInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState.messageListLoaded(data: $data, chatInfo: $chatInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState.messageListLoaded'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('chatInfo', chatInfo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageListLoadedStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.chatInfo, chatInfo) ||
                other.chatInfo == chatInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, chatInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageListLoadedStateImplCopyWith<_$MessageListLoadedStateImpl>
      get copyWith => __$$MessageListLoadedStateImplCopyWithImpl<
          _$MessageListLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInit,
    required TResult Function(String? message) chatLoading,
    required TResult Function(ChatSocket data) successCreateChatSocket,
    required TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)
        messageListLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) chatError,
  }) {
    return messageListLoaded(data, chatInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInit,
    TResult? Function(String? message)? chatLoading,
    TResult? Function(ChatSocket data)? successCreateChatSocket,
    TResult? Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? chatError,
  }) {
    return messageListLoaded?.call(data, chatInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInit,
    TResult Function(String? message)? chatLoading,
    TResult Function(ChatSocket data)? successCreateChatSocket,
    TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? chatError,
    required TResult orElse(),
  }) {
    if (messageListLoaded != null) {
      return messageListLoaded(data, chatInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitState value) chatInit,
    required TResult Function(ChatLoadingState value) chatLoading,
    required TResult Function(SuccessCreateChatSocket value)
        successCreateChatSocket,
    required TResult Function(MessageListLoadedState value) messageListLoaded,
    required TResult Function(ChatErrorState value) chatError,
  }) {
    return messageListLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitState value)? chatInit,
    TResult? Function(ChatLoadingState value)? chatLoading,
    TResult? Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult? Function(MessageListLoadedState value)? messageListLoaded,
    TResult? Function(ChatErrorState value)? chatError,
  }) {
    return messageListLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitState value)? chatInit,
    TResult Function(ChatLoadingState value)? chatLoading,
    TResult Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult Function(MessageListLoadedState value)? messageListLoaded,
    TResult Function(ChatErrorState value)? chatError,
    required TResult orElse(),
  }) {
    if (messageListLoaded != null) {
      return messageListLoaded(this);
    }
    return orElse();
  }
}

abstract class MessageListLoadedState implements ChatState {
  const factory MessageListLoadedState(
      {required final MessageListEntity data,
      required final ChatReadyInfo chatInfo}) = _$MessageListLoadedStateImpl;

  MessageListEntity get data;
  ChatReadyInfo get chatInfo;
  @JsonKey(ignore: true)
  _$$MessageListLoadedStateImplCopyWith<_$MessageListLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatErrorStateImplCopyWith<$Res> {
  factory _$$ChatErrorStateImplCopyWith(_$ChatErrorStateImpl value,
          $Res Function(_$ChatErrorStateImpl) then) =
      __$$ChatErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$ChatErrorStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatErrorStateImpl>
    implements _$$ChatErrorStateImplCopyWith<$Res> {
  __$$ChatErrorStateImplCopyWithImpl(
      _$ChatErrorStateImpl _value, $Res Function(_$ChatErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? callback = null,
  }) {
    return _then(_$ChatErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrors,
      null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppErrorsCopyWith<$Res> get error {
    return $AppErrorsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ChatErrorStateImpl
    with DiagnosticableTreeMixin
    implements ChatErrorState {
  const _$ChatErrorStateImpl(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState.chatError(error: $error, callback: $callback)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState.chatError'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('callback', callback));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatErrorStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, callback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatErrorStateImplCopyWith<_$ChatErrorStateImpl> get copyWith =>
      __$$ChatErrorStateImplCopyWithImpl<_$ChatErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() chatInit,
    required TResult Function(String? message) chatLoading,
    required TResult Function(ChatSocket data) successCreateChatSocket,
    required TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)
        messageListLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) chatError,
  }) {
    return chatError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? chatInit,
    TResult? Function(String? message)? chatLoading,
    TResult? Function(ChatSocket data)? successCreateChatSocket,
    TResult? Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? chatError,
  }) {
    return chatError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? chatInit,
    TResult Function(String? message)? chatLoading,
    TResult Function(ChatSocket data)? successCreateChatSocket,
    TResult Function(MessageListEntity data, ChatReadyInfo chatInfo)?
        messageListLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? chatError,
    required TResult orElse(),
  }) {
    if (chatError != null) {
      return chatError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatInitState value) chatInit,
    required TResult Function(ChatLoadingState value) chatLoading,
    required TResult Function(SuccessCreateChatSocket value)
        successCreateChatSocket,
    required TResult Function(MessageListLoadedState value) messageListLoaded,
    required TResult Function(ChatErrorState value) chatError,
  }) {
    return chatError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatInitState value)? chatInit,
    TResult? Function(ChatLoadingState value)? chatLoading,
    TResult? Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult? Function(MessageListLoadedState value)? messageListLoaded,
    TResult? Function(ChatErrorState value)? chatError,
  }) {
    return chatError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatInitState value)? chatInit,
    TResult Function(ChatLoadingState value)? chatLoading,
    TResult Function(SuccessCreateChatSocket value)? successCreateChatSocket,
    TResult Function(MessageListLoadedState value)? messageListLoaded,
    TResult Function(ChatErrorState value)? chatError,
    required TResult orElse(),
  }) {
    if (chatError != null) {
      return chatError(this);
    }
    return orElse();
  }
}

abstract class ChatErrorState implements ChatState {
  const factory ChatErrorState(
          final AppErrors error, final VoidCallback callback) =
      _$ChatErrorStateImpl;

  AppErrors get error;
  VoidCallback get callback;
  @JsonKey(ignore: true)
  _$$ChatErrorStateImplCopyWith<_$ChatErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
