// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationState()';
}


}

/// @nodoc
class $NotificationStateCopyWith<$Res>  {
$NotificationStateCopyWith(NotificationState _, $Res Function(NotificationState) __);
}


/// Adds pattern-matching-related methods to [NotificationState].
extension NotificationStatePatterns on NotificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotificationInitState value)?  notificationInit,TResult Function( NotificationLoadingState value)?  notificationLoading,TResult Function( NotificationErrorState value)?  notificationError,TResult Function( NotificationsLoadedState value)?  notificationsLoaded,TResult Function( SuccessChangeNotificationStatusState value)?  successChangeNotificationStatus,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotificationInitState() when notificationInit != null:
return notificationInit(_that);case NotificationLoadingState() when notificationLoading != null:
return notificationLoading(_that);case NotificationErrorState() when notificationError != null:
return notificationError(_that);case NotificationsLoadedState() when notificationsLoaded != null:
return notificationsLoaded(_that);case SuccessChangeNotificationStatusState() when successChangeNotificationStatus != null:
return successChangeNotificationStatus(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotificationInitState value)  notificationInit,required TResult Function( NotificationLoadingState value)  notificationLoading,required TResult Function( NotificationErrorState value)  notificationError,required TResult Function( NotificationsLoadedState value)  notificationsLoaded,required TResult Function( SuccessChangeNotificationStatusState value)  successChangeNotificationStatus,}){
final _that = this;
switch (_that) {
case NotificationInitState():
return notificationInit(_that);case NotificationLoadingState():
return notificationLoading(_that);case NotificationErrorState():
return notificationError(_that);case NotificationsLoadedState():
return notificationsLoaded(_that);case SuccessChangeNotificationStatusState():
return successChangeNotificationStatus(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotificationInitState value)?  notificationInit,TResult? Function( NotificationLoadingState value)?  notificationLoading,TResult? Function( NotificationErrorState value)?  notificationError,TResult? Function( NotificationsLoadedState value)?  notificationsLoaded,TResult? Function( SuccessChangeNotificationStatusState value)?  successChangeNotificationStatus,}){
final _that = this;
switch (_that) {
case NotificationInitState() when notificationInit != null:
return notificationInit(_that);case NotificationLoadingState() when notificationLoading != null:
return notificationLoading(_that);case NotificationErrorState() when notificationError != null:
return notificationError(_that);case NotificationsLoadedState() when notificationsLoaded != null:
return notificationsLoaded(_that);case SuccessChangeNotificationStatusState() when successChangeNotificationStatus != null:
return successChangeNotificationStatus(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  notificationInit,TResult Function()?  notificationLoading,TResult Function( AppErrors error,  VoidCallback callback)?  notificationError,TResult Function( List<NotificationEntity> notificationEntity)?  notificationsLoaded,TResult Function()?  successChangeNotificationStatus,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NotificationInitState() when notificationInit != null:
return notificationInit();case NotificationLoadingState() when notificationLoading != null:
return notificationLoading();case NotificationErrorState() when notificationError != null:
return notificationError(_that.error,_that.callback);case NotificationsLoadedState() when notificationsLoaded != null:
return notificationsLoaded(_that.notificationEntity);case SuccessChangeNotificationStatusState() when successChangeNotificationStatus != null:
return successChangeNotificationStatus();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  notificationInit,required TResult Function()  notificationLoading,required TResult Function( AppErrors error,  VoidCallback callback)  notificationError,required TResult Function( List<NotificationEntity> notificationEntity)  notificationsLoaded,required TResult Function()  successChangeNotificationStatus,}) {final _that = this;
switch (_that) {
case NotificationInitState():
return notificationInit();case NotificationLoadingState():
return notificationLoading();case NotificationErrorState():
return notificationError(_that.error,_that.callback);case NotificationsLoadedState():
return notificationsLoaded(_that.notificationEntity);case SuccessChangeNotificationStatusState():
return successChangeNotificationStatus();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  notificationInit,TResult? Function()?  notificationLoading,TResult? Function( AppErrors error,  VoidCallback callback)?  notificationError,TResult? Function( List<NotificationEntity> notificationEntity)?  notificationsLoaded,TResult? Function()?  successChangeNotificationStatus,}) {final _that = this;
switch (_that) {
case NotificationInitState() when notificationInit != null:
return notificationInit();case NotificationLoadingState() when notificationLoading != null:
return notificationLoading();case NotificationErrorState() when notificationError != null:
return notificationError(_that.error,_that.callback);case NotificationsLoadedState() when notificationsLoaded != null:
return notificationsLoaded(_that.notificationEntity);case SuccessChangeNotificationStatusState() when successChangeNotificationStatus != null:
return successChangeNotificationStatus();case _:
  return null;

}
}

}

/// @nodoc


class NotificationInitState implements NotificationState {
  const NotificationInitState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationInitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationState.notificationInit()';
}


}




/// @nodoc


class NotificationLoadingState implements NotificationState {
  const NotificationLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationState.notificationLoading()';
}


}




/// @nodoc


class NotificationErrorState implements NotificationState {
  const NotificationErrorState(this.error, this.callback);
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationErrorStateCopyWith<NotificationErrorState> get copyWith => _$NotificationErrorStateCopyWithImpl<NotificationErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationErrorState&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString() {
  return 'NotificationState.notificationError(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $NotificationErrorStateCopyWith<$Res> implements $NotificationStateCopyWith<$Res> {
  factory $NotificationErrorStateCopyWith(NotificationErrorState value, $Res Function(NotificationErrorState) _then) = _$NotificationErrorStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$NotificationErrorStateCopyWithImpl<$Res>
    implements $NotificationErrorStateCopyWith<$Res> {
  _$NotificationErrorStateCopyWithImpl(this._self, this._then);

  final NotificationErrorState _self;
  final $Res Function(NotificationErrorState) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(NotificationErrorState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorsCopyWith<$Res> get error {
  
  return $AppErrorsCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc


class NotificationsLoadedState implements NotificationState {
  const NotificationsLoadedState(final  List<NotificationEntity> notificationEntity): _notificationEntity = notificationEntity;
  

 final  List<NotificationEntity> _notificationEntity;
 List<NotificationEntity> get notificationEntity {
  if (_notificationEntity is EqualUnmodifiableListView) return _notificationEntity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notificationEntity);
}


/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsLoadedStateCopyWith<NotificationsLoadedState> get copyWith => _$NotificationsLoadedStateCopyWithImpl<NotificationsLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsLoadedState&&const DeepCollectionEquality().equals(other._notificationEntity, _notificationEntity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notificationEntity));

@override
String toString() {
  return 'NotificationState.notificationsLoaded(notificationEntity: $notificationEntity)';
}


}

/// @nodoc
abstract mixin class $NotificationsLoadedStateCopyWith<$Res> implements $NotificationStateCopyWith<$Res> {
  factory $NotificationsLoadedStateCopyWith(NotificationsLoadedState value, $Res Function(NotificationsLoadedState) _then) = _$NotificationsLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<NotificationEntity> notificationEntity
});




}
/// @nodoc
class _$NotificationsLoadedStateCopyWithImpl<$Res>
    implements $NotificationsLoadedStateCopyWith<$Res> {
  _$NotificationsLoadedStateCopyWithImpl(this._self, this._then);

  final NotificationsLoadedState _self;
  final $Res Function(NotificationsLoadedState) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationEntity = null,}) {
  return _then(NotificationsLoadedState(
null == notificationEntity ? _self._notificationEntity : notificationEntity // ignore: cast_nullable_to_non_nullable
as List<NotificationEntity>,
  ));
}


}

/// @nodoc


class SuccessChangeNotificationStatusState implements NotificationState {
  const SuccessChangeNotificationStatusState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessChangeNotificationStatusState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationState.successChangeNotificationStatus()';
}


}




// dart format on
