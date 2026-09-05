// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer_times_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrayerTimesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerTimesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrayerTimesState()';
}


}

/// @nodoc
class $PrayerTimesStateCopyWith<$Res>  {
$PrayerTimesStateCopyWith(PrayerTimesState _, $Res Function(PrayerTimesState) __);
}


/// Adds pattern-matching-related methods to [PrayerTimesState].
extension PrayerTimesStatePatterns on PrayerTimesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PrayerTimesInitialState value)?  initial,TResult Function( PrayerTimesLoadingState value)?  loading,TResult Function( PrayerTimesLoadedState value)?  loaded,TResult Function( PrayerTimesNoLocationState value)?  noLocation,TResult Function( PrayerTimesErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PrayerTimesInitialState() when initial != null:
return initial(_that);case PrayerTimesLoadingState() when loading != null:
return loading(_that);case PrayerTimesLoadedState() when loaded != null:
return loaded(_that);case PrayerTimesNoLocationState() when noLocation != null:
return noLocation(_that);case PrayerTimesErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PrayerTimesInitialState value)  initial,required TResult Function( PrayerTimesLoadingState value)  loading,required TResult Function( PrayerTimesLoadedState value)  loaded,required TResult Function( PrayerTimesNoLocationState value)  noLocation,required TResult Function( PrayerTimesErrorState value)  error,}){
final _that = this;
switch (_that) {
case PrayerTimesInitialState():
return initial(_that);case PrayerTimesLoadingState():
return loading(_that);case PrayerTimesLoadedState():
return loaded(_that);case PrayerTimesNoLocationState():
return noLocation(_that);case PrayerTimesErrorState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PrayerTimesInitialState value)?  initial,TResult? Function( PrayerTimesLoadingState value)?  loading,TResult? Function( PrayerTimesLoadedState value)?  loaded,TResult? Function( PrayerTimesNoLocationState value)?  noLocation,TResult? Function( PrayerTimesErrorState value)?  error,}){
final _that = this;
switch (_that) {
case PrayerTimesInitialState() when initial != null:
return initial(_that);case PrayerTimesLoadingState() when loading != null:
return loading(_that);case PrayerTimesLoadedState() when loaded != null:
return loaded(_that);case PrayerTimesNoLocationState() when noLocation != null:
return noLocation(_that);case PrayerTimesErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DailyPrayerScheduleEntity schedule,  LocationPreferenceEntity location,  bool isCached)?  loaded,TResult Function()?  noLocation,TResult Function( AppErrors error,  VoidCallback callback)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PrayerTimesInitialState() when initial != null:
return initial();case PrayerTimesLoadingState() when loading != null:
return loading();case PrayerTimesLoadedState() when loaded != null:
return loaded(_that.schedule,_that.location,_that.isCached);case PrayerTimesNoLocationState() when noLocation != null:
return noLocation();case PrayerTimesErrorState() when error != null:
return error(_that.error,_that.callback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DailyPrayerScheduleEntity schedule,  LocationPreferenceEntity location,  bool isCached)  loaded,required TResult Function()  noLocation,required TResult Function( AppErrors error,  VoidCallback callback)  error,}) {final _that = this;
switch (_that) {
case PrayerTimesInitialState():
return initial();case PrayerTimesLoadingState():
return loading();case PrayerTimesLoadedState():
return loaded(_that.schedule,_that.location,_that.isCached);case PrayerTimesNoLocationState():
return noLocation();case PrayerTimesErrorState():
return error(_that.error,_that.callback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DailyPrayerScheduleEntity schedule,  LocationPreferenceEntity location,  bool isCached)?  loaded,TResult? Function()?  noLocation,TResult? Function( AppErrors error,  VoidCallback callback)?  error,}) {final _that = this;
switch (_that) {
case PrayerTimesInitialState() when initial != null:
return initial();case PrayerTimesLoadingState() when loading != null:
return loading();case PrayerTimesLoadedState() when loaded != null:
return loaded(_that.schedule,_that.location,_that.isCached);case PrayerTimesNoLocationState() when noLocation != null:
return noLocation();case PrayerTimesErrorState() when error != null:
return error(_that.error,_that.callback);case _:
  return null;

}
}

}

/// @nodoc


class PrayerTimesInitialState implements PrayerTimesState {
  const PrayerTimesInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerTimesInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrayerTimesState.initial()';
}


}




/// @nodoc


class PrayerTimesLoadingState implements PrayerTimesState {
  const PrayerTimesLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerTimesLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrayerTimesState.loading()';
}


}




/// @nodoc


class PrayerTimesLoadedState implements PrayerTimesState {
  const PrayerTimesLoadedState({required this.schedule, required this.location, required this.isCached});
  

 final  DailyPrayerScheduleEntity schedule;
 final  LocationPreferenceEntity location;
 final  bool isCached;

/// Create a copy of PrayerTimesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrayerTimesLoadedStateCopyWith<PrayerTimesLoadedState> get copyWith => _$PrayerTimesLoadedStateCopyWithImpl<PrayerTimesLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerTimesLoadedState&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.location, location) || other.location == location)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}


@override
int get hashCode => Object.hash(runtimeType,schedule,location,isCached);

@override
String toString() {
  return 'PrayerTimesState.loaded(schedule: $schedule, location: $location, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class $PrayerTimesLoadedStateCopyWith<$Res> implements $PrayerTimesStateCopyWith<$Res> {
  factory $PrayerTimesLoadedStateCopyWith(PrayerTimesLoadedState value, $Res Function(PrayerTimesLoadedState) _then) = _$PrayerTimesLoadedStateCopyWithImpl;
@useResult
$Res call({
 DailyPrayerScheduleEntity schedule, LocationPreferenceEntity location, bool isCached
});




}
/// @nodoc
class _$PrayerTimesLoadedStateCopyWithImpl<$Res>
    implements $PrayerTimesLoadedStateCopyWith<$Res> {
  _$PrayerTimesLoadedStateCopyWithImpl(this._self, this._then);

  final PrayerTimesLoadedState _self;
  final $Res Function(PrayerTimesLoadedState) _then;

/// Create a copy of PrayerTimesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? schedule = null,Object? location = null,Object? isCached = null,}) {
  return _then(PrayerTimesLoadedState(
schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DailyPrayerScheduleEntity,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationPreferenceEntity,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class PrayerTimesNoLocationState implements PrayerTimesState {
  const PrayerTimesNoLocationState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerTimesNoLocationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrayerTimesState.noLocation()';
}


}




/// @nodoc


class PrayerTimesErrorState implements PrayerTimesState {
  const PrayerTimesErrorState({required this.error, required this.callback});
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of PrayerTimesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrayerTimesErrorStateCopyWith<PrayerTimesErrorState> get copyWith => _$PrayerTimesErrorStateCopyWithImpl<PrayerTimesErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerTimesErrorState&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString() {
  return 'PrayerTimesState.error(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $PrayerTimesErrorStateCopyWith<$Res> implements $PrayerTimesStateCopyWith<$Res> {
  factory $PrayerTimesErrorStateCopyWith(PrayerTimesErrorState value, $Res Function(PrayerTimesErrorState) _then) = _$PrayerTimesErrorStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$PrayerTimesErrorStateCopyWithImpl<$Res>
    implements $PrayerTimesErrorStateCopyWith<$Res> {
  _$PrayerTimesErrorStateCopyWithImpl(this._self, this._then);

  final PrayerTimesErrorState _self;
  final $Res Function(PrayerTimesErrorState) _then;

/// Create a copy of PrayerTimesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(PrayerTimesErrorState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,callback: null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of PrayerTimesState
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
