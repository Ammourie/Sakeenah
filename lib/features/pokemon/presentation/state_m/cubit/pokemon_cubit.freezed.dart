// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PokemonState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PokemonState()';
}


}

/// @nodoc
class $PokemonStateCopyWith<$Res>  {
$PokemonStateCopyWith(PokemonState _, $Res Function(PokemonState) __);
}


/// Adds pattern-matching-related methods to [PokemonState].
extension PokemonStatePatterns on PokemonState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PokemonInitState value)?  pokemonInitState,TResult Function( PokemonLoadingState value)?  pokemonLoadingState,TResult Function( PokemonErrorState value)?  pokemonErrorState,TResult Function( GetPokemonsLoadedState value)?  getPokemonsLoadedState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PokemonInitState() when pokemonInitState != null:
return pokemonInitState(_that);case PokemonLoadingState() when pokemonLoadingState != null:
return pokemonLoadingState(_that);case PokemonErrorState() when pokemonErrorState != null:
return pokemonErrorState(_that);case GetPokemonsLoadedState() when getPokemonsLoadedState != null:
return getPokemonsLoadedState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PokemonInitState value)  pokemonInitState,required TResult Function( PokemonLoadingState value)  pokemonLoadingState,required TResult Function( PokemonErrorState value)  pokemonErrorState,required TResult Function( GetPokemonsLoadedState value)  getPokemonsLoadedState,}){
final _that = this;
switch (_that) {
case PokemonInitState():
return pokemonInitState(_that);case PokemonLoadingState():
return pokemonLoadingState(_that);case PokemonErrorState():
return pokemonErrorState(_that);case GetPokemonsLoadedState():
return getPokemonsLoadedState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PokemonInitState value)?  pokemonInitState,TResult? Function( PokemonLoadingState value)?  pokemonLoadingState,TResult? Function( PokemonErrorState value)?  pokemonErrorState,TResult? Function( GetPokemonsLoadedState value)?  getPokemonsLoadedState,}){
final _that = this;
switch (_that) {
case PokemonInitState() when pokemonInitState != null:
return pokemonInitState(_that);case PokemonLoadingState() when pokemonLoadingState != null:
return pokemonLoadingState(_that);case PokemonErrorState() when pokemonErrorState != null:
return pokemonErrorState(_that);case GetPokemonsLoadedState() when getPokemonsLoadedState != null:
return getPokemonsLoadedState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pokemonInitState,TResult Function()?  pokemonLoadingState,TResult Function( AppErrors error,  VoidCallback callback)?  pokemonErrorState,TResult Function( PokemonListEntity pokemonListEntity)?  getPokemonsLoadedState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PokemonInitState() when pokemonInitState != null:
return pokemonInitState();case PokemonLoadingState() when pokemonLoadingState != null:
return pokemonLoadingState();case PokemonErrorState() when pokemonErrorState != null:
return pokemonErrorState(_that.error,_that.callback);case GetPokemonsLoadedState() when getPokemonsLoadedState != null:
return getPokemonsLoadedState(_that.pokemonListEntity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pokemonInitState,required TResult Function()  pokemonLoadingState,required TResult Function( AppErrors error,  VoidCallback callback)  pokemonErrorState,required TResult Function( PokemonListEntity pokemonListEntity)  getPokemonsLoadedState,}) {final _that = this;
switch (_that) {
case PokemonInitState():
return pokemonInitState();case PokemonLoadingState():
return pokemonLoadingState();case PokemonErrorState():
return pokemonErrorState(_that.error,_that.callback);case GetPokemonsLoadedState():
return getPokemonsLoadedState(_that.pokemonListEntity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pokemonInitState,TResult? Function()?  pokemonLoadingState,TResult? Function( AppErrors error,  VoidCallback callback)?  pokemonErrorState,TResult? Function( PokemonListEntity pokemonListEntity)?  getPokemonsLoadedState,}) {final _that = this;
switch (_that) {
case PokemonInitState() when pokemonInitState != null:
return pokemonInitState();case PokemonLoadingState() when pokemonLoadingState != null:
return pokemonLoadingState();case PokemonErrorState() when pokemonErrorState != null:
return pokemonErrorState(_that.error,_that.callback);case GetPokemonsLoadedState() when getPokemonsLoadedState != null:
return getPokemonsLoadedState(_that.pokemonListEntity);case _:
  return null;

}
}

}

/// @nodoc


class PokemonInitState implements PokemonState {
  const PokemonInitState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonInitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PokemonState.pokemonInitState()';
}


}




/// @nodoc


class PokemonLoadingState implements PokemonState {
  const PokemonLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PokemonState.pokemonLoadingState()';
}


}




/// @nodoc


class PokemonErrorState implements PokemonState {
  const PokemonErrorState(this.error, this.callback);
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of PokemonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonErrorStateCopyWith<PokemonErrorState> get copyWith => _$PokemonErrorStateCopyWithImpl<PokemonErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonErrorState&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString() {
  return 'PokemonState.pokemonErrorState(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $PokemonErrorStateCopyWith<$Res> implements $PokemonStateCopyWith<$Res> {
  factory $PokemonErrorStateCopyWith(PokemonErrorState value, $Res Function(PokemonErrorState) _then) = _$PokemonErrorStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$PokemonErrorStateCopyWithImpl<$Res>
    implements $PokemonErrorStateCopyWith<$Res> {
  _$PokemonErrorStateCopyWithImpl(this._self, this._then);

  final PokemonErrorState _self;
  final $Res Function(PokemonErrorState) _then;

/// Create a copy of PokemonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(PokemonErrorState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of PokemonState
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


class GetPokemonsLoadedState implements PokemonState {
  const GetPokemonsLoadedState(this.pokemonListEntity);
  

 final  PokemonListEntity pokemonListEntity;

/// Create a copy of PokemonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPokemonsLoadedStateCopyWith<GetPokemonsLoadedState> get copyWith => _$GetPokemonsLoadedStateCopyWithImpl<GetPokemonsLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPokemonsLoadedState&&(identical(other.pokemonListEntity, pokemonListEntity) || other.pokemonListEntity == pokemonListEntity));
}


@override
int get hashCode => Object.hash(runtimeType,pokemonListEntity);

@override
String toString() {
  return 'PokemonState.getPokemonsLoadedState(pokemonListEntity: $pokemonListEntity)';
}


}

/// @nodoc
abstract mixin class $GetPokemonsLoadedStateCopyWith<$Res> implements $PokemonStateCopyWith<$Res> {
  factory $GetPokemonsLoadedStateCopyWith(GetPokemonsLoadedState value, $Res Function(GetPokemonsLoadedState) _then) = _$GetPokemonsLoadedStateCopyWithImpl;
@useResult
$Res call({
 PokemonListEntity pokemonListEntity
});




}
/// @nodoc
class _$GetPokemonsLoadedStateCopyWithImpl<$Res>
    implements $GetPokemonsLoadedStateCopyWith<$Res> {
  _$GetPokemonsLoadedStateCopyWithImpl(this._self, this._then);

  final GetPokemonsLoadedState _self;
  final $Res Function(GetPokemonsLoadedState) _then;

/// Create a copy of PokemonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pokemonListEntity = null,}) {
  return _then(GetPokemonsLoadedState(
null == pokemonListEntity ? _self.pokemonListEntity : pokemonListEntity // ignore: cast_nullable_to_non_nullable
as PokemonListEntity,
  ));
}


}

// dart format on
