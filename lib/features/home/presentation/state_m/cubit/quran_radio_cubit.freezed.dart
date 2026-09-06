// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quran_radio_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuranRadioState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranRadioState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuranRadioState()';
}


}

/// @nodoc
class $QuranRadioStateCopyWith<$Res>  {
$QuranRadioStateCopyWith(QuranRadioState _, $Res Function(QuranRadioState) __);
}


/// Adds pattern-matching-related methods to [QuranRadioState].
extension QuranRadioStatePatterns on QuranRadioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( QuranRadioInitialState value)?  initial,TResult Function( QuranRadioLoadedState value)?  loaded,TResult Function( QuranRadioErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case QuranRadioInitialState() when initial != null:
return initial(_that);case QuranRadioLoadedState() when loaded != null:
return loaded(_that);case QuranRadioErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( QuranRadioInitialState value)  initial,required TResult Function( QuranRadioLoadedState value)  loaded,required TResult Function( QuranRadioErrorState value)  error,}){
final _that = this;
switch (_that) {
case QuranRadioInitialState():
return initial(_that);case QuranRadioLoadedState():
return loaded(_that);case QuranRadioErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( QuranRadioInitialState value)?  initial,TResult? Function( QuranRadioLoadedState value)?  loaded,TResult? Function( QuranRadioErrorState value)?  error,}){
final _that = this;
switch (_that) {
case QuranRadioInitialState() when initial != null:
return initial(_that);case QuranRadioLoadedState() when loaded != null:
return loaded(_that);case QuranRadioErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( RadioPlayerEntity player)?  loaded,TResult Function( AppErrors error,  VoidCallback callback)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case QuranRadioInitialState() when initial != null:
return initial();case QuranRadioLoadedState() when loaded != null:
return loaded(_that.player);case QuranRadioErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( RadioPlayerEntity player)  loaded,required TResult Function( AppErrors error,  VoidCallback callback)  error,}) {final _that = this;
switch (_that) {
case QuranRadioInitialState():
return initial();case QuranRadioLoadedState():
return loaded(_that.player);case QuranRadioErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( RadioPlayerEntity player)?  loaded,TResult? Function( AppErrors error,  VoidCallback callback)?  error,}) {final _that = this;
switch (_that) {
case QuranRadioInitialState() when initial != null:
return initial();case QuranRadioLoadedState() when loaded != null:
return loaded(_that.player);case QuranRadioErrorState() when error != null:
return error(_that.error,_that.callback);case _:
  return null;

}
}

}

/// @nodoc


class QuranRadioInitialState implements QuranRadioState {
  const QuranRadioInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranRadioInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuranRadioState.initial()';
}


}




/// @nodoc


class QuranRadioLoadedState implements QuranRadioState {
  const QuranRadioLoadedState({required this.player});
  

 final  RadioPlayerEntity player;

/// Create a copy of QuranRadioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuranRadioLoadedStateCopyWith<QuranRadioLoadedState> get copyWith => _$QuranRadioLoadedStateCopyWithImpl<QuranRadioLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranRadioLoadedState&&(identical(other.player, player) || other.player == player));
}


@override
int get hashCode => Object.hash(runtimeType,player);

@override
String toString() {
  return 'QuranRadioState.loaded(player: $player)';
}


}

/// @nodoc
abstract mixin class $QuranRadioLoadedStateCopyWith<$Res> implements $QuranRadioStateCopyWith<$Res> {
  factory $QuranRadioLoadedStateCopyWith(QuranRadioLoadedState value, $Res Function(QuranRadioLoadedState) _then) = _$QuranRadioLoadedStateCopyWithImpl;
@useResult
$Res call({
 RadioPlayerEntity player
});




}
/// @nodoc
class _$QuranRadioLoadedStateCopyWithImpl<$Res>
    implements $QuranRadioLoadedStateCopyWith<$Res> {
  _$QuranRadioLoadedStateCopyWithImpl(this._self, this._then);

  final QuranRadioLoadedState _self;
  final $Res Function(QuranRadioLoadedState) _then;

/// Create a copy of QuranRadioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? player = null,}) {
  return _then(QuranRadioLoadedState(
player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as RadioPlayerEntity,
  ));
}


}

/// @nodoc


class QuranRadioErrorState implements QuranRadioState {
  const QuranRadioErrorState({required this.error, required this.callback});
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of QuranRadioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuranRadioErrorStateCopyWith<QuranRadioErrorState> get copyWith => _$QuranRadioErrorStateCopyWithImpl<QuranRadioErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranRadioErrorState&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString() {
  return 'QuranRadioState.error(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $QuranRadioErrorStateCopyWith<$Res> implements $QuranRadioStateCopyWith<$Res> {
  factory $QuranRadioErrorStateCopyWith(QuranRadioErrorState value, $Res Function(QuranRadioErrorState) _then) = _$QuranRadioErrorStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$QuranRadioErrorStateCopyWithImpl<$Res>
    implements $QuranRadioErrorStateCopyWith<$Res> {
  _$QuranRadioErrorStateCopyWithImpl(this._self, this._then);

  final QuranRadioErrorState _self;
  final $Res Function(QuranRadioErrorState) _then;

/// Create a copy of QuranRadioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(QuranRadioErrorState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,callback: null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of QuranRadioState
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
