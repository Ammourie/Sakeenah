// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'more_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoreState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoreState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoreState()';
}


}

/// @nodoc
class $MoreStateCopyWith<$Res>  {
$MoreStateCopyWith(MoreState _, $Res Function(MoreState) __);
}


/// Adds pattern-matching-related methods to [MoreState].
extension MoreStatePatterns on MoreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MoreInitState value)?  moreInit,TResult Function( MoreLoadingState value)?  moreLoading,TResult Function( SuccessReportProblemState value)?  successReportProblem,TResult Function( CheckUpdateAppLoadedState value)?  checkUpdateAppLoaded,TResult Function( MoreErrorState value)?  moreError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MoreInitState() when moreInit != null:
return moreInit(_that);case MoreLoadingState() when moreLoading != null:
return moreLoading(_that);case SuccessReportProblemState() when successReportProblem != null:
return successReportProblem(_that);case CheckUpdateAppLoadedState() when checkUpdateAppLoaded != null:
return checkUpdateAppLoaded(_that);case MoreErrorState() when moreError != null:
return moreError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MoreInitState value)  moreInit,required TResult Function( MoreLoadingState value)  moreLoading,required TResult Function( SuccessReportProblemState value)  successReportProblem,required TResult Function( CheckUpdateAppLoadedState value)  checkUpdateAppLoaded,required TResult Function( MoreErrorState value)  moreError,}){
final _that = this;
switch (_that) {
case MoreInitState():
return moreInit(_that);case MoreLoadingState():
return moreLoading(_that);case SuccessReportProblemState():
return successReportProblem(_that);case CheckUpdateAppLoadedState():
return checkUpdateAppLoaded(_that);case MoreErrorState():
return moreError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MoreInitState value)?  moreInit,TResult? Function( MoreLoadingState value)?  moreLoading,TResult? Function( SuccessReportProblemState value)?  successReportProblem,TResult? Function( CheckUpdateAppLoadedState value)?  checkUpdateAppLoaded,TResult? Function( MoreErrorState value)?  moreError,}){
final _that = this;
switch (_that) {
case MoreInitState() when moreInit != null:
return moreInit(_that);case MoreLoadingState() when moreLoading != null:
return moreLoading(_that);case SuccessReportProblemState() when successReportProblem != null:
return successReportProblem(_that);case CheckUpdateAppLoadedState() when checkUpdateAppLoaded != null:
return checkUpdateAppLoaded(_that);case MoreErrorState() when moreError != null:
return moreError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  moreInit,TResult Function()?  moreLoading,TResult Function()?  successReportProblem,TResult Function( VersionEntity data)?  checkUpdateAppLoaded,TResult Function( AppErrors error,  VoidCallback callback)?  moreError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MoreInitState() when moreInit != null:
return moreInit();case MoreLoadingState() when moreLoading != null:
return moreLoading();case SuccessReportProblemState() when successReportProblem != null:
return successReportProblem();case CheckUpdateAppLoadedState() when checkUpdateAppLoaded != null:
return checkUpdateAppLoaded(_that.data);case MoreErrorState() when moreError != null:
return moreError(_that.error,_that.callback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  moreInit,required TResult Function()  moreLoading,required TResult Function()  successReportProblem,required TResult Function( VersionEntity data)  checkUpdateAppLoaded,required TResult Function( AppErrors error,  VoidCallback callback)  moreError,}) {final _that = this;
switch (_that) {
case MoreInitState():
return moreInit();case MoreLoadingState():
return moreLoading();case SuccessReportProblemState():
return successReportProblem();case CheckUpdateAppLoadedState():
return checkUpdateAppLoaded(_that.data);case MoreErrorState():
return moreError(_that.error,_that.callback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  moreInit,TResult? Function()?  moreLoading,TResult? Function()?  successReportProblem,TResult? Function( VersionEntity data)?  checkUpdateAppLoaded,TResult? Function( AppErrors error,  VoidCallback callback)?  moreError,}) {final _that = this;
switch (_that) {
case MoreInitState() when moreInit != null:
return moreInit();case MoreLoadingState() when moreLoading != null:
return moreLoading();case SuccessReportProblemState() when successReportProblem != null:
return successReportProblem();case CheckUpdateAppLoadedState() when checkUpdateAppLoaded != null:
return checkUpdateAppLoaded(_that.data);case MoreErrorState() when moreError != null:
return moreError(_that.error,_that.callback);case _:
  return null;

}
}

}

/// @nodoc


class MoreInitState implements MoreState {
  const MoreInitState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoreInitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoreState.moreInit()';
}


}




/// @nodoc


class MoreLoadingState implements MoreState {
  const MoreLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoreLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoreState.moreLoading()';
}


}




/// @nodoc


class SuccessReportProblemState implements MoreState {
  const SuccessReportProblemState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessReportProblemState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoreState.successReportProblem()';
}


}




/// @nodoc


class CheckUpdateAppLoadedState implements MoreState {
  const CheckUpdateAppLoadedState({required this.data});
  

 final  VersionEntity data;

/// Create a copy of MoreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckUpdateAppLoadedStateCopyWith<CheckUpdateAppLoadedState> get copyWith => _$CheckUpdateAppLoadedStateCopyWithImpl<CheckUpdateAppLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckUpdateAppLoadedState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'MoreState.checkUpdateAppLoaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $CheckUpdateAppLoadedStateCopyWith<$Res> implements $MoreStateCopyWith<$Res> {
  factory $CheckUpdateAppLoadedStateCopyWith(CheckUpdateAppLoadedState value, $Res Function(CheckUpdateAppLoadedState) _then) = _$CheckUpdateAppLoadedStateCopyWithImpl;
@useResult
$Res call({
 VersionEntity data
});




}
/// @nodoc
class _$CheckUpdateAppLoadedStateCopyWithImpl<$Res>
    implements $CheckUpdateAppLoadedStateCopyWith<$Res> {
  _$CheckUpdateAppLoadedStateCopyWithImpl(this._self, this._then);

  final CheckUpdateAppLoadedState _self;
  final $Res Function(CheckUpdateAppLoadedState) _then;

/// Create a copy of MoreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CheckUpdateAppLoadedState(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VersionEntity,
  ));
}


}

/// @nodoc


class MoreErrorState implements MoreState {
  const MoreErrorState(this.error, this.callback);
  

 final  AppErrors error;
 final  VoidCallback callback;

/// Create a copy of MoreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoreErrorStateCopyWith<MoreErrorState> get copyWith => _$MoreErrorStateCopyWithImpl<MoreErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoreErrorState&&(identical(other.error, error) || other.error == error)&&(identical(other.callback, callback) || other.callback == callback));
}


@override
int get hashCode => Object.hash(runtimeType,error,callback);

@override
String toString() {
  return 'MoreState.moreError(error: $error, callback: $callback)';
}


}

/// @nodoc
abstract mixin class $MoreErrorStateCopyWith<$Res> implements $MoreStateCopyWith<$Res> {
  factory $MoreErrorStateCopyWith(MoreErrorState value, $Res Function(MoreErrorState) _then) = _$MoreErrorStateCopyWithImpl;
@useResult
$Res call({
 AppErrors error, VoidCallback callback
});


$AppErrorsCopyWith<$Res> get error;

}
/// @nodoc
class _$MoreErrorStateCopyWithImpl<$Res>
    implements $MoreErrorStateCopyWith<$Res> {
  _$MoreErrorStateCopyWithImpl(this._self, this._then);

  final MoreErrorState _self;
  final $Res Function(MoreErrorState) _then;

/// Create a copy of MoreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? callback = null,}) {
  return _then(MoreErrorState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrors,null == callback ? _self.callback : callback // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}

/// Create a copy of MoreState
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
