// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleLogResponse {

 String get status; String get message; VehicleLogPaginationData get data;
/// Create a copy of VehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleLogResponseCopyWith<VehicleLogResponse> get copyWith => _$VehicleLogResponseCopyWithImpl<VehicleLogResponse>(this as VehicleLogResponse, _$identity);

  /// Serializes this VehicleLogResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleLogResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'VehicleLogResponse(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $VehicleLogResponseCopyWith<$Res>  {
  factory $VehicleLogResponseCopyWith(VehicleLogResponse value, $Res Function(VehicleLogResponse) _then) = _$VehicleLogResponseCopyWithImpl;
@useResult
$Res call({
 String status, String message, VehicleLogPaginationData data
});


$VehicleLogPaginationDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VehicleLogResponseCopyWithImpl<$Res>
    implements $VehicleLogResponseCopyWith<$Res> {
  _$VehicleLogResponseCopyWithImpl(this._self, this._then);

  final VehicleLogResponse _self;
  final $Res Function(VehicleLogResponse) _then;

/// Create a copy of VehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VehicleLogPaginationData,
  ));
}
/// Create a copy of VehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleLogPaginationDataCopyWith<$Res> get data {
  
  return $VehicleLogPaginationDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehicleLogResponse].
extension VehicleLogResponsePatterns on VehicleLogResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleLogResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleLogResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleLogResponse value)  $default,){
final _that = this;
switch (_that) {
case _VehicleLogResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleLogResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleLogResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String message,  VehicleLogPaginationData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleLogResponse() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String message,  VehicleLogPaginationData data)  $default,) {final _that = this;
switch (_that) {
case _VehicleLogResponse():
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String message,  VehicleLogPaginationData data)?  $default,) {final _that = this;
switch (_that) {
case _VehicleLogResponse() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleLogResponse implements VehicleLogResponse {
  const _VehicleLogResponse({required this.status, required this.message, required this.data});
  factory _VehicleLogResponse.fromJson(Map<String, dynamic> json) => _$VehicleLogResponseFromJson(json);

@override final  String status;
@override final  String message;
@override final  VehicleLogPaginationData data;

/// Create a copy of VehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleLogResponseCopyWith<_VehicleLogResponse> get copyWith => __$VehicleLogResponseCopyWithImpl<_VehicleLogResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleLogResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleLogResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'VehicleLogResponse(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VehicleLogResponseCopyWith<$Res> implements $VehicleLogResponseCopyWith<$Res> {
  factory _$VehicleLogResponseCopyWith(_VehicleLogResponse value, $Res Function(_VehicleLogResponse) _then) = __$VehicleLogResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, String message, VehicleLogPaginationData data
});


@override $VehicleLogPaginationDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VehicleLogResponseCopyWithImpl<$Res>
    implements _$VehicleLogResponseCopyWith<$Res> {
  __$VehicleLogResponseCopyWithImpl(this._self, this._then);

  final _VehicleLogResponse _self;
  final $Res Function(_VehicleLogResponse) _then;

/// Create a copy of VehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_VehicleLogResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VehicleLogPaginationData,
  ));
}

/// Create a copy of VehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleLogPaginationDataCopyWith<$Res> get data {
  
  return $VehicleLogPaginationDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SingleVehicleLogResponse {

 String get status; String get message; VehicleLog get data;
/// Create a copy of SingleVehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingleVehicleLogResponseCopyWith<SingleVehicleLogResponse> get copyWith => _$SingleVehicleLogResponseCopyWithImpl<SingleVehicleLogResponse>(this as SingleVehicleLogResponse, _$identity);

  /// Serializes this SingleVehicleLogResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingleVehicleLogResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'SingleVehicleLogResponse(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SingleVehicleLogResponseCopyWith<$Res>  {
  factory $SingleVehicleLogResponseCopyWith(SingleVehicleLogResponse value, $Res Function(SingleVehicleLogResponse) _then) = _$SingleVehicleLogResponseCopyWithImpl;
@useResult
$Res call({
 String status, String message, VehicleLog data
});


$VehicleLogCopyWith<$Res> get data;

}
/// @nodoc
class _$SingleVehicleLogResponseCopyWithImpl<$Res>
    implements $SingleVehicleLogResponseCopyWith<$Res> {
  _$SingleVehicleLogResponseCopyWithImpl(this._self, this._then);

  final SingleVehicleLogResponse _self;
  final $Res Function(SingleVehicleLogResponse) _then;

/// Create a copy of SingleVehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VehicleLog,
  ));
}
/// Create a copy of SingleVehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleLogCopyWith<$Res> get data {
  
  return $VehicleLogCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SingleVehicleLogResponse].
extension SingleVehicleLogResponsePatterns on SingleVehicleLogResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingleVehicleLogResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingleVehicleLogResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingleVehicleLogResponse value)  $default,){
final _that = this;
switch (_that) {
case _SingleVehicleLogResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingleVehicleLogResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SingleVehicleLogResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String message,  VehicleLog data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingleVehicleLogResponse() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String message,  VehicleLog data)  $default,) {final _that = this;
switch (_that) {
case _SingleVehicleLogResponse():
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String message,  VehicleLog data)?  $default,) {final _that = this;
switch (_that) {
case _SingleVehicleLogResponse() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SingleVehicleLogResponse implements SingleVehicleLogResponse {
  const _SingleVehicleLogResponse({required this.status, required this.message, required this.data});
  factory _SingleVehicleLogResponse.fromJson(Map<String, dynamic> json) => _$SingleVehicleLogResponseFromJson(json);

@override final  String status;
@override final  String message;
@override final  VehicleLog data;

/// Create a copy of SingleVehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingleVehicleLogResponseCopyWith<_SingleVehicleLogResponse> get copyWith => __$SingleVehicleLogResponseCopyWithImpl<_SingleVehicleLogResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingleVehicleLogResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingleVehicleLogResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'SingleVehicleLogResponse(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SingleVehicleLogResponseCopyWith<$Res> implements $SingleVehicleLogResponseCopyWith<$Res> {
  factory _$SingleVehicleLogResponseCopyWith(_SingleVehicleLogResponse value, $Res Function(_SingleVehicleLogResponse) _then) = __$SingleVehicleLogResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, String message, VehicleLog data
});


@override $VehicleLogCopyWith<$Res> get data;

}
/// @nodoc
class __$SingleVehicleLogResponseCopyWithImpl<$Res>
    implements _$SingleVehicleLogResponseCopyWith<$Res> {
  __$SingleVehicleLogResponseCopyWithImpl(this._self, this._then);

  final _SingleVehicleLogResponse _self;
  final $Res Function(_SingleVehicleLogResponse) _then;

/// Create a copy of SingleVehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_SingleVehicleLogResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VehicleLog,
  ));
}

/// Create a copy of SingleVehicleLogResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleLogCopyWith<$Res> get data {
  
  return $VehicleLogCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VehicleLogPaginationData {

@JsonKey(name: 'current_page') int get currentPage; List<VehicleLog> get data;@JsonKey(name: 'first_page_url') String get firstPageUrl; int get from;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'last_page_url') String get lastPageUrl;@JsonKey(name: 'next_page_url') String? get nextPageUrl; String get path;@JsonKey(name: 'per_page') int get perPage;@JsonKey(name: 'prev_page_url') String? get prevPageUrl; int get to; int get total;
/// Create a copy of VehicleLogPaginationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleLogPaginationDataCopyWith<VehicleLogPaginationData> get copyWith => _$VehicleLogPaginationDataCopyWithImpl<VehicleLogPaginationData>(this as VehicleLogPaginationData, _$identity);

  /// Serializes this VehicleLogPaginationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleLogPaginationData&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.firstPageUrl, firstPageUrl) || other.firstPageUrl == firstPageUrl)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.lastPageUrl, lastPageUrl) || other.lastPageUrl == lastPageUrl)&&(identical(other.nextPageUrl, nextPageUrl) || other.nextPageUrl == nextPageUrl)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.prevPageUrl, prevPageUrl) || other.prevPageUrl == prevPageUrl)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(data),firstPageUrl,from,lastPage,lastPageUrl,nextPageUrl,path,perPage,prevPageUrl,to,total);

@override
String toString() {
  return 'VehicleLogPaginationData(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class $VehicleLogPaginationDataCopyWith<$Res>  {
  factory $VehicleLogPaginationDataCopyWith(VehicleLogPaginationData value, $Res Function(VehicleLogPaginationData) _then) = _$VehicleLogPaginationDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, List<VehicleLog> data,@JsonKey(name: 'first_page_url') String firstPageUrl, int from,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'last_page_url') String lastPageUrl,@JsonKey(name: 'next_page_url') String? nextPageUrl, String path,@JsonKey(name: 'per_page') int perPage,@JsonKey(name: 'prev_page_url') String? prevPageUrl, int to, int total
});




}
/// @nodoc
class _$VehicleLogPaginationDataCopyWithImpl<$Res>
    implements $VehicleLogPaginationDataCopyWith<$Res> {
  _$VehicleLogPaginationDataCopyWithImpl(this._self, this._then);

  final VehicleLogPaginationData _self;
  final $Res Function(VehicleLogPaginationData) _then;

/// Create a copy of VehicleLogPaginationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? data = null,Object? firstPageUrl = null,Object? from = null,Object? lastPage = null,Object? lastPageUrl = null,Object? nextPageUrl = freezed,Object? path = null,Object? perPage = null,Object? prevPageUrl = freezed,Object? to = null,Object? total = null,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<VehicleLog>,firstPageUrl: null == firstPageUrl ? _self.firstPageUrl : firstPageUrl // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,lastPageUrl: null == lastPageUrl ? _self.lastPageUrl : lastPageUrl // ignore: cast_nullable_to_non_nullable
as String,nextPageUrl: freezed == nextPageUrl ? _self.nextPageUrl : nextPageUrl // ignore: cast_nullable_to_non_nullable
as String?,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,prevPageUrl: freezed == prevPageUrl ? _self.prevPageUrl : prevPageUrl // ignore: cast_nullable_to_non_nullable
as String?,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleLogPaginationData].
extension VehicleLogPaginationDataPatterns on VehicleLogPaginationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleLogPaginationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleLogPaginationData() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleLogPaginationData value)  $default,){
final _that = this;
switch (_that) {
case _VehicleLogPaginationData():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleLogPaginationData value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleLogPaginationData() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  List<VehicleLog> data, @JsonKey(name: 'first_page_url')  String firstPageUrl,  int from, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'last_page_url')  String lastPageUrl, @JsonKey(name: 'next_page_url')  String? nextPageUrl,  String path, @JsonKey(name: 'per_page')  int perPage, @JsonKey(name: 'prev_page_url')  String? prevPageUrl,  int to,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleLogPaginationData() when $default != null:
return $default(_that.currentPage,_that.data,_that.firstPageUrl,_that.from,_that.lastPage,_that.lastPageUrl,_that.nextPageUrl,_that.path,_that.perPage,_that.prevPageUrl,_that.to,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  List<VehicleLog> data, @JsonKey(name: 'first_page_url')  String firstPageUrl,  int from, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'last_page_url')  String lastPageUrl, @JsonKey(name: 'next_page_url')  String? nextPageUrl,  String path, @JsonKey(name: 'per_page')  int perPage, @JsonKey(name: 'prev_page_url')  String? prevPageUrl,  int to,  int total)  $default,) {final _that = this;
switch (_that) {
case _VehicleLogPaginationData():
return $default(_that.currentPage,_that.data,_that.firstPageUrl,_that.from,_that.lastPage,_that.lastPageUrl,_that.nextPageUrl,_that.path,_that.perPage,_that.prevPageUrl,_that.to,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage,  List<VehicleLog> data, @JsonKey(name: 'first_page_url')  String firstPageUrl,  int from, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'last_page_url')  String lastPageUrl, @JsonKey(name: 'next_page_url')  String? nextPageUrl,  String path, @JsonKey(name: 'per_page')  int perPage, @JsonKey(name: 'prev_page_url')  String? prevPageUrl,  int to,  int total)?  $default,) {final _that = this;
switch (_that) {
case _VehicleLogPaginationData() when $default != null:
return $default(_that.currentPage,_that.data,_that.firstPageUrl,_that.from,_that.lastPage,_that.lastPageUrl,_that.nextPageUrl,_that.path,_that.perPage,_that.prevPageUrl,_that.to,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleLogPaginationData implements VehicleLogPaginationData {
  const _VehicleLogPaginationData({@JsonKey(name: 'current_page') required this.currentPage, required final  List<VehicleLog> data, @JsonKey(name: 'first_page_url') required this.firstPageUrl, required this.from, @JsonKey(name: 'last_page') required this.lastPage, @JsonKey(name: 'last_page_url') required this.lastPageUrl, @JsonKey(name: 'next_page_url') this.nextPageUrl, required this.path, @JsonKey(name: 'per_page') required this.perPage, @JsonKey(name: 'prev_page_url') this.prevPageUrl, required this.to, required this.total}): _data = data;
  factory _VehicleLogPaginationData.fromJson(Map<String, dynamic> json) => _$VehicleLogPaginationDataFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<VehicleLog> _data;
@override List<VehicleLog> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'first_page_url') final  String firstPageUrl;
@override final  int from;
@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'last_page_url') final  String lastPageUrl;
@override@JsonKey(name: 'next_page_url') final  String? nextPageUrl;
@override final  String path;
@override@JsonKey(name: 'per_page') final  int perPage;
@override@JsonKey(name: 'prev_page_url') final  String? prevPageUrl;
@override final  int to;
@override final  int total;

/// Create a copy of VehicleLogPaginationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleLogPaginationDataCopyWith<_VehicleLogPaginationData> get copyWith => __$VehicleLogPaginationDataCopyWithImpl<_VehicleLogPaginationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleLogPaginationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleLogPaginationData&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.firstPageUrl, firstPageUrl) || other.firstPageUrl == firstPageUrl)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.lastPageUrl, lastPageUrl) || other.lastPageUrl == lastPageUrl)&&(identical(other.nextPageUrl, nextPageUrl) || other.nextPageUrl == nextPageUrl)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.prevPageUrl, prevPageUrl) || other.prevPageUrl == prevPageUrl)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_data),firstPageUrl,from,lastPage,lastPageUrl,nextPageUrl,path,perPage,prevPageUrl,to,total);

@override
String toString() {
  return 'VehicleLogPaginationData(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class _$VehicleLogPaginationDataCopyWith<$Res> implements $VehicleLogPaginationDataCopyWith<$Res> {
  factory _$VehicleLogPaginationDataCopyWith(_VehicleLogPaginationData value, $Res Function(_VehicleLogPaginationData) _then) = __$VehicleLogPaginationDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, List<VehicleLog> data,@JsonKey(name: 'first_page_url') String firstPageUrl, int from,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'last_page_url') String lastPageUrl,@JsonKey(name: 'next_page_url') String? nextPageUrl, String path,@JsonKey(name: 'per_page') int perPage,@JsonKey(name: 'prev_page_url') String? prevPageUrl, int to, int total
});




}
/// @nodoc
class __$VehicleLogPaginationDataCopyWithImpl<$Res>
    implements _$VehicleLogPaginationDataCopyWith<$Res> {
  __$VehicleLogPaginationDataCopyWithImpl(this._self, this._then);

  final _VehicleLogPaginationData _self;
  final $Res Function(_VehicleLogPaginationData) _then;

/// Create a copy of VehicleLogPaginationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? data = null,Object? firstPageUrl = null,Object? from = null,Object? lastPage = null,Object? lastPageUrl = null,Object? nextPageUrl = freezed,Object? path = null,Object? perPage = null,Object? prevPageUrl = freezed,Object? to = null,Object? total = null,}) {
  return _then(_VehicleLogPaginationData(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<VehicleLog>,firstPageUrl: null == firstPageUrl ? _self.firstPageUrl : firstPageUrl // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,lastPageUrl: null == lastPageUrl ? _self.lastPageUrl : lastPageUrl // ignore: cast_nullable_to_non_nullable
as String,nextPageUrl: freezed == nextPageUrl ? _self.nextPageUrl : nextPageUrl // ignore: cast_nullable_to_non_nullable
as String?,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,prevPageUrl: freezed == prevPageUrl ? _self.prevPageUrl : prevPageUrl // ignore: cast_nullable_to_non_nullable
as String?,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$VehicleLog {

 int get id;@JsonKey(name: 'license_plate') String get licensePlate; String get image; int get authorized;@JsonKey(name: 'vehicle_id') int get vehicleId;@JsonKey(name: 'camera_id') int get cameraId;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; Camera? get camera; Vehicle? get vehicle;
/// Create a copy of VehicleLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleLogCopyWith<VehicleLog> get copyWith => _$VehicleLogCopyWithImpl<VehicleLog>(this as VehicleLog, _$identity);

  /// Serializes this VehicleLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleLog&&(identical(other.id, id) || other.id == id)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.image, image) || other.image == image)&&(identical(other.authorized, authorized) || other.authorized == authorized)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.cameraId, cameraId) || other.cameraId == cameraId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.camera, camera) || other.camera == camera)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,licensePlate,image,authorized,vehicleId,cameraId,createdAt,updatedAt,camera,vehicle);

@override
String toString() {
  return 'VehicleLog(id: $id, licensePlate: $licensePlate, image: $image, authorized: $authorized, vehicleId: $vehicleId, cameraId: $cameraId, createdAt: $createdAt, updatedAt: $updatedAt, camera: $camera, vehicle: $vehicle)';
}


}

/// @nodoc
abstract mixin class $VehicleLogCopyWith<$Res>  {
  factory $VehicleLogCopyWith(VehicleLog value, $Res Function(VehicleLog) _then) = _$VehicleLogCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'license_plate') String licensePlate, String image, int authorized,@JsonKey(name: 'vehicle_id') int vehicleId,@JsonKey(name: 'camera_id') int cameraId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, Camera? camera, Vehicle? vehicle
});


$CameraCopyWith<$Res>? get camera;$VehicleCopyWith<$Res>? get vehicle;

}
/// @nodoc
class _$VehicleLogCopyWithImpl<$Res>
    implements $VehicleLogCopyWith<$Res> {
  _$VehicleLogCopyWithImpl(this._self, this._then);

  final VehicleLog _self;
  final $Res Function(VehicleLog) _then;

/// Create a copy of VehicleLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? licensePlate = null,Object? image = null,Object? authorized = null,Object? vehicleId = null,Object? cameraId = null,Object? createdAt = null,Object? updatedAt = null,Object? camera = freezed,Object? vehicle = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,licensePlate: null == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,authorized: null == authorized ? _self.authorized : authorized // ignore: cast_nullable_to_non_nullable
as int,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,cameraId: null == cameraId ? _self.cameraId : cameraId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,camera: freezed == camera ? _self.camera : camera // ignore: cast_nullable_to_non_nullable
as Camera?,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,
  ));
}
/// Create a copy of VehicleLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CameraCopyWith<$Res>? get camera {
    if (_self.camera == null) {
    return null;
  }

  return $CameraCopyWith<$Res>(_self.camera!, (value) {
    return _then(_self.copyWith(camera: value));
  });
}/// Create a copy of VehicleLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleCopyWith<$Res>? get vehicle {
    if (_self.vehicle == null) {
    return null;
  }

  return $VehicleCopyWith<$Res>(_self.vehicle!, (value) {
    return _then(_self.copyWith(vehicle: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehicleLog].
extension VehicleLogPatterns on VehicleLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleLog() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleLog value)  $default,){
final _that = this;
switch (_that) {
case _VehicleLog():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleLog value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleLog() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'license_plate')  String licensePlate,  String image,  int authorized, @JsonKey(name: 'vehicle_id')  int vehicleId, @JsonKey(name: 'camera_id')  int cameraId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  Camera? camera,  Vehicle? vehicle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleLog() when $default != null:
return $default(_that.id,_that.licensePlate,_that.image,_that.authorized,_that.vehicleId,_that.cameraId,_that.createdAt,_that.updatedAt,_that.camera,_that.vehicle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'license_plate')  String licensePlate,  String image,  int authorized, @JsonKey(name: 'vehicle_id')  int vehicleId, @JsonKey(name: 'camera_id')  int cameraId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  Camera? camera,  Vehicle? vehicle)  $default,) {final _that = this;
switch (_that) {
case _VehicleLog():
return $default(_that.id,_that.licensePlate,_that.image,_that.authorized,_that.vehicleId,_that.cameraId,_that.createdAt,_that.updatedAt,_that.camera,_that.vehicle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'license_plate')  String licensePlate,  String image,  int authorized, @JsonKey(name: 'vehicle_id')  int vehicleId, @JsonKey(name: 'camera_id')  int cameraId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  Camera? camera,  Vehicle? vehicle)?  $default,) {final _that = this;
switch (_that) {
case _VehicleLog() when $default != null:
return $default(_that.id,_that.licensePlate,_that.image,_that.authorized,_that.vehicleId,_that.cameraId,_that.createdAt,_that.updatedAt,_that.camera,_that.vehicle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleLog implements VehicleLog {
  const _VehicleLog({required this.id, @JsonKey(name: 'license_plate') required this.licensePlate, required this.image, required this.authorized, @JsonKey(name: 'vehicle_id') required this.vehicleId, @JsonKey(name: 'camera_id') required this.cameraId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.camera, required this.vehicle});
  factory _VehicleLog.fromJson(Map<String, dynamic> json) => _$VehicleLogFromJson(json);

@override final  int id;
@override@JsonKey(name: 'license_plate') final  String licensePlate;
@override final  String image;
@override final  int authorized;
@override@JsonKey(name: 'vehicle_id') final  int vehicleId;
@override@JsonKey(name: 'camera_id') final  int cameraId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  Camera? camera;
@override final  Vehicle? vehicle;

/// Create a copy of VehicleLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleLogCopyWith<_VehicleLog> get copyWith => __$VehicleLogCopyWithImpl<_VehicleLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleLog&&(identical(other.id, id) || other.id == id)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.image, image) || other.image == image)&&(identical(other.authorized, authorized) || other.authorized == authorized)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.cameraId, cameraId) || other.cameraId == cameraId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.camera, camera) || other.camera == camera)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,licensePlate,image,authorized,vehicleId,cameraId,createdAt,updatedAt,camera,vehicle);

@override
String toString() {
  return 'VehicleLog(id: $id, licensePlate: $licensePlate, image: $image, authorized: $authorized, vehicleId: $vehicleId, cameraId: $cameraId, createdAt: $createdAt, updatedAt: $updatedAt, camera: $camera, vehicle: $vehicle)';
}


}

/// @nodoc
abstract mixin class _$VehicleLogCopyWith<$Res> implements $VehicleLogCopyWith<$Res> {
  factory _$VehicleLogCopyWith(_VehicleLog value, $Res Function(_VehicleLog) _then) = __$VehicleLogCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'license_plate') String licensePlate, String image, int authorized,@JsonKey(name: 'vehicle_id') int vehicleId,@JsonKey(name: 'camera_id') int cameraId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, Camera? camera, Vehicle? vehicle
});


@override $CameraCopyWith<$Res>? get camera;@override $VehicleCopyWith<$Res>? get vehicle;

}
/// @nodoc
class __$VehicleLogCopyWithImpl<$Res>
    implements _$VehicleLogCopyWith<$Res> {
  __$VehicleLogCopyWithImpl(this._self, this._then);

  final _VehicleLog _self;
  final $Res Function(_VehicleLog) _then;

/// Create a copy of VehicleLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? licensePlate = null,Object? image = null,Object? authorized = null,Object? vehicleId = null,Object? cameraId = null,Object? createdAt = null,Object? updatedAt = null,Object? camera = freezed,Object? vehicle = freezed,}) {
  return _then(_VehicleLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,licensePlate: null == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,authorized: null == authorized ? _self.authorized : authorized // ignore: cast_nullable_to_non_nullable
as int,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,cameraId: null == cameraId ? _self.cameraId : cameraId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,camera: freezed == camera ? _self.camera : camera // ignore: cast_nullable_to_non_nullable
as Camera?,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,
  ));
}

/// Create a copy of VehicleLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CameraCopyWith<$Res>? get camera {
    if (_self.camera == null) {
    return null;
  }

  return $CameraCopyWith<$Res>(_self.camera!, (value) {
    return _then(_self.copyWith(camera: value));
  });
}/// Create a copy of VehicleLog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleCopyWith<$Res>? get vehicle {
    if (_self.vehicle == null) {
    return null;
  }

  return $VehicleCopyWith<$Res>(_self.vehicle!, (value) {
    return _then(_self.copyWith(vehicle: value));
  });
}
}


/// @nodoc
mixin _$Camera {

 int get id;@JsonKey(name: 'number_camera') int get numberCamera;@JsonKey(name: 'user_id') int get userId; String get location; String get status;@JsonKey(name: 'installation_date') String get installationDate; String get department;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Camera
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraCopyWith<Camera> get copyWith => _$CameraCopyWithImpl<Camera>(this as Camera, _$identity);

  /// Serializes this Camera to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Camera&&(identical(other.id, id) || other.id == id)&&(identical(other.numberCamera, numberCamera) || other.numberCamera == numberCamera)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.installationDate, installationDate) || other.installationDate == installationDate)&&(identical(other.department, department) || other.department == department)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numberCamera,userId,location,status,installationDate,department,createdAt,updatedAt);

@override
String toString() {
  return 'Camera(id: $id, numberCamera: $numberCamera, userId: $userId, location: $location, status: $status, installationDate: $installationDate, department: $department, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CameraCopyWith<$Res>  {
  factory $CameraCopyWith(Camera value, $Res Function(Camera) _then) = _$CameraCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'number_camera') int numberCamera,@JsonKey(name: 'user_id') int userId, String location, String status,@JsonKey(name: 'installation_date') String installationDate, String department,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$CameraCopyWithImpl<$Res>
    implements $CameraCopyWith<$Res> {
  _$CameraCopyWithImpl(this._self, this._then);

  final Camera _self;
  final $Res Function(Camera) _then;

/// Create a copy of Camera
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? numberCamera = null,Object? userId = null,Object? location = null,Object? status = null,Object? installationDate = null,Object? department = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,numberCamera: null == numberCamera ? _self.numberCamera : numberCamera // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,installationDate: null == installationDate ? _self.installationDate : installationDate // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Camera].
extension CameraPatterns on Camera {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Camera value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Camera() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Camera value)  $default,){
final _that = this;
switch (_that) {
case _Camera():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Camera value)?  $default,){
final _that = this;
switch (_that) {
case _Camera() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'number_camera')  int numberCamera, @JsonKey(name: 'user_id')  int userId,  String location,  String status, @JsonKey(name: 'installation_date')  String installationDate,  String department, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Camera() when $default != null:
return $default(_that.id,_that.numberCamera,_that.userId,_that.location,_that.status,_that.installationDate,_that.department,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'number_camera')  int numberCamera, @JsonKey(name: 'user_id')  int userId,  String location,  String status, @JsonKey(name: 'installation_date')  String installationDate,  String department, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Camera():
return $default(_that.id,_that.numberCamera,_that.userId,_that.location,_that.status,_that.installationDate,_that.department,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'number_camera')  int numberCamera, @JsonKey(name: 'user_id')  int userId,  String location,  String status, @JsonKey(name: 'installation_date')  String installationDate,  String department, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Camera() when $default != null:
return $default(_that.id,_that.numberCamera,_that.userId,_that.location,_that.status,_that.installationDate,_that.department,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Camera implements Camera {
  const _Camera({required this.id, @JsonKey(name: 'number_camera') required this.numberCamera, @JsonKey(name: 'user_id') required this.userId, required this.location, required this.status, @JsonKey(name: 'installation_date') required this.installationDate, required this.department, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _Camera.fromJson(Map<String, dynamic> json) => _$CameraFromJson(json);

@override final  int id;
@override@JsonKey(name: 'number_camera') final  int numberCamera;
@override@JsonKey(name: 'user_id') final  int userId;
@override final  String location;
@override final  String status;
@override@JsonKey(name: 'installation_date') final  String installationDate;
@override final  String department;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of Camera
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraCopyWith<_Camera> get copyWith => __$CameraCopyWithImpl<_Camera>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CameraToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Camera&&(identical(other.id, id) || other.id == id)&&(identical(other.numberCamera, numberCamera) || other.numberCamera == numberCamera)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.installationDate, installationDate) || other.installationDate == installationDate)&&(identical(other.department, department) || other.department == department)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numberCamera,userId,location,status,installationDate,department,createdAt,updatedAt);

@override
String toString() {
  return 'Camera(id: $id, numberCamera: $numberCamera, userId: $userId, location: $location, status: $status, installationDate: $installationDate, department: $department, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CameraCopyWith<$Res> implements $CameraCopyWith<$Res> {
  factory _$CameraCopyWith(_Camera value, $Res Function(_Camera) _then) = __$CameraCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'number_camera') int numberCamera,@JsonKey(name: 'user_id') int userId, String location, String status,@JsonKey(name: 'installation_date') String installationDate, String department,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$CameraCopyWithImpl<$Res>
    implements _$CameraCopyWith<$Res> {
  __$CameraCopyWithImpl(this._self, this._then);

  final _Camera _self;
  final $Res Function(_Camera) _then;

/// Create a copy of Camera
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? numberCamera = null,Object? userId = null,Object? location = null,Object? status = null,Object? installationDate = null,Object? department = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Camera(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,numberCamera: null == numberCamera ? _self.numberCamera : numberCamera // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,installationDate: null == installationDate ? _self.installationDate : installationDate // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Vehicle {

 int get id;@JsonKey(name: 'license_plate') String get licensePlate; int get authorized;@JsonKey(name: 'vehicle_type') String get vehicleType; String get image;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleCopyWith<Vehicle> get copyWith => _$VehicleCopyWithImpl<Vehicle>(this as Vehicle, _$identity);

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.authorized, authorized) || other.authorized == authorized)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,licensePlate,authorized,vehicleType,image,createdAt,updatedAt);

@override
String toString() {
  return 'Vehicle(id: $id, licensePlate: $licensePlate, authorized: $authorized, vehicleType: $vehicleType, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $VehicleCopyWith<$Res>  {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) _then) = _$VehicleCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'license_plate') String licensePlate, int authorized,@JsonKey(name: 'vehicle_type') String vehicleType, String image,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$VehicleCopyWithImpl<$Res>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._self, this._then);

  final Vehicle _self;
  final $Res Function(Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? licensePlate = null,Object? authorized = null,Object? vehicleType = null,Object? image = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,licensePlate: null == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String,authorized: null == authorized ? _self.authorized : authorized // ignore: cast_nullable_to_non_nullable
as int,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Vehicle].
extension VehiclePatterns on Vehicle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vehicle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vehicle value)  $default,){
final _that = this;
switch (_that) {
case _Vehicle():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vehicle value)?  $default,){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'license_plate')  String licensePlate,  int authorized, @JsonKey(name: 'vehicle_type')  String vehicleType,  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.licensePlate,_that.authorized,_that.vehicleType,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'license_plate')  String licensePlate,  int authorized, @JsonKey(name: 'vehicle_type')  String vehicleType,  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Vehicle():
return $default(_that.id,_that.licensePlate,_that.authorized,_that.vehicleType,_that.image,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'license_plate')  String licensePlate,  int authorized, @JsonKey(name: 'vehicle_type')  String vehicleType,  String image, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.licensePlate,_that.authorized,_that.vehicleType,_that.image,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vehicle implements Vehicle {
  const _Vehicle({required this.id, @JsonKey(name: 'license_plate') required this.licensePlate, required this.authorized, @JsonKey(name: 'vehicle_type') required this.vehicleType, required this.image, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

@override final  int id;
@override@JsonKey(name: 'license_plate') final  String licensePlate;
@override final  int authorized;
@override@JsonKey(name: 'vehicle_type') final  String vehicleType;
@override final  String image;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleCopyWith<_Vehicle> get copyWith => __$VehicleCopyWithImpl<_Vehicle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.authorized, authorized) || other.authorized == authorized)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,licensePlate,authorized,vehicleType,image,createdAt,updatedAt);

@override
String toString() {
  return 'Vehicle(id: $id, licensePlate: $licensePlate, authorized: $authorized, vehicleType: $vehicleType, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$VehicleCopyWith(_Vehicle value, $Res Function(_Vehicle) _then) = __$VehicleCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'license_plate') String licensePlate, int authorized,@JsonKey(name: 'vehicle_type') String vehicleType, String image,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$VehicleCopyWithImpl<$Res>
    implements _$VehicleCopyWith<$Res> {
  __$VehicleCopyWithImpl(this._self, this._then);

  final _Vehicle _self;
  final $Res Function(_Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? licensePlate = null,Object? authorized = null,Object? vehicleType = null,Object? image = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Vehicle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,licensePlate: null == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String,authorized: null == authorized ? _self.authorized : authorized // ignore: cast_nullable_to_non_nullable
as int,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
