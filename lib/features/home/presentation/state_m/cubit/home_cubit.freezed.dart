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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeInitState value)?  homeInitState,TResult Function( HomeLoadingState value)?  homeLoadingState,TResult Function( HomeLoadedState value)?  homeLoadedState,TResult Function( HomeErrorInitState value)?  homeErrorState,TResult Function( PrayerTimesLoadedState value)?  prayerTimesLoadedState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeInitState() when homeInitState != null:
return homeInitState(_that);case HomeLoadingState() when homeLoadingState != null:
return homeLoadingState(_that);case HomeLoadedState() when homeLoadedState != null:
return homeLoadedState(_that);case HomeErrorInitState() when homeErrorState != null:
return homeErrorState(_that);case PrayerTimesLoadedState() when prayerTimesLoadedState != null:
return prayerTimesLoadedState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeInitState value)  homeInitState,required TResult Function( HomeLoadingState value)  homeLoadingState,required TResult Function( HomeLoadedState value)  homeLoadedState,required TResult Function( HomeErrorInitState value)  homeErrorState,required TResult Function( PrayerTimesLoadedState value)  prayerTimesLoadedState,}){
final _that = this;
switch (_that) {
case HomeInitState():
return homeInitState(_that);case HomeLoadingState():
return homeLoadingState(_that);case HomeLoadedState():
return homeLoadedState(_that);case HomeErrorInitState():
return homeErrorState(_that);case PrayerTimesLoadedState():
return prayerTimesLoadedState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeInitState value)?  homeInitState,TResult? Function( HomeLoadingState value)?  homeLoadingState,TResult? Function( HomeLoadedState value)?  homeLoadedState,TResult? Function( HomeErrorInitState value)?  homeErrorState,TResult? Function( PrayerTimesLoadedState value)?  prayerTimesLoadedState,}){
final _that = this;
switch (_that) {
case HomeInitState() when homeInitState != null:
return homeInitState(_that);case HomeLoadingState() when homeLoadingState != null:
return homeLoadingState(_that);case HomeLoadedState() when homeLoadedState != null:
return homeLoadedState(_that);case HomeErrorInitState() when homeErrorState != null:
return homeErrorState(_that);case PrayerTimesLoadedState() when prayerTimesLoadedState != null:
return prayerTimesLoadedState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  homeInitState,TResult Function()?  homeLoadingState,TResult Function( EmptyResponse emptyResponse)?  homeLoadedState,TResult Function( AppErrors error,  VoidCallback callback)?  homeErrorState,TResult Function( DailyPrayerScheduleEntity schedule)?  prayerTimesLoadedState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeInitState() when homeInitState != null:
return homeInitState();case HomeLoadingState() when homeLoadingState != null:
return homeLoadingState();case HomeLoadedState() when homeLoadedState != null:
return homeLoadedState(_that.emptyResponse);case HomeErrorInitState() when homeErrorState != null:
return homeErrorState(_that.error,_that.callback);case PrayerTimesLoadedState() when prayerTimesLoadedState != null:
return prayerTimesLoadedState(_that.schedule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  homeInitState,required TResult Function()  homeLoadingState,required TResult Function( EmptyResponse emptyResponse)  homeLoadedState,required TResult Function( AppErrors error,  VoidCallback callback)  homeErrorState,required TResult Function( DailyPrayerScheduleEntity schedule)  prayerTimesLoadedState,}) {final _that = this;
switch (_that) {
case HomeInitState():
return homeInitState();case HomeLoadingState():
return homeLoadingState();case HomeLoadedState():
return homeLoadedState(_that.emptyResponse);case HomeErrorInitState():
return homeErrorState(_that.error,_that.callback);case PrayerTimesLoadedState():
return prayerTimesLoadedState(_that.schedule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  homeInitState,TResult? Function()?  homeLoadingState,TResult? Function( EmptyResponse emptyResponse)?  homeLoadedState,TResult? Function( AppErrors error,  VoidCallback callback)?  homeErrorState,TResult? Function( DailyPrayerScheduleEntity schedule)?  prayerTimesLoadedState,}) {final _that = this;
switch (_that) {
case HomeInitState() when homeInitState != null:
return homeInitState();case HomeLoadingState() when homeLoadingState != null:
return homeLoadingState();case HomeLoadedState() when homeLoadedState != null:
return homeLoadedState(_that.emptyResponse);case HomeErrorInitState() when homeErrorState != null:
return homeErrorState(_that.error,_that.callback);case PrayerTimesLoadedState() when prayerTimesLoadedState != null:
return prayerTimesLoadedState(_that.schedule);case _:
  return null;

}
}

}

/// @nodoc


class HomeInitState implements HomeState {
  const HomeInitState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeInitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.homeInitState()';
}


}




/// @nodoc


class HomeLoadingState implements HomeState {
  const HomeLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.homeLoadingState()';
}


}




/// @nodoc


class HomeLoadedState implements HomeState {
  const HomeLoadedState(this.emptyResponse);
  

 final  EmptyResponse emptyResponse;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeLoadedStateCopyWith<HomeLoadedState> get copyWith => _$HomeLoadedStateCopyWithImpl<HomeLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeLoadedState&&(identical(other.emptyResponse, emptyResponse) || other.emptyResponse == emptyResponse));
}


@override
int get hashCode => Object.hash(runtimeType,emptyResponse);

@override
String toString() {
  return 'HomeState.homeLoadedState(emptyResponse: $emptyResponse)';
}


}

/// @nodoc
abstract mixin class $HomeLoadedStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeLoadedStateCopyWith(HomeLoadedState value, $Res Function(HomeLoadedState) _then) = _$HomeLoadedStateCopyWithImpl;
@useResult
$Res call({
 EmptyResponse emptyResponse
});




}
/// @nodoc
class _$HomeLoadedStateCopyWithImpl<$Res>
    implements $HomeLoadedStateCopyWith<$Res> {
  _$HomeLoadedStateCopyWithImpl(this._self, this._then);

  final HomeLoadedState _self;
  final $Res Function(HomeLoadedState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? emptyResponse = null,}) {
  return _then(HomeLoadedState(
null == emptyResponse ? _self.emptyResponse : emptyResponse // ignore: cast_nullable_to_non_nullable
as EmptyResponse,
  ));
}


}

/// @nodoc


class HomeErrorInitState implements HomeState {
  const HomeErrorInitState(this.error, this.callback);
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeErrorInitStateCopyWith<HomeErrorInitState> get copyWith => _$HomeErrorInitStateCopyWithImpl<HomeErrorInitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeErrorInitState&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString() {
  return 'HomeState.homeErrorState(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $HomeErrorInitStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeErrorInitStateCopyWith(HomeErrorInitState value, $Res Function(HomeErrorInitState) _then) = _$HomeErrorInitStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$HomeErrorInitStateCopyWithImpl<$Res>
    implements $HomeErrorInitStateCopyWith<$Res> {
  _$HomeErrorInitStateCopyWithImpl(this._self, this._then);

  final HomeErrorInitState _self;
  final $Res Function(HomeErrorInitState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(HomeErrorInitState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
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

/// @nodoc


class PrayerTimesLoadedState implements HomeState {
  const PrayerTimesLoadedState(this.schedule);
  

 final  DailyPrayerScheduleEntity schedule;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrayerTimesLoadedStateCopyWith<PrayerTimesLoadedState> get copyWith => _$PrayerTimesLoadedStateCopyWithImpl<PrayerTimesLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerTimesLoadedState&&(identical(other.schedule, schedule) || other.schedule == schedule));
}


@override
int get hashCode => Object.hash(runtimeType,schedule);

@override
String toString() {
  return 'HomeState.prayerTimesLoadedState(schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $PrayerTimesLoadedStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $PrayerTimesLoadedStateCopyWith(PrayerTimesLoadedState value, $Res Function(PrayerTimesLoadedState) _then) = _$PrayerTimesLoadedStateCopyWithImpl;
@useResult
$Res call({
 DailyPrayerScheduleEntity schedule
});




}
/// @nodoc
class _$PrayerTimesLoadedStateCopyWithImpl<$Res>
    implements $PrayerTimesLoadedStateCopyWith<$Res> {
  _$PrayerTimesLoadedStateCopyWithImpl(this._self, this._then);

  final PrayerTimesLoadedState _self;
  final $Res Function(PrayerTimesLoadedState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? schedule = null,}) {
  return _then(PrayerTimesLoadedState(
null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DailyPrayerScheduleEntity,
  ));
}


}

// dart format on
