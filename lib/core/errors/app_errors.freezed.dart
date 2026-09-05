// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppErrors {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppErrors);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors()';
}


}

/// @nodoc
class $AppErrorsCopyWith<$Res>  {
$AppErrorsCopyWith(AppErrors _, $Res Function(AppErrors) __);
}


/// Adds pattern-matching-related methods to [AppErrors].
extension AppErrorsPatterns on AppErrors {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConnectionError value)?  connectionError,TResult Function( InternalServerError value)?  internalServerError,TResult Function( InternalServerWithDataError value)?  internalServerWithDataError,TResult Function( AccountNotVerifiedError value)?  accountNotVerifiedError,TResult Function( BadRequestError value)?  badRequestError,TResult Function( CancelError value)?  cancelError,TResult Function( ConflictError value)?  conflictError,TResult Function( CustomError value)?  customError,TResult Function( ForbiddenError value)?  forbiddenError,TResult Function( FormatError value)?  formatError,TResult Function( LoginRequiredError value)?  loginRequiredError,TResult Function( NetError value)?  netError,TResult Function( NotFoundError value)?  notFoundError,TResult Function( ResponseError value)?  responseError,TResult Function( ScreenNotImplementedError value)?  screenNotImplementedError,TResult Function( SocketError value)?  socketError,TResult Function( TimeoutError value)?  timeoutError,TResult Function( UnauthorizedError value)?  unauthorizedError,TResult Function( UnknownError value)?  unknownError,TResult Function( GuestError value)?  guestError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConnectionError() when connectionError != null:
return connectionError(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case InternalServerWithDataError() when internalServerWithDataError != null:
return internalServerWithDataError(_that);case AccountNotVerifiedError() when accountNotVerifiedError != null:
return accountNotVerifiedError(_that);case BadRequestError() when badRequestError != null:
return badRequestError(_that);case CancelError() when cancelError != null:
return cancelError(_that);case ConflictError() when conflictError != null:
return conflictError(_that);case CustomError() when customError != null:
return customError(_that);case ForbiddenError() when forbiddenError != null:
return forbiddenError(_that);case FormatError() when formatError != null:
return formatError(_that);case LoginRequiredError() when loginRequiredError != null:
return loginRequiredError(_that);case NetError() when netError != null:
return netError(_that);case NotFoundError() when notFoundError != null:
return notFoundError(_that);case ResponseError() when responseError != null:
return responseError(_that);case ScreenNotImplementedError() when screenNotImplementedError != null:
return screenNotImplementedError(_that);case SocketError() when socketError != null:
return socketError(_that);case TimeoutError() when timeoutError != null:
return timeoutError(_that);case UnauthorizedError() when unauthorizedError != null:
return unauthorizedError(_that);case UnknownError() when unknownError != null:
return unknownError(_that);case GuestError() when guestError != null:
return guestError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConnectionError value)  connectionError,required TResult Function( InternalServerError value)  internalServerError,required TResult Function( InternalServerWithDataError value)  internalServerWithDataError,required TResult Function( AccountNotVerifiedError value)  accountNotVerifiedError,required TResult Function( BadRequestError value)  badRequestError,required TResult Function( CancelError value)  cancelError,required TResult Function( ConflictError value)  conflictError,required TResult Function( CustomError value)  customError,required TResult Function( ForbiddenError value)  forbiddenError,required TResult Function( FormatError value)  formatError,required TResult Function( LoginRequiredError value)  loginRequiredError,required TResult Function( NetError value)  netError,required TResult Function( NotFoundError value)  notFoundError,required TResult Function( ResponseError value)  responseError,required TResult Function( ScreenNotImplementedError value)  screenNotImplementedError,required TResult Function( SocketError value)  socketError,required TResult Function( TimeoutError value)  timeoutError,required TResult Function( UnauthorizedError value)  unauthorizedError,required TResult Function( UnknownError value)  unknownError,required TResult Function( GuestError value)  guestError,}){
final _that = this;
switch (_that) {
case ConnectionError():
return connectionError(_that);case InternalServerError():
return internalServerError(_that);case InternalServerWithDataError():
return internalServerWithDataError(_that);case AccountNotVerifiedError():
return accountNotVerifiedError(_that);case BadRequestError():
return badRequestError(_that);case CancelError():
return cancelError(_that);case ConflictError():
return conflictError(_that);case CustomError():
return customError(_that);case ForbiddenError():
return forbiddenError(_that);case FormatError():
return formatError(_that);case LoginRequiredError():
return loginRequiredError(_that);case NetError():
return netError(_that);case NotFoundError():
return notFoundError(_that);case ResponseError():
return responseError(_that);case ScreenNotImplementedError():
return screenNotImplementedError(_that);case SocketError():
return socketError(_that);case TimeoutError():
return timeoutError(_that);case UnauthorizedError():
return unauthorizedError(_that);case UnknownError():
return unknownError(_that);case GuestError():
return guestError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConnectionError value)?  connectionError,TResult? Function( InternalServerError value)?  internalServerError,TResult? Function( InternalServerWithDataError value)?  internalServerWithDataError,TResult? Function( AccountNotVerifiedError value)?  accountNotVerifiedError,TResult? Function( BadRequestError value)?  badRequestError,TResult? Function( CancelError value)?  cancelError,TResult? Function( ConflictError value)?  conflictError,TResult? Function( CustomError value)?  customError,TResult? Function( ForbiddenError value)?  forbiddenError,TResult? Function( FormatError value)?  formatError,TResult? Function( LoginRequiredError value)?  loginRequiredError,TResult? Function( NetError value)?  netError,TResult? Function( NotFoundError value)?  notFoundError,TResult? Function( ResponseError value)?  responseError,TResult? Function( ScreenNotImplementedError value)?  screenNotImplementedError,TResult? Function( SocketError value)?  socketError,TResult? Function( TimeoutError value)?  timeoutError,TResult? Function( UnauthorizedError value)?  unauthorizedError,TResult? Function( UnknownError value)?  unknownError,TResult? Function( GuestError value)?  guestError,}){
final _that = this;
switch (_that) {
case ConnectionError() when connectionError != null:
return connectionError(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case InternalServerWithDataError() when internalServerWithDataError != null:
return internalServerWithDataError(_that);case AccountNotVerifiedError() when accountNotVerifiedError != null:
return accountNotVerifiedError(_that);case BadRequestError() when badRequestError != null:
return badRequestError(_that);case CancelError() when cancelError != null:
return cancelError(_that);case ConflictError() when conflictError != null:
return conflictError(_that);case CustomError() when customError != null:
return customError(_that);case ForbiddenError() when forbiddenError != null:
return forbiddenError(_that);case FormatError() when formatError != null:
return formatError(_that);case LoginRequiredError() when loginRequiredError != null:
return loginRequiredError(_that);case NetError() when netError != null:
return netError(_that);case NotFoundError() when notFoundError != null:
return notFoundError(_that);case ResponseError() when responseError != null:
return responseError(_that);case ScreenNotImplementedError() when screenNotImplementedError != null:
return screenNotImplementedError(_that);case SocketError() when socketError != null:
return socketError(_that);case TimeoutError() when timeoutError != null:
return timeoutError(_that);case UnauthorizedError() when unauthorizedError != null:
return unauthorizedError(_that);case UnknownError() when unknownError != null:
return unknownError(_that);case GuestError() when guestError != null:
return guestError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connectionError,TResult Function()?  internalServerError,TResult Function( int errorCode,  String? message,  ErrorCodeType type)?  internalServerWithDataError,TResult Function()?  accountNotVerifiedError,TResult Function( String message)?  badRequestError,TResult Function( String? message)?  cancelError,TResult Function()?  conflictError,TResult Function( String message)?  customError,TResult Function()?  forbiddenError,TResult Function()?  formatError,TResult Function()?  loginRequiredError,TResult Function()?  netError,TResult Function( String requestedUrlPath)?  notFoundError,TResult Function()?  responseError,TResult Function()?  screenNotImplementedError,TResult Function()?  socketError,TResult Function()?  timeoutError,TResult Function()?  unauthorizedError,TResult Function()?  unknownError,TResult Function()?  guestError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConnectionError() when connectionError != null:
return connectionError();case InternalServerError() when internalServerError != null:
return internalServerError();case InternalServerWithDataError() when internalServerWithDataError != null:
return internalServerWithDataError(_that.errorCode,_that.message,_that.type);case AccountNotVerifiedError() when accountNotVerifiedError != null:
return accountNotVerifiedError();case BadRequestError() when badRequestError != null:
return badRequestError(_that.message);case CancelError() when cancelError != null:
return cancelError(_that.message);case ConflictError() when conflictError != null:
return conflictError();case CustomError() when customError != null:
return customError(_that.message);case ForbiddenError() when forbiddenError != null:
return forbiddenError();case FormatError() when formatError != null:
return formatError();case LoginRequiredError() when loginRequiredError != null:
return loginRequiredError();case NetError() when netError != null:
return netError();case NotFoundError() when notFoundError != null:
return notFoundError(_that.requestedUrlPath);case ResponseError() when responseError != null:
return responseError();case ScreenNotImplementedError() when screenNotImplementedError != null:
return screenNotImplementedError();case SocketError() when socketError != null:
return socketError();case TimeoutError() when timeoutError != null:
return timeoutError();case UnauthorizedError() when unauthorizedError != null:
return unauthorizedError();case UnknownError() when unknownError != null:
return unknownError();case GuestError() when guestError != null:
return guestError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connectionError,required TResult Function()  internalServerError,required TResult Function( int errorCode,  String? message,  ErrorCodeType type)  internalServerWithDataError,required TResult Function()  accountNotVerifiedError,required TResult Function( String message)  badRequestError,required TResult Function( String? message)  cancelError,required TResult Function()  conflictError,required TResult Function( String message)  customError,required TResult Function()  forbiddenError,required TResult Function()  formatError,required TResult Function()  loginRequiredError,required TResult Function()  netError,required TResult Function( String requestedUrlPath)  notFoundError,required TResult Function()  responseError,required TResult Function()  screenNotImplementedError,required TResult Function()  socketError,required TResult Function()  timeoutError,required TResult Function()  unauthorizedError,required TResult Function()  unknownError,required TResult Function()  guestError,}) {final _that = this;
switch (_that) {
case ConnectionError():
return connectionError();case InternalServerError():
return internalServerError();case InternalServerWithDataError():
return internalServerWithDataError(_that.errorCode,_that.message,_that.type);case AccountNotVerifiedError():
return accountNotVerifiedError();case BadRequestError():
return badRequestError(_that.message);case CancelError():
return cancelError(_that.message);case ConflictError():
return conflictError();case CustomError():
return customError(_that.message);case ForbiddenError():
return forbiddenError();case FormatError():
return formatError();case LoginRequiredError():
return loginRequiredError();case NetError():
return netError();case NotFoundError():
return notFoundError(_that.requestedUrlPath);case ResponseError():
return responseError();case ScreenNotImplementedError():
return screenNotImplementedError();case SocketError():
return socketError();case TimeoutError():
return timeoutError();case UnauthorizedError():
return unauthorizedError();case UnknownError():
return unknownError();case GuestError():
return guestError();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connectionError,TResult? Function()?  internalServerError,TResult? Function( int errorCode,  String? message,  ErrorCodeType type)?  internalServerWithDataError,TResult? Function()?  accountNotVerifiedError,TResult? Function( String message)?  badRequestError,TResult? Function( String? message)?  cancelError,TResult? Function()?  conflictError,TResult? Function( String message)?  customError,TResult? Function()?  forbiddenError,TResult? Function()?  formatError,TResult? Function()?  loginRequiredError,TResult? Function()?  netError,TResult? Function( String requestedUrlPath)?  notFoundError,TResult? Function()?  responseError,TResult? Function()?  screenNotImplementedError,TResult? Function()?  socketError,TResult? Function()?  timeoutError,TResult? Function()?  unauthorizedError,TResult? Function()?  unknownError,TResult? Function()?  guestError,}) {final _that = this;
switch (_that) {
case ConnectionError() when connectionError != null:
return connectionError();case InternalServerError() when internalServerError != null:
return internalServerError();case InternalServerWithDataError() when internalServerWithDataError != null:
return internalServerWithDataError(_that.errorCode,_that.message,_that.type);case AccountNotVerifiedError() when accountNotVerifiedError != null:
return accountNotVerifiedError();case BadRequestError() when badRequestError != null:
return badRequestError(_that.message);case CancelError() when cancelError != null:
return cancelError(_that.message);case ConflictError() when conflictError != null:
return conflictError();case CustomError() when customError != null:
return customError(_that.message);case ForbiddenError() when forbiddenError != null:
return forbiddenError();case FormatError() when formatError != null:
return formatError();case LoginRequiredError() when loginRequiredError != null:
return loginRequiredError();case NetError() when netError != null:
return netError();case NotFoundError() when notFoundError != null:
return notFoundError(_that.requestedUrlPath);case ResponseError() when responseError != null:
return responseError();case ScreenNotImplementedError() when screenNotImplementedError != null:
return screenNotImplementedError();case SocketError() when socketError != null:
return socketError();case TimeoutError() when timeoutError != null:
return timeoutError();case UnauthorizedError() when unauthorizedError != null:
return unauthorizedError();case UnknownError() when unknownError != null:
return unknownError();case GuestError() when guestError != null:
return guestError();case _:
  return null;

}
}

}

/// @nodoc


class ConnectionError implements AppErrors, HttpError {
  const ConnectionError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.connectionError()';
}


}




/// @nodoc


class InternalServerError implements AppErrors, HttpError {
  const InternalServerError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternalServerError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.internalServerError()';
}


}




/// @nodoc


class InternalServerWithDataError implements AppErrors, HttpError {
  const InternalServerWithDataError(this.errorCode, {this.message, required this.type});
  

 final  int errorCode;
 final  String? message;
 final  ErrorCodeType type;

/// Create a copy of AppErrors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternalServerWithDataErrorCopyWith<InternalServerWithDataError> get copyWith => _$InternalServerWithDataErrorCopyWithImpl<InternalServerWithDataError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternalServerWithDataError&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,errorCode,message,type);

@override
String toString() {
  return 'AppErrors.internalServerWithDataError(errorCode: $errorCode, message: $message, type: $type)';
}


}

/// @nodoc
abstract mixin class $InternalServerWithDataErrorCopyWith<$Res> implements $AppErrorsCopyWith<$Res> {
  factory $InternalServerWithDataErrorCopyWith(InternalServerWithDataError value, $Res Function(InternalServerWithDataError) _then) = _$InternalServerWithDataErrorCopyWithImpl;
@useResult
$Res call({
 int errorCode, String? message, ErrorCodeType type
});




}
/// @nodoc
class _$InternalServerWithDataErrorCopyWithImpl<$Res>
    implements $InternalServerWithDataErrorCopyWith<$Res> {
  _$InternalServerWithDataErrorCopyWithImpl(this._self, this._then);

  final InternalServerWithDataError _self;
  final $Res Function(InternalServerWithDataError) _then;

/// Create a copy of AppErrors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorCode = null,Object? message = freezed,Object? type = null,}) {
  return _then(InternalServerWithDataError(
null == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ErrorCodeType,
  ));
}


}

/// @nodoc


class AccountNotVerifiedError implements AppErrors {
  const AccountNotVerifiedError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountNotVerifiedError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.accountNotVerifiedError()';
}


}




/// @nodoc


class BadRequestError implements AppErrors, HttpError {
  const BadRequestError({this.message = ""});
  

@JsonKey() final  String message;

/// Create a copy of AppErrors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadRequestErrorCopyWith<BadRequestError> get copyWith => _$BadRequestErrorCopyWithImpl<BadRequestError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadRequestError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppErrors.badRequestError(message: $message)';
}


}

/// @nodoc
abstract mixin class $BadRequestErrorCopyWith<$Res> implements $AppErrorsCopyWith<$Res> {
  factory $BadRequestErrorCopyWith(BadRequestError value, $Res Function(BadRequestError) _then) = _$BadRequestErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BadRequestErrorCopyWithImpl<$Res>
    implements $BadRequestErrorCopyWith<$Res> {
  _$BadRequestErrorCopyWithImpl(this._self, this._then);

  final BadRequestError _self;
  final $Res Function(BadRequestError) _then;

/// Create a copy of AppErrors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BadRequestError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CancelError implements AppErrors {
  const CancelError(this.message);
  

 final  String? message;

/// Create a copy of AppErrors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelErrorCopyWith<CancelError> get copyWith => _$CancelErrorCopyWithImpl<CancelError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppErrors.cancelError(message: $message)';
}


}

/// @nodoc
abstract mixin class $CancelErrorCopyWith<$Res> implements $AppErrorsCopyWith<$Res> {
  factory $CancelErrorCopyWith(CancelError value, $Res Function(CancelError) _then) = _$CancelErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$CancelErrorCopyWithImpl<$Res>
    implements $CancelErrorCopyWith<$Res> {
  _$CancelErrorCopyWithImpl(this._self, this._then);

  final CancelError _self;
  final $Res Function(CancelError) _then;

/// Create a copy of AppErrors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(CancelError(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ConflictError implements AppErrors, HttpError {
  const ConflictError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConflictError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.conflictError()';
}


}




/// @nodoc


class CustomError implements AppErrors {
  const CustomError({this.message = ""});
  

@JsonKey() final  String message;

/// Create a copy of AppErrors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomErrorCopyWith<CustomError> get copyWith => _$CustomErrorCopyWithImpl<CustomError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppErrors.customError(message: $message)';
}


}

/// @nodoc
abstract mixin class $CustomErrorCopyWith<$Res> implements $AppErrorsCopyWith<$Res> {
  factory $CustomErrorCopyWith(CustomError value, $Res Function(CustomError) _then) = _$CustomErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CustomErrorCopyWithImpl<$Res>
    implements $CustomErrorCopyWith<$Res> {
  _$CustomErrorCopyWithImpl(this._self, this._then);

  final CustomError _self;
  final $Res Function(CustomError) _then;

/// Create a copy of AppErrors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CustomError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForbiddenError implements AppErrors, HttpError {
  const ForbiddenError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForbiddenError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.forbiddenError()';
}


}




/// @nodoc


class FormatError implements AppErrors {
  const FormatError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormatError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.formatError()';
}


}




/// @nodoc


class LoginRequiredError implements AppErrors {
  const LoginRequiredError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequiredError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.loginRequiredError()';
}


}




/// @nodoc


class NetError implements AppErrors, HttpError {
  const NetError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.netError()';
}


}




/// @nodoc


class NotFoundError implements AppErrors, HttpError {
  const NotFoundError(this.requestedUrlPath);
  

 final  String requestedUrlPath;

/// Create a copy of AppErrors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundErrorCopyWith<NotFoundError> get copyWith => _$NotFoundErrorCopyWithImpl<NotFoundError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundError&&(identical(other.requestedUrlPath, requestedUrlPath) || other.requestedUrlPath == requestedUrlPath));
}


@override
int get hashCode => Object.hash(runtimeType,requestedUrlPath);

@override
String toString() {
  return 'AppErrors.notFoundError(requestedUrlPath: $requestedUrlPath)';
}


}

/// @nodoc
abstract mixin class $NotFoundErrorCopyWith<$Res> implements $AppErrorsCopyWith<$Res> {
  factory $NotFoundErrorCopyWith(NotFoundError value, $Res Function(NotFoundError) _then) = _$NotFoundErrorCopyWithImpl;
@useResult
$Res call({
 String requestedUrlPath
});




}
/// @nodoc
class _$NotFoundErrorCopyWithImpl<$Res>
    implements $NotFoundErrorCopyWith<$Res> {
  _$NotFoundErrorCopyWithImpl(this._self, this._then);

  final NotFoundError _self;
  final $Res Function(NotFoundError) _then;

/// Create a copy of AppErrors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestedUrlPath = null,}) {
  return _then(NotFoundError(
null == requestedUrlPath ? _self.requestedUrlPath : requestedUrlPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResponseError implements AppErrors, HttpError {
  const ResponseError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.responseError()';
}


}




/// @nodoc


class ScreenNotImplementedError implements AppErrors {
  const ScreenNotImplementedError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenNotImplementedError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.screenNotImplementedError()';
}


}




/// @nodoc


class SocketError implements AppErrors, HttpError {
  const SocketError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocketError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.socketError()';
}


}




/// @nodoc


class TimeoutError implements AppErrors, HttpError {
  const TimeoutError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeoutError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.timeoutError()';
}


}




/// @nodoc


class UnauthorizedError implements AppErrors, HttpError {
  const UnauthorizedError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.unauthorizedError()';
}


}




/// @nodoc


class UnknownError implements AppErrors, HttpError {
  const UnknownError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.unknownError()';
}


}




/// @nodoc


class GuestError implements AppErrors {
  const GuestError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppErrors.guestError()';
}


}




// dart format on
