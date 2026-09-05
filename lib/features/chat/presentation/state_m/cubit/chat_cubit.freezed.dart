// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatState()';
}


}

/// @nodoc
class $ChatStateCopyWith<$Res>  {
$ChatStateCopyWith(ChatState _, $Res Function(ChatState) __);
}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatInitState value)?  chatInit,TResult Function( ChatLoadingState value)?  chatLoading,TResult Function( SuccessCreateChatSocket value)?  successCreateChatSocket,TResult Function( MessageListLoadedState value)?  messageListLoaded,TResult Function( ChatErrorState value)?  chatError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatInitState() when chatInit != null:
return chatInit(_that);case ChatLoadingState() when chatLoading != null:
return chatLoading(_that);case SuccessCreateChatSocket() when successCreateChatSocket != null:
return successCreateChatSocket(_that);case MessageListLoadedState() when messageListLoaded != null:
return messageListLoaded(_that);case ChatErrorState() when chatError != null:
return chatError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatInitState value)  chatInit,required TResult Function( ChatLoadingState value)  chatLoading,required TResult Function( SuccessCreateChatSocket value)  successCreateChatSocket,required TResult Function( MessageListLoadedState value)  messageListLoaded,required TResult Function( ChatErrorState value)  chatError,}){
final _that = this;
switch (_that) {
case ChatInitState():
return chatInit(_that);case ChatLoadingState():
return chatLoading(_that);case SuccessCreateChatSocket():
return successCreateChatSocket(_that);case MessageListLoadedState():
return messageListLoaded(_that);case ChatErrorState():
return chatError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatInitState value)?  chatInit,TResult? Function( ChatLoadingState value)?  chatLoading,TResult? Function( SuccessCreateChatSocket value)?  successCreateChatSocket,TResult? Function( MessageListLoadedState value)?  messageListLoaded,TResult? Function( ChatErrorState value)?  chatError,}){
final _that = this;
switch (_that) {
case ChatInitState() when chatInit != null:
return chatInit(_that);case ChatLoadingState() when chatLoading != null:
return chatLoading(_that);case SuccessCreateChatSocket() when successCreateChatSocket != null:
return successCreateChatSocket(_that);case MessageListLoadedState() when messageListLoaded != null:
return messageListLoaded(_that);case ChatErrorState() when chatError != null:
return chatError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  chatInit,TResult Function( String? message)?  chatLoading,TResult Function( ChatSocket data)?  successCreateChatSocket,TResult Function( MessageListEntity data,  ChatReadyInfo chatInfo)?  messageListLoaded,TResult Function( AppErrors error,  VoidCallback callback)?  chatError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatInitState() when chatInit != null:
return chatInit();case ChatLoadingState() when chatLoading != null:
return chatLoading(_that.message);case SuccessCreateChatSocket() when successCreateChatSocket != null:
return successCreateChatSocket(_that.data);case MessageListLoadedState() when messageListLoaded != null:
return messageListLoaded(_that.data,_that.chatInfo);case ChatErrorState() when chatError != null:
return chatError(_that.error,_that.callback);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  chatInit,required TResult Function( String? message)  chatLoading,required TResult Function( ChatSocket data)  successCreateChatSocket,required TResult Function( MessageListEntity data,  ChatReadyInfo chatInfo)  messageListLoaded,required TResult Function( AppErrors error,  VoidCallback callback)  chatError,}) {final _that = this;
switch (_that) {
case ChatInitState():
return chatInit();case ChatLoadingState():
return chatLoading(_that.message);case SuccessCreateChatSocket():
return successCreateChatSocket(_that.data);case MessageListLoadedState():
return messageListLoaded(_that.data,_that.chatInfo);case ChatErrorState():
return chatError(_that.error,_that.callback);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  chatInit,TResult? Function( String? message)?  chatLoading,TResult? Function( ChatSocket data)?  successCreateChatSocket,TResult? Function( MessageListEntity data,  ChatReadyInfo chatInfo)?  messageListLoaded,TResult? Function( AppErrors error,  VoidCallback callback)?  chatError,}) {final _that = this;
switch (_that) {
case ChatInitState() when chatInit != null:
return chatInit();case ChatLoadingState() when chatLoading != null:
return chatLoading(_that.message);case SuccessCreateChatSocket() when successCreateChatSocket != null:
return successCreateChatSocket(_that.data);case MessageListLoadedState() when messageListLoaded != null:
return messageListLoaded(_that.data,_that.chatInfo);case ChatErrorState() when chatError != null:
return chatError(_that.error,_that.callback);case _:
  return null;

}
}

}

/// @nodoc


class ChatInitState with DiagnosticableTreeMixin implements ChatState {
  const ChatInitState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatState.chatInit'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatState.chatInit()';
}


}




/// @nodoc


class ChatLoadingState with DiagnosticableTreeMixin implements ChatState {
  const ChatLoadingState({this.message});
  

 final  String? message;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatLoadingStateCopyWith<ChatLoadingState> get copyWith => _$ChatLoadingStateCopyWithImpl<ChatLoadingState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatState.chatLoading'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatLoadingState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatState.chatLoading(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatLoadingStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory $ChatLoadingStateCopyWith(ChatLoadingState value, $Res Function(ChatLoadingState) _then) = _$ChatLoadingStateCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ChatLoadingStateCopyWithImpl<$Res>
    implements $ChatLoadingStateCopyWith<$Res> {
  _$ChatLoadingStateCopyWithImpl(this._self, this._then);

  final ChatLoadingState _self;
  final $Res Function(ChatLoadingState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ChatLoadingState(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SuccessCreateChatSocket with DiagnosticableTreeMixin implements ChatState {
  const SuccessCreateChatSocket({required this.data});
  

 final  ChatSocket data;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCreateChatSocketCopyWith<SuccessCreateChatSocket> get copyWith => _$SuccessCreateChatSocketCopyWithImpl<SuccessCreateChatSocket>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatState.successCreateChatSocket'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessCreateChatSocket&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatState.successCreateChatSocket(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessCreateChatSocketCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory $SuccessCreateChatSocketCopyWith(SuccessCreateChatSocket value, $Res Function(SuccessCreateChatSocket) _then) = _$SuccessCreateChatSocketCopyWithImpl;
@useResult
$Res call({
 ChatSocket data
});




}
/// @nodoc
class _$SuccessCreateChatSocketCopyWithImpl<$Res>
    implements $SuccessCreateChatSocketCopyWith<$Res> {
  _$SuccessCreateChatSocketCopyWithImpl(this._self, this._then);

  final SuccessCreateChatSocket _self;
  final $Res Function(SuccessCreateChatSocket) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(SuccessCreateChatSocket(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ChatSocket,
  ));
}


}

/// @nodoc


class MessageListLoadedState with DiagnosticableTreeMixin implements ChatState {
  const MessageListLoadedState({required this.data, required this.chatInfo});
  

 final  MessageListEntity data;
 final  ChatReadyInfo chatInfo;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageListLoadedStateCopyWith<MessageListLoadedState> get copyWith => _$MessageListLoadedStateCopyWithImpl<MessageListLoadedState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatState.messageListLoaded'))
    ..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('chatInfo', chatInfo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageListLoadedState&&(identical(other.data, data) || other.data == data)&&(identical(other.chatInfo, chatInfo) || other.chatInfo == chatInfo));
}


@override
int get hashCode => Object.hash(runtimeType,data,chatInfo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatState.messageListLoaded(data: $data, chatInfo: $chatInfo)';
}


}

/// @nodoc
abstract mixin class $MessageListLoadedStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory $MessageListLoadedStateCopyWith(MessageListLoadedState value, $Res Function(MessageListLoadedState) _then) = _$MessageListLoadedStateCopyWithImpl;
@useResult
$Res call({
 MessageListEntity data, ChatReadyInfo chatInfo
});




}
/// @nodoc
class _$MessageListLoadedStateCopyWithImpl<$Res>
    implements $MessageListLoadedStateCopyWith<$Res> {
  _$MessageListLoadedStateCopyWithImpl(this._self, this._then);

  final MessageListLoadedState _self;
  final $Res Function(MessageListLoadedState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,Object? chatInfo = null,}) {
  return _then(MessageListLoadedState(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MessageListEntity,chatInfo: null == chatInfo ? _self.chatInfo : chatInfo // ignore: cast_nullable_to_non_nullable
as ChatReadyInfo,
  ));
}


}

/// @nodoc


class ChatErrorState with DiagnosticableTreeMixin implements ChatState {
  const ChatErrorState(this.error, this.callback);
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatErrorStateCopyWith<ChatErrorState> get copyWith => _$ChatErrorStateCopyWithImpl<ChatErrorState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChatState.chatError'))
    ..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('callback', callback));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatErrorState&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatState.chatError(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $ChatErrorStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory $ChatErrorStateCopyWith(ChatErrorState value, $Res Function(ChatErrorState) _then) = _$ChatErrorStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$ChatErrorStateCopyWithImpl<$Res>
    implements $ChatErrorStateCopyWith<$Res> {
  _$ChatErrorStateCopyWithImpl(this._self, this._then);

  final ChatErrorState _self;
  final $Res Function(ChatErrorState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(ChatErrorState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorsCopyWith<$Res> get error {
  
  return $AppErrorsCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
