// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadState()';
}


}

/// @nodoc
class $UploadStateCopyWith<$Res>  {
$UploadStateCopyWith(UploadState _, $Res Function(UploadState) __);
}


/// Adds pattern-matching-related methods to [UploadState].
extension UploadStatePatterns on UploadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UploadInitState value)?  uploadInitState,TResult Function( UploadLoadingState value)?  uploadLoadingState,TResult Function( UploadErrorState value)?  uploadErrorState,TResult Function( UploadSuccessState value)?  uploadSuccessState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UploadInitState() when uploadInitState != null:
return uploadInitState(_that);case UploadLoadingState() when uploadLoadingState != null:
return uploadLoadingState(_that);case UploadErrorState() when uploadErrorState != null:
return uploadErrorState(_that);case UploadSuccessState() when uploadSuccessState != null:
return uploadSuccessState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UploadInitState value)  uploadInitState,required TResult Function( UploadLoadingState value)  uploadLoadingState,required TResult Function( UploadErrorState value)  uploadErrorState,required TResult Function( UploadSuccessState value)  uploadSuccessState,}){
final _that = this;
switch (_that) {
case UploadInitState():
return uploadInitState(_that);case UploadLoadingState():
return uploadLoadingState(_that);case UploadErrorState():
return uploadErrorState(_that);case UploadSuccessState():
return uploadSuccessState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UploadInitState value)?  uploadInitState,TResult? Function( UploadLoadingState value)?  uploadLoadingState,TResult? Function( UploadErrorState value)?  uploadErrorState,TResult? Function( UploadSuccessState value)?  uploadSuccessState,}){
final _that = this;
switch (_that) {
case UploadInitState() when uploadInitState != null:
return uploadInitState(_that);case UploadLoadingState() when uploadLoadingState != null:
return uploadLoadingState(_that);case UploadErrorState() when uploadErrorState != null:
return uploadErrorState(_that);case UploadSuccessState() when uploadSuccessState != null:
return uploadSuccessState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  uploadInitState,TResult Function()?  uploadLoadingState,TResult Function( AppErrors error,  VoidCallback callback)?  uploadErrorState,TResult Function( UrlEntity urlEntity)?  uploadSuccessState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UploadInitState() when uploadInitState != null:
return uploadInitState();case UploadLoadingState() when uploadLoadingState != null:
return uploadLoadingState();case UploadErrorState() when uploadErrorState != null:
return uploadErrorState(_that.error,_that.callback);case UploadSuccessState() when uploadSuccessState != null:
return uploadSuccessState(_that.urlEntity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  uploadInitState,required TResult Function()  uploadLoadingState,required TResult Function( AppErrors error,  VoidCallback callback)  uploadErrorState,required TResult Function( UrlEntity urlEntity)  uploadSuccessState,}) {final _that = this;
switch (_that) {
case UploadInitState():
return uploadInitState();case UploadLoadingState():
return uploadLoadingState();case UploadErrorState():
return uploadErrorState(_that.error,_that.callback);case UploadSuccessState():
return uploadSuccessState(_that.urlEntity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  uploadInitState,TResult? Function()?  uploadLoadingState,TResult? Function( AppErrors error,  VoidCallback callback)?  uploadErrorState,TResult? Function( UrlEntity urlEntity)?  uploadSuccessState,}) {final _that = this;
switch (_that) {
case UploadInitState() when uploadInitState != null:
return uploadInitState();case UploadLoadingState() when uploadLoadingState != null:
return uploadLoadingState();case UploadErrorState() when uploadErrorState != null:
return uploadErrorState(_that.error,_that.callback);case UploadSuccessState() when uploadSuccessState != null:
return uploadSuccessState(_that.urlEntity);case _:
  return null;

}
}

}

/// @nodoc


class UploadInitState implements UploadState {
  const UploadInitState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadInitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadState.uploadInitState()';
}


}




/// @nodoc


class UploadLoadingState implements UploadState {
  const UploadLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadState.uploadLoadingState()';
}


}




/// @nodoc


class UploadErrorState implements UploadState {
  const UploadErrorState(this.error, this.callback);
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadErrorStateCopyWith<UploadErrorState> get copyWith => _$UploadErrorStateCopyWithImpl<UploadErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadErrorState&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString() {
  return 'UploadState.uploadErrorState(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $UploadErrorStateCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory $UploadErrorStateCopyWith(UploadErrorState value, $Res Function(UploadErrorState) _then) = _$UploadErrorStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$UploadErrorStateCopyWithImpl<$Res>
    implements $UploadErrorStateCopyWith<$Res> {
  _$UploadErrorStateCopyWithImpl(this._self, this._then);

  final UploadErrorState _self;
  final $Res Function(UploadErrorState) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(UploadErrorState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of UploadState
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


class UploadSuccessState implements UploadState {
  const UploadSuccessState(this.urlEntity);
  

 final  UrlEntity urlEntity;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadSuccessStateCopyWith<UploadSuccessState> get copyWith => _$UploadSuccessStateCopyWithImpl<UploadSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadSuccessState&&(identical(other.urlEntity, urlEntity) || other.urlEntity == urlEntity));
}


@override
int get hashCode => Object.hash(runtimeType,urlEntity);

@override
String toString() {
  return 'UploadState.uploadSuccessState(urlEntity: $urlEntity)';
}


}

/// @nodoc
abstract mixin class $UploadSuccessStateCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory $UploadSuccessStateCopyWith(UploadSuccessState value, $Res Function(UploadSuccessState) _then) = _$UploadSuccessStateCopyWithImpl;
@useResult
$Res call({
 UrlEntity urlEntity
});




}
/// @nodoc
class _$UploadSuccessStateCopyWithImpl<$Res>
    implements $UploadSuccessStateCopyWith<$Res> {
  _$UploadSuccessStateCopyWithImpl(this._self, this._then);

  final UploadSuccessState _self;
  final $Res Function(UploadSuccessState) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? urlEntity = null,}) {
  return _then(UploadSuccessState(
null == urlEntity ? _self.urlEntity : urlEntity // ignore: cast_nullable_to_non_nullable
as UrlEntity,
  ));
}


}

// dart format on
