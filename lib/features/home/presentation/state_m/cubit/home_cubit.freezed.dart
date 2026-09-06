// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeInitialState value)?  initial,TResult Function( HomePrayerTimesLoadingState value)?  prayerTimesLoading,TResult Function( HomePrayerTimesLoadedState value)?  prayerTimesLoaded,TResult Function( HomePrayerTimesErrorState value)?  prayerTimesError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeInitialState() when initial != null:
return initial(_that);case HomePrayerTimesLoadingState() when prayerTimesLoading != null:
return prayerTimesLoading(_that);case HomePrayerTimesLoadedState() when prayerTimesLoaded != null:
return prayerTimesLoaded(_that);case HomePrayerTimesErrorState() when prayerTimesError != null:
return prayerTimesError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeInitialState value)  initial,required TResult Function( HomePrayerTimesLoadingState value)  prayerTimesLoading,required TResult Function( HomePrayerTimesLoadedState value)  prayerTimesLoaded,required TResult Function( HomePrayerTimesErrorState value)  prayerTimesError,}){
final _that = this;
switch (_that) {
case HomeInitialState():
return initial(_that);case HomePrayerTimesLoadingState():
return prayerTimesLoading(_that);case HomePrayerTimesLoadedState():
return prayerTimesLoaded(_that);case HomePrayerTimesErrorState():
return prayerTimesError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeInitialState value)?  initial,TResult? Function( HomePrayerTimesLoadingState value)?  prayerTimesLoading,TResult? Function( HomePrayerTimesLoadedState value)?  prayerTimesLoaded,TResult? Function( HomePrayerTimesErrorState value)?  prayerTimesError,}){
final _that = this;
switch (_that) {
case HomeInitialState() when initial != null:
return initial(_that);case HomePrayerTimesLoadingState() when prayerTimesLoading != null:
return prayerTimesLoading(_that);case HomePrayerTimesLoadedState() when prayerTimesLoaded != null:
return prayerTimesLoaded(_that);case HomePrayerTimesErrorState() when prayerTimesError != null:
return prayerTimesError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  prayerTimesLoading,TResult Function( DailyPrayerScheduleEntity schedule)?  prayerTimesLoaded,TResult Function( AppErrors error,  VoidCallback callback)?  prayerTimesError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeInitialState() when initial != null:
return initial();case HomePrayerTimesLoadingState() when prayerTimesLoading != null:
return prayerTimesLoading();case HomePrayerTimesLoadedState() when prayerTimesLoaded != null:
return prayerTimesLoaded(_that.schedule);case HomePrayerTimesErrorState() when prayerTimesError != null:
return prayerTimesError(_that.error,_that.callback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  prayerTimesLoading,required TResult Function( DailyPrayerScheduleEntity schedule)  prayerTimesLoaded,required TResult Function( AppErrors error,  VoidCallback callback)  prayerTimesError,}) {final _that = this;
switch (_that) {
case HomeInitialState():
return initial();case HomePrayerTimesLoadingState():
return prayerTimesLoading();case HomePrayerTimesLoadedState():
return prayerTimesLoaded(_that.schedule);case HomePrayerTimesErrorState():
return prayerTimesError(_that.error,_that.callback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  prayerTimesLoading,TResult? Function( DailyPrayerScheduleEntity schedule)?  prayerTimesLoaded,TResult? Function( AppErrors error,  VoidCallback callback)?  prayerTimesError,}) {final _that = this;
switch (_that) {
case HomeInitialState() when initial != null:
return initial();case HomePrayerTimesLoadingState() when prayerTimesLoading != null:
return prayerTimesLoading();case HomePrayerTimesLoadedState() when prayerTimesLoaded != null:
return prayerTimesLoaded(_that.schedule);case HomePrayerTimesErrorState() when prayerTimesError != null:
return prayerTimesError(_that.error,_that.callback);case _:
  return null;

}
}

}

/// @nodoc


class HomeInitialState implements HomeState {
  const HomeInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class HomePrayerTimesLoadingState implements HomeState {
  const HomePrayerTimesLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePrayerTimesLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.prayerTimesLoading()';
}


}




/// @nodoc


class HomePrayerTimesLoadedState implements HomeState {
  const HomePrayerTimesLoadedState({required this.schedule});
  

 final  DailyPrayerScheduleEntity schedule;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomePrayerTimesLoadedStateCopyWith<HomePrayerTimesLoadedState> get copyWith => _$HomePrayerTimesLoadedStateCopyWithImpl<HomePrayerTimesLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePrayerTimesLoadedState&&(identical(other.schedule, schedule) || other.schedule == schedule));
}


@override
int get hashCode => Object.hash(runtimeType,schedule);

@override
String toString() {
  return 'HomeState.prayerTimesLoaded(schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $HomePrayerTimesLoadedStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomePrayerTimesLoadedStateCopyWith(HomePrayerTimesLoadedState value, $Res Function(HomePrayerTimesLoadedState) _then) = _$HomePrayerTimesLoadedStateCopyWithImpl;
@useResult
$Res call({
 DailyPrayerScheduleEntity schedule
});




}
/// @nodoc
class _$HomePrayerTimesLoadedStateCopyWithImpl<$Res>
    implements $HomePrayerTimesLoadedStateCopyWith<$Res> {
  _$HomePrayerTimesLoadedStateCopyWithImpl(this._self, this._then);

  final HomePrayerTimesLoadedState _self;
  final $Res Function(HomePrayerTimesLoadedState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? schedule = null,}) {
  return _then(HomePrayerTimesLoadedState(
schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DailyPrayerScheduleEntity,
  ));
}


}

/// @nodoc


class HomePrayerTimesErrorState implements HomeState {
  const HomePrayerTimesErrorState({required this.error, required this.callback});
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomePrayerTimesErrorStateCopyWith<HomePrayerTimesErrorState> get copyWith => _$HomePrayerTimesErrorStateCopyWithImpl<HomePrayerTimesErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePrayerTimesErrorState&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString() {
  return 'HomeState.prayerTimesError(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $HomePrayerTimesErrorStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomePrayerTimesErrorStateCopyWith(HomePrayerTimesErrorState value, $Res Function(HomePrayerTimesErrorState) _then) = _$HomePrayerTimesErrorStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$HomePrayerTimesErrorStateCopyWithImpl<$Res>
    implements $HomePrayerTimesErrorStateCopyWith<$Res> {
  _$HomePrayerTimesErrorStateCopyWithImpl(this._self, this._then);

  final HomePrayerTimesErrorState _self;
  final $Res Function(HomePrayerTimesErrorState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(HomePrayerTimesErrorState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,callback: null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of HomeState
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
