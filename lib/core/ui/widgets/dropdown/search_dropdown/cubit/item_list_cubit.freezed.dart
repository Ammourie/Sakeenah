// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemListState<T> implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ItemListState<$T>'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemListState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ItemListState<$T>()';
}


}

/// @nodoc
class $ItemListStateCopyWith<T,$Res>  {
$ItemListStateCopyWith(ItemListState<T> _, $Res Function(ItemListState<T>) __);
}


/// Adds pattern-matching-related methods to [ItemListState].
extension ItemListStatePatterns<T> on ItemListState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ItemListInitState<T> value)?  initial,TResult Function( ItemListLoadingState<T> value)?  loading,TResult Function( ItemListErrorState<T> value)?  error,TResult Function( ItemListLoadedState<T> value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ItemListInitState() when initial != null:
return initial(_that);case ItemListLoadingState() when loading != null:
return loading(_that);case ItemListErrorState() when error != null:
return error(_that);case ItemListLoadedState() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ItemListInitState<T> value)  initial,required TResult Function( ItemListLoadingState<T> value)  loading,required TResult Function( ItemListErrorState<T> value)  error,required TResult Function( ItemListLoadedState<T> value)  loaded,}){
final _that = this;
switch (_that) {
case ItemListInitState():
return initial(_that);case ItemListLoadingState():
return loading(_that);case ItemListErrorState():
return error(_that);case ItemListLoadedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ItemListInitState<T> value)?  initial,TResult? Function( ItemListLoadingState<T> value)?  loading,TResult? Function( ItemListErrorState<T> value)?  error,TResult? Function( ItemListLoadedState<T> value)?  loaded,}){
final _that = this;
switch (_that) {
case ItemListInitState() when initial != null:
return initial(_that);case ItemListLoadingState() when loading != null:
return loading(_that);case ItemListErrorState() when error != null:
return error(_that);case ItemListLoadedState() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AppErrors error,  VoidCallback callback)?  error,TResult Function( List<T> data)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ItemListInitState() when initial != null:
return initial();case ItemListLoadingState() when loading != null:
return loading();case ItemListErrorState() when error != null:
return error(_that.error,_that.callback);case ItemListLoadedState() when loaded != null:
return loaded(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AppErrors error,  VoidCallback callback)  error,required TResult Function( List<T> data)  loaded,}) {final _that = this;
switch (_that) {
case ItemListInitState():
return initial();case ItemListLoadingState():
return loading();case ItemListErrorState():
return error(_that.error,_that.callback);case ItemListLoadedState():
return loaded(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AppErrors error,  VoidCallback callback)?  error,TResult? Function( List<T> data)?  loaded,}) {final _that = this;
switch (_that) {
case ItemListInitState() when initial != null:
return initial();case ItemListLoadingState() when loading != null:
return loading();case ItemListErrorState() when error != null:
return error(_that.error,_that.callback);case ItemListLoadedState() when loaded != null:
return loaded(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class ItemListInitState<T> with DiagnosticableTreeMixin implements ItemListState<T> {
  const ItemListInitState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ItemListState<$T>.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemListInitState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ItemListState<$T>.initial()';
}


}




/// @nodoc


class ItemListLoadingState<T> with DiagnosticableTreeMixin implements ItemListState<T> {
  const ItemListLoadingState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ItemListState<$T>.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemListLoadingState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ItemListState<$T>.loading()';
}


}




/// @nodoc


class ItemListErrorState<T> with DiagnosticableTreeMixin implements ItemListState<T> {
  const ItemListErrorState({required this.error, required this.callback});
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of ItemListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemListErrorStateCopyWith<T, ItemListErrorState<T>> get copyWith => _$ItemListErrorStateCopyWithImpl<T, ItemListErrorState<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ItemListState<$T>.error'))
    ..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('callback', callback));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemListErrorState<T>&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ItemListState<$T>.error(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $ItemListErrorStateCopyWith<T,$Res> implements $ItemListStateCopyWith<T, $Res> {
  factory $ItemListErrorStateCopyWith(ItemListErrorState<T> value, $Res Function(ItemListErrorState<T>) _then) = _$ItemListErrorStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$ItemListErrorStateCopyWithImpl<T,$Res>
    implements $ItemListErrorStateCopyWith<T, $Res> {
  _$ItemListErrorStateCopyWithImpl(this._self, this._then);

  final ItemListErrorState<T> _self;
  final $Res Function(ItemListErrorState<T>) _then;

/// Create a copy of ItemListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(ItemListErrorState<T>(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,callback: null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of ItemListState
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


class ItemListLoadedState<T> with DiagnosticableTreeMixin implements ItemListState<T> {
  const ItemListLoadedState({required final  List<T> data}): _data = data;
  

 final  List<T> _data;
 List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ItemListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemListLoadedStateCopyWith<T, ItemListLoadedState<T>> get copyWith => _$ItemListLoadedStateCopyWithImpl<T, ItemListLoadedState<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ItemListState<$T>.loaded'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemListLoadedState<T>&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ItemListState<$T>.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $ItemListLoadedStateCopyWith<T,$Res> implements $ItemListStateCopyWith<T, $Res> {
  factory $ItemListLoadedStateCopyWith(ItemListLoadedState<T> value, $Res Function(ItemListLoadedState<T>) _then) = _$ItemListLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<T> data
});




}
/// @nodoc
class _$ItemListLoadedStateCopyWithImpl<T,$Res>
    implements $ItemListLoadedStateCopyWith<T, $Res> {
  _$ItemListLoadedStateCopyWithImpl(this._self, this._then);

  final ItemListLoadedState<T> _self;
  final $Res Function(ItemListLoadedState<T>) _then;

/// Create a copy of ItemListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ItemListLoadedState<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}


}

// dart format on
