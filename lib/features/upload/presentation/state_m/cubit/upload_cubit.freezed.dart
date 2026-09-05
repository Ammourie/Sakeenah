// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UploadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uploadInitState,
    required TResult Function() uploadLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        uploadErrorState,
    required TResult Function(UrlEntity urlEntity) uploadSuccessState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uploadInitState,
    TResult? Function()? uploadLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)? uploadErrorState,
    TResult? Function(UrlEntity urlEntity)? uploadSuccessState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uploadInitState,
    TResult Function()? uploadLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? uploadErrorState,
    TResult Function(UrlEntity urlEntity)? uploadSuccessState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadInitState value) uploadInitState,
    required TResult Function(UploadLoadingState value) uploadLoadingState,
    required TResult Function(UploadErrorState value) uploadErrorState,
    required TResult Function(UploadSuccessState value) uploadSuccessState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadInitState value)? uploadInitState,
    TResult? Function(UploadLoadingState value)? uploadLoadingState,
    TResult? Function(UploadErrorState value)? uploadErrorState,
    TResult? Function(UploadSuccessState value)? uploadSuccessState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadInitState value)? uploadInitState,
    TResult Function(UploadLoadingState value)? uploadLoadingState,
    TResult Function(UploadErrorState value)? uploadErrorState,
    TResult Function(UploadSuccessState value)? uploadSuccessState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadStateCopyWith<$Res> {
  factory $UploadStateCopyWith(
          UploadState value, $Res Function(UploadState) then) =
      _$UploadStateCopyWithImpl<$Res, UploadState>;
}

/// @nodoc
class _$UploadStateCopyWithImpl<$Res, $Val extends UploadState>
    implements $UploadStateCopyWith<$Res> {
  _$UploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UploadInitStateImplCopyWith<$Res> {
  factory _$$UploadInitStateImplCopyWith(_$UploadInitStateImpl value,
          $Res Function(_$UploadInitStateImpl) then) =
      __$$UploadInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadInitStateImplCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$UploadInitStateImpl>
    implements _$$UploadInitStateImplCopyWith<$Res> {
  __$$UploadInitStateImplCopyWithImpl(
      _$UploadInitStateImpl _value, $Res Function(_$UploadInitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UploadInitStateImpl implements UploadInitState {
  const _$UploadInitStateImpl();

  @override
  String toString() {
    return 'UploadState.uploadInitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uploadInitState,
    required TResult Function() uploadLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        uploadErrorState,
    required TResult Function(UrlEntity urlEntity) uploadSuccessState,
  }) {
    return uploadInitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uploadInitState,
    TResult? Function()? uploadLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)? uploadErrorState,
    TResult? Function(UrlEntity urlEntity)? uploadSuccessState,
  }) {
    return uploadInitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uploadInitState,
    TResult Function()? uploadLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? uploadErrorState,
    TResult Function(UrlEntity urlEntity)? uploadSuccessState,
    required TResult orElse(),
  }) {
    if (uploadInitState != null) {
      return uploadInitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadInitState value) uploadInitState,
    required TResult Function(UploadLoadingState value) uploadLoadingState,
    required TResult Function(UploadErrorState value) uploadErrorState,
    required TResult Function(UploadSuccessState value) uploadSuccessState,
  }) {
    return uploadInitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadInitState value)? uploadInitState,
    TResult? Function(UploadLoadingState value)? uploadLoadingState,
    TResult? Function(UploadErrorState value)? uploadErrorState,
    TResult? Function(UploadSuccessState value)? uploadSuccessState,
  }) {
    return uploadInitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadInitState value)? uploadInitState,
    TResult Function(UploadLoadingState value)? uploadLoadingState,
    TResult Function(UploadErrorState value)? uploadErrorState,
    TResult Function(UploadSuccessState value)? uploadSuccessState,
    required TResult orElse(),
  }) {
    if (uploadInitState != null) {
      return uploadInitState(this);
    }
    return orElse();
  }
}

abstract class UploadInitState implements UploadState {
  const factory UploadInitState() = _$UploadInitStateImpl;
}

/// @nodoc
abstract class _$$UploadLoadingStateImplCopyWith<$Res> {
  factory _$$UploadLoadingStateImplCopyWith(_$UploadLoadingStateImpl value,
          $Res Function(_$UploadLoadingStateImpl) then) =
      __$$UploadLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadLoadingStateImplCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$UploadLoadingStateImpl>
    implements _$$UploadLoadingStateImplCopyWith<$Res> {
  __$$UploadLoadingStateImplCopyWithImpl(_$UploadLoadingStateImpl _value,
      $Res Function(_$UploadLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UploadLoadingStateImpl implements UploadLoadingState {
  const _$UploadLoadingStateImpl();

  @override
  String toString() {
    return 'UploadState.uploadLoadingState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uploadInitState,
    required TResult Function() uploadLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        uploadErrorState,
    required TResult Function(UrlEntity urlEntity) uploadSuccessState,
  }) {
    return uploadLoadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uploadInitState,
    TResult? Function()? uploadLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)? uploadErrorState,
    TResult? Function(UrlEntity urlEntity)? uploadSuccessState,
  }) {
    return uploadLoadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uploadInitState,
    TResult Function()? uploadLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? uploadErrorState,
    TResult Function(UrlEntity urlEntity)? uploadSuccessState,
    required TResult orElse(),
  }) {
    if (uploadLoadingState != null) {
      return uploadLoadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadInitState value) uploadInitState,
    required TResult Function(UploadLoadingState value) uploadLoadingState,
    required TResult Function(UploadErrorState value) uploadErrorState,
    required TResult Function(UploadSuccessState value) uploadSuccessState,
  }) {
    return uploadLoadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadInitState value)? uploadInitState,
    TResult? Function(UploadLoadingState value)? uploadLoadingState,
    TResult? Function(UploadErrorState value)? uploadErrorState,
    TResult? Function(UploadSuccessState value)? uploadSuccessState,
  }) {
    return uploadLoadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadInitState value)? uploadInitState,
    TResult Function(UploadLoadingState value)? uploadLoadingState,
    TResult Function(UploadErrorState value)? uploadErrorState,
    TResult Function(UploadSuccessState value)? uploadSuccessState,
    required TResult orElse(),
  }) {
    if (uploadLoadingState != null) {
      return uploadLoadingState(this);
    }
    return orElse();
  }
}

abstract class UploadLoadingState implements UploadState {
  const factory UploadLoadingState() = _$UploadLoadingStateImpl;
}

/// @nodoc
abstract class _$$UploadErrorStateImplCopyWith<$Res> {
  factory _$$UploadErrorStateImplCopyWith(_$UploadErrorStateImpl value,
          $Res Function(_$UploadErrorStateImpl) then) =
      __$$UploadErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$UploadErrorStateImplCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$UploadErrorStateImpl>
    implements _$$UploadErrorStateImplCopyWith<$Res> {
  __$$UploadErrorStateImplCopyWithImpl(_$UploadErrorStateImpl _value,
      $Res Function(_$UploadErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? callback = null,
  }) {
    return _then(_$UploadErrorStateImpl(
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

class _$UploadErrorStateImpl implements UploadErrorState {
  const _$UploadErrorStateImpl(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'UploadState.uploadErrorState(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadErrorStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, callback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadErrorStateImplCopyWith<_$UploadErrorStateImpl> get copyWith =>
      __$$UploadErrorStateImplCopyWithImpl<_$UploadErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uploadInitState,
    required TResult Function() uploadLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        uploadErrorState,
    required TResult Function(UrlEntity urlEntity) uploadSuccessState,
  }) {
    return uploadErrorState(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uploadInitState,
    TResult? Function()? uploadLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)? uploadErrorState,
    TResult? Function(UrlEntity urlEntity)? uploadSuccessState,
  }) {
    return uploadErrorState?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uploadInitState,
    TResult Function()? uploadLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? uploadErrorState,
    TResult Function(UrlEntity urlEntity)? uploadSuccessState,
    required TResult orElse(),
  }) {
    if (uploadErrorState != null) {
      return uploadErrorState(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadInitState value) uploadInitState,
    required TResult Function(UploadLoadingState value) uploadLoadingState,
    required TResult Function(UploadErrorState value) uploadErrorState,
    required TResult Function(UploadSuccessState value) uploadSuccessState,
  }) {
    return uploadErrorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadInitState value)? uploadInitState,
    TResult? Function(UploadLoadingState value)? uploadLoadingState,
    TResult? Function(UploadErrorState value)? uploadErrorState,
    TResult? Function(UploadSuccessState value)? uploadSuccessState,
  }) {
    return uploadErrorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadInitState value)? uploadInitState,
    TResult Function(UploadLoadingState value)? uploadLoadingState,
    TResult Function(UploadErrorState value)? uploadErrorState,
    TResult Function(UploadSuccessState value)? uploadSuccessState,
    required TResult orElse(),
  }) {
    if (uploadErrorState != null) {
      return uploadErrorState(this);
    }
    return orElse();
  }
}

abstract class UploadErrorState implements UploadState {
  const factory UploadErrorState(
          final AppErrors error, final VoidCallback callback) =
      _$UploadErrorStateImpl;

  AppErrors get error;
  VoidCallback get callback;
  @JsonKey(ignore: true)
  _$$UploadErrorStateImplCopyWith<_$UploadErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadSuccessStateImplCopyWith<$Res> {
  factory _$$UploadSuccessStateImplCopyWith(_$UploadSuccessStateImpl value,
          $Res Function(_$UploadSuccessStateImpl) then) =
      __$$UploadSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UrlEntity urlEntity});
}

/// @nodoc
class __$$UploadSuccessStateImplCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$UploadSuccessStateImpl>
    implements _$$UploadSuccessStateImplCopyWith<$Res> {
  __$$UploadSuccessStateImplCopyWithImpl(_$UploadSuccessStateImpl _value,
      $Res Function(_$UploadSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urlEntity = null,
  }) {
    return _then(_$UploadSuccessStateImpl(
      null == urlEntity
          ? _value.urlEntity
          : urlEntity // ignore: cast_nullable_to_non_nullable
              as UrlEntity,
    ));
  }
}

/// @nodoc

class _$UploadSuccessStateImpl implements UploadSuccessState {
  const _$UploadSuccessStateImpl(this.urlEntity);

  @override
  final UrlEntity urlEntity;

  @override
  String toString() {
    return 'UploadState.uploadSuccessState(urlEntity: $urlEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadSuccessStateImpl &&
            (identical(other.urlEntity, urlEntity) ||
                other.urlEntity == urlEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, urlEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadSuccessStateImplCopyWith<_$UploadSuccessStateImpl> get copyWith =>
      __$$UploadSuccessStateImplCopyWithImpl<_$UploadSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uploadInitState,
    required TResult Function() uploadLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        uploadErrorState,
    required TResult Function(UrlEntity urlEntity) uploadSuccessState,
  }) {
    return uploadSuccessState(urlEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uploadInitState,
    TResult? Function()? uploadLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)? uploadErrorState,
    TResult? Function(UrlEntity urlEntity)? uploadSuccessState,
  }) {
    return uploadSuccessState?.call(urlEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uploadInitState,
    TResult Function()? uploadLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? uploadErrorState,
    TResult Function(UrlEntity urlEntity)? uploadSuccessState,
    required TResult orElse(),
  }) {
    if (uploadSuccessState != null) {
      return uploadSuccessState(urlEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadInitState value) uploadInitState,
    required TResult Function(UploadLoadingState value) uploadLoadingState,
    required TResult Function(UploadErrorState value) uploadErrorState,
    required TResult Function(UploadSuccessState value) uploadSuccessState,
  }) {
    return uploadSuccessState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadInitState value)? uploadInitState,
    TResult? Function(UploadLoadingState value)? uploadLoadingState,
    TResult? Function(UploadErrorState value)? uploadErrorState,
    TResult? Function(UploadSuccessState value)? uploadSuccessState,
  }) {
    return uploadSuccessState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadInitState value)? uploadInitState,
    TResult Function(UploadLoadingState value)? uploadLoadingState,
    TResult Function(UploadErrorState value)? uploadErrorState,
    TResult Function(UploadSuccessState value)? uploadSuccessState,
    required TResult orElse(),
  }) {
    if (uploadSuccessState != null) {
      return uploadSuccessState(this);
    }
    return orElse();
  }
}

abstract class UploadSuccessState implements UploadState {
  const factory UploadSuccessState(final UrlEntity urlEntity) =
      _$UploadSuccessStateImpl;

  UrlEntity get urlEntity;
  @JsonKey(ignore: true)
  _$$UploadSuccessStateImplCopyWith<_$UploadSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
