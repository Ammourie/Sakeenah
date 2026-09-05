// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pokemonInitState,
    required TResult Function() pokemonLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        pokemonErrorState,
    required TResult Function(PokemonListEntity pokemonListEntity)
        getPokemonsLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pokemonInitState,
    TResult? Function()? pokemonLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)?
        pokemonErrorState,
    TResult? Function(PokemonListEntity pokemonListEntity)?
        getPokemonsLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pokemonInitState,
    TResult Function()? pokemonLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? pokemonErrorState,
    TResult Function(PokemonListEntity pokemonListEntity)?
        getPokemonsLoadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonInitState value) pokemonInitState,
    required TResult Function(PokemonLoadingState value) pokemonLoadingState,
    required TResult Function(PokemonErrorState value) pokemonErrorState,
    required TResult Function(GetPokemonsLoadedState value)
        getPokemonsLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonInitState value)? pokemonInitState,
    TResult? Function(PokemonLoadingState value)? pokemonLoadingState,
    TResult? Function(PokemonErrorState value)? pokemonErrorState,
    TResult? Function(GetPokemonsLoadedState value)? getPokemonsLoadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonInitState value)? pokemonInitState,
    TResult Function(PokemonLoadingState value)? pokemonLoadingState,
    TResult Function(PokemonErrorState value)? pokemonErrorState,
    TResult Function(GetPokemonsLoadedState value)? getPokemonsLoadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStateCopyWith<$Res> {
  factory $PokemonStateCopyWith(
          PokemonState value, $Res Function(PokemonState) then) =
      _$PokemonStateCopyWithImpl<$Res, PokemonState>;
}

/// @nodoc
class _$PokemonStateCopyWithImpl<$Res, $Val extends PokemonState>
    implements $PokemonStateCopyWith<$Res> {
  _$PokemonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PokemonInitStateImplCopyWith<$Res> {
  factory _$$PokemonInitStateImplCopyWith(_$PokemonInitStateImpl value,
          $Res Function(_$PokemonInitStateImpl) then) =
      __$$PokemonInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PokemonInitStateImplCopyWithImpl<$Res>
    extends _$PokemonStateCopyWithImpl<$Res, _$PokemonInitStateImpl>
    implements _$$PokemonInitStateImplCopyWith<$Res> {
  __$$PokemonInitStateImplCopyWithImpl(_$PokemonInitStateImpl _value,
      $Res Function(_$PokemonInitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PokemonInitStateImpl implements PokemonInitState {
  const _$PokemonInitStateImpl();

  @override
  String toString() {
    return 'PokemonState.pokemonInitState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PokemonInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pokemonInitState,
    required TResult Function() pokemonLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        pokemonErrorState,
    required TResult Function(PokemonListEntity pokemonListEntity)
        getPokemonsLoadedState,
  }) {
    return pokemonInitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pokemonInitState,
    TResult? Function()? pokemonLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)?
        pokemonErrorState,
    TResult? Function(PokemonListEntity pokemonListEntity)?
        getPokemonsLoadedState,
  }) {
    return pokemonInitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pokemonInitState,
    TResult Function()? pokemonLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? pokemonErrorState,
    TResult Function(PokemonListEntity pokemonListEntity)?
        getPokemonsLoadedState,
    required TResult orElse(),
  }) {
    if (pokemonInitState != null) {
      return pokemonInitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonInitState value) pokemonInitState,
    required TResult Function(PokemonLoadingState value) pokemonLoadingState,
    required TResult Function(PokemonErrorState value) pokemonErrorState,
    required TResult Function(GetPokemonsLoadedState value)
        getPokemonsLoadedState,
  }) {
    return pokemonInitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonInitState value)? pokemonInitState,
    TResult? Function(PokemonLoadingState value)? pokemonLoadingState,
    TResult? Function(PokemonErrorState value)? pokemonErrorState,
    TResult? Function(GetPokemonsLoadedState value)? getPokemonsLoadedState,
  }) {
    return pokemonInitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonInitState value)? pokemonInitState,
    TResult Function(PokemonLoadingState value)? pokemonLoadingState,
    TResult Function(PokemonErrorState value)? pokemonErrorState,
    TResult Function(GetPokemonsLoadedState value)? getPokemonsLoadedState,
    required TResult orElse(),
  }) {
    if (pokemonInitState != null) {
      return pokemonInitState(this);
    }
    return orElse();
  }
}

abstract class PokemonInitState implements PokemonState {
  const factory PokemonInitState() = _$PokemonInitStateImpl;
}

/// @nodoc
abstract class _$$PokemonLoadingStateImplCopyWith<$Res> {
  factory _$$PokemonLoadingStateImplCopyWith(_$PokemonLoadingStateImpl value,
          $Res Function(_$PokemonLoadingStateImpl) then) =
      __$$PokemonLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PokemonLoadingStateImplCopyWithImpl<$Res>
    extends _$PokemonStateCopyWithImpl<$Res, _$PokemonLoadingStateImpl>
    implements _$$PokemonLoadingStateImplCopyWith<$Res> {
  __$$PokemonLoadingStateImplCopyWithImpl(_$PokemonLoadingStateImpl _value,
      $Res Function(_$PokemonLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PokemonLoadingStateImpl implements PokemonLoadingState {
  const _$PokemonLoadingStateImpl();

  @override
  String toString() {
    return 'PokemonState.pokemonLoadingState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pokemonInitState,
    required TResult Function() pokemonLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        pokemonErrorState,
    required TResult Function(PokemonListEntity pokemonListEntity)
        getPokemonsLoadedState,
  }) {
    return pokemonLoadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pokemonInitState,
    TResult? Function()? pokemonLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)?
        pokemonErrorState,
    TResult? Function(PokemonListEntity pokemonListEntity)?
        getPokemonsLoadedState,
  }) {
    return pokemonLoadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pokemonInitState,
    TResult Function()? pokemonLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? pokemonErrorState,
    TResult Function(PokemonListEntity pokemonListEntity)?
        getPokemonsLoadedState,
    required TResult orElse(),
  }) {
    if (pokemonLoadingState != null) {
      return pokemonLoadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonInitState value) pokemonInitState,
    required TResult Function(PokemonLoadingState value) pokemonLoadingState,
    required TResult Function(PokemonErrorState value) pokemonErrorState,
    required TResult Function(GetPokemonsLoadedState value)
        getPokemonsLoadedState,
  }) {
    return pokemonLoadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonInitState value)? pokemonInitState,
    TResult? Function(PokemonLoadingState value)? pokemonLoadingState,
    TResult? Function(PokemonErrorState value)? pokemonErrorState,
    TResult? Function(GetPokemonsLoadedState value)? getPokemonsLoadedState,
  }) {
    return pokemonLoadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonInitState value)? pokemonInitState,
    TResult Function(PokemonLoadingState value)? pokemonLoadingState,
    TResult Function(PokemonErrorState value)? pokemonErrorState,
    TResult Function(GetPokemonsLoadedState value)? getPokemonsLoadedState,
    required TResult orElse(),
  }) {
    if (pokemonLoadingState != null) {
      return pokemonLoadingState(this);
    }
    return orElse();
  }
}

abstract class PokemonLoadingState implements PokemonState {
  const factory PokemonLoadingState() = _$PokemonLoadingStateImpl;
}

/// @nodoc
abstract class _$$PokemonErrorStateImplCopyWith<$Res> {
  factory _$$PokemonErrorStateImplCopyWith(_$PokemonErrorStateImpl value,
          $Res Function(_$PokemonErrorStateImpl) then) =
      __$$PokemonErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$PokemonErrorStateImplCopyWithImpl<$Res>
    extends _$PokemonStateCopyWithImpl<$Res, _$PokemonErrorStateImpl>
    implements _$$PokemonErrorStateImplCopyWith<$Res> {
  __$$PokemonErrorStateImplCopyWithImpl(_$PokemonErrorStateImpl _value,
      $Res Function(_$PokemonErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? callback = null,
  }) {
    return _then(_$PokemonErrorStateImpl(
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

class _$PokemonErrorStateImpl implements PokemonErrorState {
  const _$PokemonErrorStateImpl(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'PokemonState.pokemonErrorState(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonErrorStateImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, callback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonErrorStateImplCopyWith<_$PokemonErrorStateImpl> get copyWith =>
      __$$PokemonErrorStateImplCopyWithImpl<_$PokemonErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pokemonInitState,
    required TResult Function() pokemonLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        pokemonErrorState,
    required TResult Function(PokemonListEntity pokemonListEntity)
        getPokemonsLoadedState,
  }) {
    return pokemonErrorState(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pokemonInitState,
    TResult? Function()? pokemonLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)?
        pokemonErrorState,
    TResult? Function(PokemonListEntity pokemonListEntity)?
        getPokemonsLoadedState,
  }) {
    return pokemonErrorState?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pokemonInitState,
    TResult Function()? pokemonLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? pokemonErrorState,
    TResult Function(PokemonListEntity pokemonListEntity)?
        getPokemonsLoadedState,
    required TResult orElse(),
  }) {
    if (pokemonErrorState != null) {
      return pokemonErrorState(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonInitState value) pokemonInitState,
    required TResult Function(PokemonLoadingState value) pokemonLoadingState,
    required TResult Function(PokemonErrorState value) pokemonErrorState,
    required TResult Function(GetPokemonsLoadedState value)
        getPokemonsLoadedState,
  }) {
    return pokemonErrorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonInitState value)? pokemonInitState,
    TResult? Function(PokemonLoadingState value)? pokemonLoadingState,
    TResult? Function(PokemonErrorState value)? pokemonErrorState,
    TResult? Function(GetPokemonsLoadedState value)? getPokemonsLoadedState,
  }) {
    return pokemonErrorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonInitState value)? pokemonInitState,
    TResult Function(PokemonLoadingState value)? pokemonLoadingState,
    TResult Function(PokemonErrorState value)? pokemonErrorState,
    TResult Function(GetPokemonsLoadedState value)? getPokemonsLoadedState,
    required TResult orElse(),
  }) {
    if (pokemonErrorState != null) {
      return pokemonErrorState(this);
    }
    return orElse();
  }
}

abstract class PokemonErrorState implements PokemonState {
  const factory PokemonErrorState(
          final AppErrors error, final VoidCallback callback) =
      _$PokemonErrorStateImpl;

  AppErrors get error;
  VoidCallback get callback;
  @JsonKey(ignore: true)
  _$$PokemonErrorStateImplCopyWith<_$PokemonErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPokemonsLoadedStateImplCopyWith<$Res> {
  factory _$$GetPokemonsLoadedStateImplCopyWith(
          _$GetPokemonsLoadedStateImpl value,
          $Res Function(_$GetPokemonsLoadedStateImpl) then) =
      __$$GetPokemonsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PokemonListEntity pokemonListEntity});
}

/// @nodoc
class __$$GetPokemonsLoadedStateImplCopyWithImpl<$Res>
    extends _$PokemonStateCopyWithImpl<$Res, _$GetPokemonsLoadedStateImpl>
    implements _$$GetPokemonsLoadedStateImplCopyWith<$Res> {
  __$$GetPokemonsLoadedStateImplCopyWithImpl(
      _$GetPokemonsLoadedStateImpl _value,
      $Res Function(_$GetPokemonsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonListEntity = null,
  }) {
    return _then(_$GetPokemonsLoadedStateImpl(
      null == pokemonListEntity
          ? _value.pokemonListEntity
          : pokemonListEntity // ignore: cast_nullable_to_non_nullable
              as PokemonListEntity,
    ));
  }
}

/// @nodoc

class _$GetPokemonsLoadedStateImpl implements GetPokemonsLoadedState {
  const _$GetPokemonsLoadedStateImpl(this.pokemonListEntity);

  @override
  final PokemonListEntity pokemonListEntity;

  @override
  String toString() {
    return 'PokemonState.getPokemonsLoadedState(pokemonListEntity: $pokemonListEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPokemonsLoadedStateImpl &&
            (identical(other.pokemonListEntity, pokemonListEntity) ||
                other.pokemonListEntity == pokemonListEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pokemonListEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPokemonsLoadedStateImplCopyWith<_$GetPokemonsLoadedStateImpl>
      get copyWith => __$$GetPokemonsLoadedStateImplCopyWithImpl<
          _$GetPokemonsLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pokemonInitState,
    required TResult Function() pokemonLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        pokemonErrorState,
    required TResult Function(PokemonListEntity pokemonListEntity)
        getPokemonsLoadedState,
  }) {
    return getPokemonsLoadedState(pokemonListEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pokemonInitState,
    TResult? Function()? pokemonLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)?
        pokemonErrorState,
    TResult? Function(PokemonListEntity pokemonListEntity)?
        getPokemonsLoadedState,
  }) {
    return getPokemonsLoadedState?.call(pokemonListEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pokemonInitState,
    TResult Function()? pokemonLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? pokemonErrorState,
    TResult Function(PokemonListEntity pokemonListEntity)?
        getPokemonsLoadedState,
    required TResult orElse(),
  }) {
    if (getPokemonsLoadedState != null) {
      return getPokemonsLoadedState(pokemonListEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonInitState value) pokemonInitState,
    required TResult Function(PokemonLoadingState value) pokemonLoadingState,
    required TResult Function(PokemonErrorState value) pokemonErrorState,
    required TResult Function(GetPokemonsLoadedState value)
        getPokemonsLoadedState,
  }) {
    return getPokemonsLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonInitState value)? pokemonInitState,
    TResult? Function(PokemonLoadingState value)? pokemonLoadingState,
    TResult? Function(PokemonErrorState value)? pokemonErrorState,
    TResult? Function(GetPokemonsLoadedState value)? getPokemonsLoadedState,
  }) {
    return getPokemonsLoadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonInitState value)? pokemonInitState,
    TResult Function(PokemonLoadingState value)? pokemonLoadingState,
    TResult Function(PokemonErrorState value)? pokemonErrorState,
    TResult Function(GetPokemonsLoadedState value)? getPokemonsLoadedState,
    required TResult orElse(),
  }) {
    if (getPokemonsLoadedState != null) {
      return getPokemonsLoadedState(this);
    }
    return orElse();
  }
}

abstract class GetPokemonsLoadedState implements PokemonState {
  const factory GetPokemonsLoadedState(
      final PokemonListEntity pokemonListEntity) = _$GetPokemonsLoadedStateImpl;

  PokemonListEntity get pokemonListEntity;
  @JsonKey(ignore: true)
  _$$GetPokemonsLoadedStateImplCopyWith<_$GetPokemonsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
