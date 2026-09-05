// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapState()';
}


}

/// @nodoc
class $MapStateCopyWith<$Res>  {
$MapStateCopyWith(MapState _, $Res Function(MapState) __);
}


/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MapInitial value)?  mapInitial,TResult Function( MapLoading value)?  mapLoading,TResult Function( MapDistanceLoaded value)?  mapDistanceLoaded,TResult Function( MapError value)?  mapError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MapInitial() when mapInitial != null:
return mapInitial(_that);case MapLoading() when mapLoading != null:
return mapLoading(_that);case MapDistanceLoaded() when mapDistanceLoaded != null:
return mapDistanceLoaded(_that);case MapError() when mapError != null:
return mapError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MapInitial value)  mapInitial,required TResult Function( MapLoading value)  mapLoading,required TResult Function( MapDistanceLoaded value)  mapDistanceLoaded,required TResult Function( MapError value)  mapError,}){
final _that = this;
switch (_that) {
case MapInitial():
return mapInitial(_that);case MapLoading():
return mapLoading(_that);case MapDistanceLoaded():
return mapDistanceLoaded(_that);case MapError():
return mapError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MapInitial value)?  mapInitial,TResult? Function( MapLoading value)?  mapLoading,TResult? Function( MapDistanceLoaded value)?  mapDistanceLoaded,TResult? Function( MapError value)?  mapError,}){
final _that = this;
switch (_that) {
case MapInitial() when mapInitial != null:
return mapInitial(_that);case MapLoading() when mapLoading != null:
return mapLoading(_that);case MapDistanceLoaded() when mapDistanceLoaded != null:
return mapDistanceLoaded(_that);case MapError() when mapError != null:
return mapError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  mapInitial,TResult Function()?  mapLoading,TResult Function( MapDistanceModel mapDistanceResult)?  mapDistanceLoaded,TResult Function( AppErrors error,  VoidCallback callback)?  mapError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MapInitial() when mapInitial != null:
return mapInitial();case MapLoading() when mapLoading != null:
return mapLoading();case MapDistanceLoaded() when mapDistanceLoaded != null:
return mapDistanceLoaded(_that.mapDistanceResult);case MapError() when mapError != null:
return mapError(_that.error,_that.callback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  mapInitial,required TResult Function()  mapLoading,required TResult Function( MapDistanceModel mapDistanceResult)  mapDistanceLoaded,required TResult Function( AppErrors error,  VoidCallback callback)  mapError,}) {final _that = this;
switch (_that) {
case MapInitial():
return mapInitial();case MapLoading():
return mapLoading();case MapDistanceLoaded():
return mapDistanceLoaded(_that.mapDistanceResult);case MapError():
return mapError(_that.error,_that.callback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  mapInitial,TResult? Function()?  mapLoading,TResult? Function( MapDistanceModel mapDistanceResult)?  mapDistanceLoaded,TResult? Function( AppErrors error,  VoidCallback callback)?  mapError,}) {final _that = this;
switch (_that) {
case MapInitial() when mapInitial != null:
return mapInitial();case MapLoading() when mapLoading != null:
return mapLoading();case MapDistanceLoaded() when mapDistanceLoaded != null:
return mapDistanceLoaded(_that.mapDistanceResult);case MapError() when mapError != null:
return mapError(_that.error,_that.callback);case _:
  return null;

}
}

}

/// @nodoc


class MapInitial implements MapState {
  const MapInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapState.mapInitial()';
}


}




/// @nodoc


class MapLoading implements MapState {
  const MapLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapState.mapLoading()';
}


}




/// @nodoc


class MapDistanceLoaded implements MapState {
  const MapDistanceLoaded({required this.mapDistanceResult});
  

 final  MapDistanceModel mapDistanceResult;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapDistanceLoadedCopyWith<MapDistanceLoaded> get copyWith => _$MapDistanceLoadedCopyWithImpl<MapDistanceLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapDistanceLoaded&&(identical(other.mapDistanceResult, mapDistanceResult) || other.mapDistanceResult == mapDistanceResult));
}


@override
int get hashCode => Object.hash(runtimeType,mapDistanceResult);

@override
String toString() {
  return 'MapState.mapDistanceLoaded(mapDistanceResult: $mapDistanceResult)';
}


}

/// @nodoc
abstract mixin class $MapDistanceLoadedCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $MapDistanceLoadedCopyWith(MapDistanceLoaded value, $Res Function(MapDistanceLoaded) _then) = _$MapDistanceLoadedCopyWithImpl;
@useResult
$Res call({
 MapDistanceModel mapDistanceResult
});




}
/// @nodoc
class _$MapDistanceLoadedCopyWithImpl<$Res>
    implements $MapDistanceLoadedCopyWith<$Res> {
  _$MapDistanceLoadedCopyWithImpl(this._self, this._then);

  final MapDistanceLoaded _self;
  final $Res Function(MapDistanceLoaded) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mapDistanceResult = null,}) {
  return _then(MapDistanceLoaded(
mapDistanceResult: null == mapDistanceResult ? _self.mapDistanceResult : mapDistanceResult // ignore: cast_nullable_to_non_nullable
as MapDistanceModel,
  ));
}


}

/// @nodoc


class MapError implements MapState {
  const MapError({required this.error, required this.callback});
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapErrorCopyWith<MapError> get copyWith => _$MapErrorCopyWithImpl<MapError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapError&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString() {
  return 'MapState.mapError(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $MapErrorCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $MapErrorCopyWith(MapError value, $Res Function(MapError) _then) = _$MapErrorCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$MapErrorCopyWithImpl<$Res>
    implements $MapErrorCopyWith<$Res> {
  _$MapErrorCopyWithImpl(this._self, this._then);

  final MapError _self;
  final $Res Function(MapError) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(MapError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,callback: null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of MapState
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
