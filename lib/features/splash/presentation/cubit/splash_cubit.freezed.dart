// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitialState value)?  initial,TResult Function( LoadingState value)?  loading,TResult Function( ErrorState value)?  error,TResult Function( LoadedState value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial(_that);case LoadingState() when loading != null:
return loading(_that);case ErrorState() when error != null:
return error(_that);case LoadedState() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitialState value)  initial,required TResult Function( LoadingState value)  loading,required TResult Function( ErrorState value)  error,required TResult Function( LoadedState value)  loaded,}){
final _that = this;
switch (_that) {
case InitialState():
return initial(_that);case LoadingState():
return loading(_that);case ErrorState():
return error(_that);case LoadedState():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitialState value)?  initial,TResult? Function( LoadingState value)?  loading,TResult? Function( ErrorState value)?  error,TResult? Function( LoadedState value)?  loaded,}){
final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial(_that);case LoadingState() when loading != null:
return loading(_that);case ErrorState() when error != null:
return error(_that);case LoadedState() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AppErrors error,  VoidCallback callback)?  error,TResult Function( SplashEntity splashEntity)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial();case LoadingState() when loading != null:
return loading();case ErrorState() when error != null:
return error(_that.error,_that.callback);case LoadedState() when loaded != null:
return loaded(_that.splashEntity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AppErrors error,  VoidCallback callback)  error,required TResult Function( SplashEntity splashEntity)  loaded,}) {final _that = this;
switch (_that) {
case InitialState():
return initial();case LoadingState():
return loading();case ErrorState():
return error(_that.error,_that.callback);case LoadedState():
return loaded(_that.splashEntity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AppErrors error,  VoidCallback callback)?  error,TResult? Function( SplashEntity splashEntity)?  loaded,}) {final _that = this;
switch (_that) {
case InitialState() when initial != null:
return initial();case LoadingState() when loading != null:
return loading();case ErrorState() when error != null:
return error(_that.error,_that.callback);case LoadedState() when loaded != null:
return loaded(_that.splashEntity);case _:
  return null;

}
}

}

/// @nodoc


class InitialState implements SplashState {
  const InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.initial()';
}


}




/// @nodoc


class LoadingState implements SplashState {
  const LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.loading()';
}


}




/// @nodoc


class ErrorState implements SplashState {
  const ErrorState({required this.error, required this.callback});
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<ErrorState> get copyWith => _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString() {
  return 'SplashState.error(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(ErrorState value, $Res Function(ErrorState) _then) = _$ErrorStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$ErrorStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(ErrorState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,callback: null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of SplashState
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


class LoadedState implements SplashState {
  const LoadedState(this.splashEntity);
  

 final  SplashEntity splashEntity;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedStateCopyWith<LoadedState> get copyWith => _$LoadedStateCopyWithImpl<LoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedState&&(identical(other.splashEntity, splashEntity) || other.splashEntity == splashEntity));
}


@override
int get hashCode => Object.hash(runtimeType,splashEntity);

@override
String toString() {
  return 'SplashState.loaded(splashEntity: $splashEntity)';
}


}

/// @nodoc
abstract mixin class $LoadedStateCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory $LoadedStateCopyWith(LoadedState value, $Res Function(LoadedState) _then) = _$LoadedStateCopyWithImpl;
@useResult
$Res call({
 SplashEntity splashEntity
});




}
/// @nodoc
class _$LoadedStateCopyWithImpl<$Res>
    implements $LoadedStateCopyWith<$Res> {
  _$LoadedStateCopyWithImpl(this._self, this._then);

  final LoadedState _self;
  final $Res Function(LoadedState) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? splashEntity = null,}) {
  return _then(LoadedState(
null == splashEntity ? _self.splashEntity : splashEntity // ignore: cast_nullable_to_non_nullable
as SplashEntity,
  ));
}


}

// dart format on
