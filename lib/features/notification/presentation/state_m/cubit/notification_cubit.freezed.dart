// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notificationInit,
    required TResult Function() notificationLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        notificationError,
    required TResult Function(List<NotificationEntity> notificationEntity)
        notificationsLoaded,
    required TResult Function() successChangeNotificationStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notificationInit,
    TResult? Function()? notificationLoading,
    TResult? Function(AppErrors error, VoidCallback callback)?
        notificationError,
    TResult? Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult? Function()? successChangeNotificationStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notificationInit,
    TResult Function()? notificationLoading,
    TResult Function(AppErrors error, VoidCallback callback)? notificationError,
    TResult Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult Function()? successChangeNotificationStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationInitState value) notificationInit,
    required TResult Function(NotificationLoadingState value)
        notificationLoading,
    required TResult Function(NotificationErrorState value) notificationError,
    required TResult Function(NotificationsLoadedState value)
        notificationsLoaded,
    required TResult Function(SuccessChangeNotificationStatusState value)
        successChangeNotificationStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationInitState value)? notificationInit,
    TResult? Function(NotificationLoadingState value)? notificationLoading,
    TResult? Function(NotificationErrorState value)? notificationError,
    TResult? Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult? Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationInitState value)? notificationInit,
    TResult Function(NotificationLoadingState value)? notificationLoading,
    TResult Function(NotificationErrorState value)? notificationError,
    TResult Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotificationInitStateImplCopyWith<$Res> {
  factory _$$NotificationInitStateImplCopyWith(
          _$NotificationInitStateImpl value,
          $Res Function(_$NotificationInitStateImpl) then) =
      __$$NotificationInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationInitStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationInitStateImpl>
    implements _$$NotificationInitStateImplCopyWith<$Res> {
  __$$NotificationInitStateImplCopyWithImpl(_$NotificationInitStateImpl _value,
      $Res Function(_$NotificationInitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotificationInitStateImpl implements NotificationInitState {
  const _$NotificationInitStateImpl();

  @override
  String toString() {
    return 'NotificationState.notificationInit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notificationInit,
    required TResult Function() notificationLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        notificationError,
    required TResult Function(List<NotificationEntity> notificationEntity)
        notificationsLoaded,
    required TResult Function() successChangeNotificationStatus,
  }) {
    return notificationInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notificationInit,
    TResult? Function()? notificationLoading,
    TResult? Function(AppErrors error, VoidCallback callback)?
        notificationError,
    TResult? Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult? Function()? successChangeNotificationStatus,
  }) {
    return notificationInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notificationInit,
    TResult Function()? notificationLoading,
    TResult Function(AppErrors error, VoidCallback callback)? notificationError,
    TResult Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult Function()? successChangeNotificationStatus,
    required TResult orElse(),
  }) {
    if (notificationInit != null) {
      return notificationInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationInitState value) notificationInit,
    required TResult Function(NotificationLoadingState value)
        notificationLoading,
    required TResult Function(NotificationErrorState value) notificationError,
    required TResult Function(NotificationsLoadedState value)
        notificationsLoaded,
    required TResult Function(SuccessChangeNotificationStatusState value)
        successChangeNotificationStatus,
  }) {
    return notificationInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationInitState value)? notificationInit,
    TResult? Function(NotificationLoadingState value)? notificationLoading,
    TResult? Function(NotificationErrorState value)? notificationError,
    TResult? Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult? Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
  }) {
    return notificationInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationInitState value)? notificationInit,
    TResult Function(NotificationLoadingState value)? notificationLoading,
    TResult Function(NotificationErrorState value)? notificationError,
    TResult Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
    required TResult orElse(),
  }) {
    if (notificationInit != null) {
      return notificationInit(this);
    }
    return orElse();
  }
}

abstract class NotificationInitState implements NotificationState {
  const factory NotificationInitState() = _$NotificationInitStateImpl;
}

/// @nodoc
abstract class _$$NotificationLoadingStateImplCopyWith<$Res> {
  factory _$$NotificationLoadingStateImplCopyWith(
          _$NotificationLoadingStateImpl value,
          $Res Function(_$NotificationLoadingStateImpl) then) =
      __$$NotificationLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationLoadingStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$NotificationLoadingStateImpl>
    implements _$$NotificationLoadingStateImplCopyWith<$Res> {
  __$$NotificationLoadingStateImplCopyWithImpl(
      _$NotificationLoadingStateImpl _value,
      $Res Function(_$NotificationLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotificationLoadingStateImpl implements NotificationLoadingState {
  const _$NotificationLoadingStateImpl();

  @override
  String toString() {
    return 'NotificationState.notificationLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notificationInit,
    required TResult Function() notificationLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        notificationError,
    required TResult Function(List<NotificationEntity> notificationEntity)
        notificationsLoaded,
    required TResult Function() successChangeNotificationStatus,
  }) {
    return notificationLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notificationInit,
    TResult? Function()? notificationLoading,
    TResult? Function(AppErrors error, VoidCallback callback)?
        notificationError,
    TResult? Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult? Function()? successChangeNotificationStatus,
  }) {
    return notificationLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notificationInit,
    TResult Function()? notificationLoading,
    TResult Function(AppErrors error, VoidCallback callback)? notificationError,
    TResult Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult Function()? successChangeNotificationStatus,
    required TResult orElse(),
  }) {
    if (notificationLoading != null) {
      return notificationLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationInitState value) notificationInit,
    required TResult Function(NotificationLoadingState value)
        notificationLoading,
    required TResult Function(NotificationErrorState value) notificationError,
    required TResult Function(NotificationsLoadedState value)
        notificationsLoaded,
    required TResult Function(SuccessChangeNotificationStatusState value)
        successChangeNotificationStatus,
  }) {
    return notificationLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationInitState value)? notificationInit,
    TResult? Function(NotificationLoadingState value)? notificationLoading,
    TResult? Function(NotificationErrorState value)? notificationError,
    TResult? Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult? Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
  }) {
    return notificationLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationInitState value)? notificationInit,
    TResult Function(NotificationLoadingState value)? notificationLoading,
    TResult Function(NotificationErrorState value)? notificationError,
    TResult Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
    required TResult orElse(),
  }) {
    if (notificationLoading != null) {
      return notificationLoading(this);
    }
    return orElse();
  }
}

abstract class NotificationLoadingState implements NotificationState {
  const factory NotificationLoadingState() = _$NotificationLoadingStateImpl;
}

/// @nodoc
abstract class _$$NotificationErrorStateImplCopyWith<$Res> {
  factory _$$NotificationErrorStateImplCopyWith(
          _$NotificationErrorStateImpl value,
          $Res Function(_$NotificationErrorStateImpl) then) =
      __$$NotificationErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$NotificationErrorStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationErrorStateImpl>
    implements _$$NotificationErrorStateImplCopyWith<$Res> {
  __$$NotificationErrorStateImplCopyWithImpl(
      _$NotificationErrorStateImpl _value,
      $Res Function(_$NotificationErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? callback = null,
  }) {
    return _then(_$NotificationErrorStateImpl(
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

class _$NotificationErrorStateImpl implements NotificationErrorState {
  const _$NotificationErrorStateImpl(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'NotificationState.notificationError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationErrorStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, callback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationErrorStateImplCopyWith<_$NotificationErrorStateImpl>
      get copyWith => __$$NotificationErrorStateImplCopyWithImpl<
          _$NotificationErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notificationInit,
    required TResult Function() notificationLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        notificationError,
    required TResult Function(List<NotificationEntity> notificationEntity)
        notificationsLoaded,
    required TResult Function() successChangeNotificationStatus,
  }) {
    return notificationError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notificationInit,
    TResult? Function()? notificationLoading,
    TResult? Function(AppErrors error, VoidCallback callback)?
        notificationError,
    TResult? Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult? Function()? successChangeNotificationStatus,
  }) {
    return notificationError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notificationInit,
    TResult Function()? notificationLoading,
    TResult Function(AppErrors error, VoidCallback callback)? notificationError,
    TResult Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult Function()? successChangeNotificationStatus,
    required TResult orElse(),
  }) {
    if (notificationError != null) {
      return notificationError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationInitState value) notificationInit,
    required TResult Function(NotificationLoadingState value)
        notificationLoading,
    required TResult Function(NotificationErrorState value) notificationError,
    required TResult Function(NotificationsLoadedState value)
        notificationsLoaded,
    required TResult Function(SuccessChangeNotificationStatusState value)
        successChangeNotificationStatus,
  }) {
    return notificationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationInitState value)? notificationInit,
    TResult? Function(NotificationLoadingState value)? notificationLoading,
    TResult? Function(NotificationErrorState value)? notificationError,
    TResult? Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult? Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
  }) {
    return notificationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationInitState value)? notificationInit,
    TResult Function(NotificationLoadingState value)? notificationLoading,
    TResult Function(NotificationErrorState value)? notificationError,
    TResult Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
    required TResult orElse(),
  }) {
    if (notificationError != null) {
      return notificationError(this);
    }
    return orElse();
  }
}

abstract class NotificationErrorState implements NotificationState {
  const factory NotificationErrorState(
          final AppErrors error, final VoidCallback callback) =
      _$NotificationErrorStateImpl;

  AppErrors get error;
  VoidCallback get callback;
  @JsonKey(ignore: true)
  _$$NotificationErrorStateImplCopyWith<_$NotificationErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationsLoadedStateImplCopyWith<$Res> {
  factory _$$NotificationsLoadedStateImplCopyWith(
          _$NotificationsLoadedStateImpl value,
          $Res Function(_$NotificationsLoadedStateImpl) then) =
      __$$NotificationsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationEntity> notificationEntity});
}

/// @nodoc
class __$$NotificationsLoadedStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$NotificationsLoadedStateImpl>
    implements _$$NotificationsLoadedStateImplCopyWith<$Res> {
  __$$NotificationsLoadedStateImplCopyWithImpl(
      _$NotificationsLoadedStateImpl _value,
      $Res Function(_$NotificationsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationEntity = null,
  }) {
    return _then(_$NotificationsLoadedStateImpl(
      null == notificationEntity
          ? _value._notificationEntity
          : notificationEntity // ignore: cast_nullable_to_non_nullable
              as List<NotificationEntity>,
    ));
  }
}

/// @nodoc

class _$NotificationsLoadedStateImpl implements NotificationsLoadedState {
  const _$NotificationsLoadedStateImpl(
      final List<NotificationEntity> notificationEntity)
      : _notificationEntity = notificationEntity;

  final List<NotificationEntity> _notificationEntity;
  @override
  List<NotificationEntity> get notificationEntity {
    if (_notificationEntity is EqualUnmodifiableListView)
      return _notificationEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationEntity);
  }

  @override
  String toString() {
    return 'NotificationState.notificationsLoaded(notificationEntity: $notificationEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsLoadedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._notificationEntity, _notificationEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notificationEntity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsLoadedStateImplCopyWith<_$NotificationsLoadedStateImpl>
      get copyWith => __$$NotificationsLoadedStateImplCopyWithImpl<
          _$NotificationsLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notificationInit,
    required TResult Function() notificationLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        notificationError,
    required TResult Function(List<NotificationEntity> notificationEntity)
        notificationsLoaded,
    required TResult Function() successChangeNotificationStatus,
  }) {
    return notificationsLoaded(notificationEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notificationInit,
    TResult? Function()? notificationLoading,
    TResult? Function(AppErrors error, VoidCallback callback)?
        notificationError,
    TResult? Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult? Function()? successChangeNotificationStatus,
  }) {
    return notificationsLoaded?.call(notificationEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notificationInit,
    TResult Function()? notificationLoading,
    TResult Function(AppErrors error, VoidCallback callback)? notificationError,
    TResult Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult Function()? successChangeNotificationStatus,
    required TResult orElse(),
  }) {
    if (notificationsLoaded != null) {
      return notificationsLoaded(notificationEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationInitState value) notificationInit,
    required TResult Function(NotificationLoadingState value)
        notificationLoading,
    required TResult Function(NotificationErrorState value) notificationError,
    required TResult Function(NotificationsLoadedState value)
        notificationsLoaded,
    required TResult Function(SuccessChangeNotificationStatusState value)
        successChangeNotificationStatus,
  }) {
    return notificationsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationInitState value)? notificationInit,
    TResult? Function(NotificationLoadingState value)? notificationLoading,
    TResult? Function(NotificationErrorState value)? notificationError,
    TResult? Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult? Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
  }) {
    return notificationsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationInitState value)? notificationInit,
    TResult Function(NotificationLoadingState value)? notificationLoading,
    TResult Function(NotificationErrorState value)? notificationError,
    TResult Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
    required TResult orElse(),
  }) {
    if (notificationsLoaded != null) {
      return notificationsLoaded(this);
    }
    return orElse();
  }
}

abstract class NotificationsLoadedState implements NotificationState {
  const factory NotificationsLoadedState(
          final List<NotificationEntity> notificationEntity) =
      _$NotificationsLoadedStateImpl;

  List<NotificationEntity> get notificationEntity;
  @JsonKey(ignore: true)
  _$$NotificationsLoadedStateImplCopyWith<_$NotificationsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessChangeNotificationStatusStateImplCopyWith<$Res> {
  factory _$$SuccessChangeNotificationStatusStateImplCopyWith(
          _$SuccessChangeNotificationStatusStateImpl value,
          $Res Function(_$SuccessChangeNotificationStatusStateImpl) then) =
      __$$SuccessChangeNotificationStatusStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessChangeNotificationStatusStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$SuccessChangeNotificationStatusStateImpl>
    implements _$$SuccessChangeNotificationStatusStateImplCopyWith<$Res> {
  __$$SuccessChangeNotificationStatusStateImplCopyWithImpl(
      _$SuccessChangeNotificationStatusStateImpl _value,
      $Res Function(_$SuccessChangeNotificationStatusStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessChangeNotificationStatusStateImpl
    implements SuccessChangeNotificationStatusState {
  const _$SuccessChangeNotificationStatusStateImpl();

  @override
  String toString() {
    return 'NotificationState.successChangeNotificationStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessChangeNotificationStatusStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notificationInit,
    required TResult Function() notificationLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        notificationError,
    required TResult Function(List<NotificationEntity> notificationEntity)
        notificationsLoaded,
    required TResult Function() successChangeNotificationStatus,
  }) {
    return successChangeNotificationStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notificationInit,
    TResult? Function()? notificationLoading,
    TResult? Function(AppErrors error, VoidCallback callback)?
        notificationError,
    TResult? Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult? Function()? successChangeNotificationStatus,
  }) {
    return successChangeNotificationStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notificationInit,
    TResult Function()? notificationLoading,
    TResult Function(AppErrors error, VoidCallback callback)? notificationError,
    TResult Function(List<NotificationEntity> notificationEntity)?
        notificationsLoaded,
    TResult Function()? successChangeNotificationStatus,
    required TResult orElse(),
  }) {
    if (successChangeNotificationStatus != null) {
      return successChangeNotificationStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationInitState value) notificationInit,
    required TResult Function(NotificationLoadingState value)
        notificationLoading,
    required TResult Function(NotificationErrorState value) notificationError,
    required TResult Function(NotificationsLoadedState value)
        notificationsLoaded,
    required TResult Function(SuccessChangeNotificationStatusState value)
        successChangeNotificationStatus,
  }) {
    return successChangeNotificationStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationInitState value)? notificationInit,
    TResult? Function(NotificationLoadingState value)? notificationLoading,
    TResult? Function(NotificationErrorState value)? notificationError,
    TResult? Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult? Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
  }) {
    return successChangeNotificationStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationInitState value)? notificationInit,
    TResult Function(NotificationLoadingState value)? notificationLoading,
    TResult Function(NotificationErrorState value)? notificationError,
    TResult Function(NotificationsLoadedState value)? notificationsLoaded,
    TResult Function(SuccessChangeNotificationStatusState value)?
        successChangeNotificationStatus,
    required TResult orElse(),
  }) {
    if (successChangeNotificationStatus != null) {
      return successChangeNotificationStatus(this);
    }
    return orElse();
  }
}

abstract class SuccessChangeNotificationStatusState
    implements NotificationState {
  const factory SuccessChangeNotificationStatusState() =
      _$SuccessChangeNotificationStatusStateImpl;
}
