// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicles_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehiclesResponse {

 String get status; String get message; VehiclesData get data;
/// Create a copy of VehiclesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehiclesResponseCopyWith<VehiclesResponse> get copyWith => _$VehiclesResponseCopyWithImpl<VehiclesResponse>(this as VehiclesResponse, _$identity);

  /// Serializes this VehiclesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehiclesResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'VehiclesResponse(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $VehiclesResponseCopyWith<$Res>  {
  factory $VehiclesResponseCopyWith(VehiclesResponse value, $Res Function(VehiclesResponse) _then) = _$VehiclesResponseCopyWithImpl;
@useResult
$Res call({
 String status, String message, VehiclesData data
});


$VehiclesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$VehiclesResponseCopyWithImpl<$Res>
    implements $VehiclesResponseCopyWith<$Res> {
  _$VehiclesResponseCopyWithImpl(this._self, this._then);

  final VehiclesResponse _self;
  final $Res Function(VehiclesResponse) _then;

/// Create a copy of VehiclesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VehiclesData,
  ));
}
/// Create a copy of VehiclesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehiclesDataCopyWith<$Res> get data {
  
  return $VehiclesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehiclesResponse].
extension VehiclesResponsePatterns on VehiclesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehiclesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehiclesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehiclesResponse value)  $default,){
final _that = this;
switch (_that) {
case _VehiclesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehiclesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VehiclesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String message,  VehiclesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehiclesResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String message,  VehiclesData data)  $default,) {final _that = this;
switch (_that) {
case _VehiclesResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String message,  VehiclesData data)?  $default,) {final _that = this;
switch (_that) {
case _VehiclesResponse() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehiclesResponse implements VehiclesResponse {
  const _VehiclesResponse({required this.status, required this.message, required this.data});
  factory _VehiclesResponse.fromJson(Map<String, dynamic> json) => _$VehiclesResponseFromJson(json);

@override final  String status;
@override final  String message;
@override final  VehiclesData data;

/// Create a copy of VehiclesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehiclesResponseCopyWith<_VehiclesResponse> get copyWith => __$VehiclesResponseCopyWithImpl<_VehiclesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehiclesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehiclesResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data);

@override
String toString() {
  return 'VehiclesResponse(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VehiclesResponseCopyWith<$Res> implements $VehiclesResponseCopyWith<$Res> {
  factory _$VehiclesResponseCopyWith(_VehiclesResponse value, $Res Function(_VehiclesResponse) _then) = __$VehiclesResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, String message, VehiclesData data
});


@override $VehiclesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$VehiclesResponseCopyWithImpl<$Res>
    implements _$VehiclesResponseCopyWith<$Res> {
  __$VehiclesResponseCopyWithImpl(this._self, this._then);

  final _VehiclesResponse _self;
  final $Res Function(_VehiclesResponse) _then;

/// Create a copy of VehiclesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_VehiclesResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VehiclesData,
  ));
}

/// Create a copy of VehiclesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehiclesDataCopyWith<$Res> get data {
  
  return $VehiclesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VehiclesData {

@JsonKey(name: 'current_page') int get currentPage; List<Vehicle> get data;@JsonKey(name: 'first_page_url') String get firstPageUrl; int? get from;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'last_page_url') String get lastPageUrl;@JsonKey(name: 'next_page_url') String? get nextPageUrl; String get path;@JsonKey(name: 'per_page') int get perPage;@JsonKey(name: 'prev_page_url') String? get prevPageUrl; int? get to; int get total;
/// Create a copy of VehiclesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehiclesDataCopyWith<VehiclesData> get copyWith => _$VehiclesDataCopyWithImpl<VehiclesData>(this as VehiclesData, _$identity);

  /// Serializes this VehiclesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehiclesData&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.firstPageUrl, firstPageUrl) || other.firstPageUrl == firstPageUrl)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.lastPageUrl, lastPageUrl) || other.lastPageUrl == lastPageUrl)&&(identical(other.nextPageUrl, nextPageUrl) || other.nextPageUrl == nextPageUrl)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.prevPageUrl, prevPageUrl) || other.prevPageUrl == prevPageUrl)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(data),firstPageUrl,from,lastPage,lastPageUrl,nextPageUrl,path,perPage,prevPageUrl,to,total);

@override
String toString() {
  return 'VehiclesData(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class $VehiclesDataCopyWith<$Res>  {
  factory $VehiclesDataCopyWith(VehiclesData value, $Res Function(VehiclesData) _then) = _$VehiclesDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, List<Vehicle> data,@JsonKey(name: 'first_page_url') String firstPageUrl, int? from,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'last_page_url') String lastPageUrl,@JsonKey(name: 'next_page_url') String? nextPageUrl, String path,@JsonKey(name: 'per_page') int perPage,@JsonKey(name: 'prev_page_url') String? prevPageUrl, int? to, int total
});




}
/// @nodoc
class _$VehiclesDataCopyWithImpl<$Res>
    implements $VehiclesDataCopyWith<$Res> {
  _$VehiclesDataCopyWithImpl(this._self, this._then);

  final VehiclesData _self;
  final $Res Function(VehiclesData) _then;

/// Create a copy of VehiclesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? data = null,Object? firstPageUrl = null,Object? from = freezed,Object? lastPage = null,Object? lastPageUrl = null,Object? nextPageUrl = freezed,Object? path = null,Object? perPage = null,Object? prevPageUrl = freezed,Object? to = freezed,Object? total = null,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Vehicle>,firstPageUrl: null == firstPageUrl ? _self.firstPageUrl : firstPageUrl // ignore: cast_nullable_to_non_nullable
as String,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int?,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,lastPageUrl: null == lastPageUrl ? _self.lastPageUrl : lastPageUrl // ignore: cast_nullable_to_non_nullable
as String,nextPageUrl: freezed == nextPageUrl ? _self.nextPageUrl : nextPageUrl // ignore: cast_nullable_to_non_nullable
as String?,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,prevPageUrl: freezed == prevPageUrl ? _self.prevPageUrl : prevPageUrl // ignore: cast_nullable_to_non_nullable
as String?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VehiclesData].
extension VehiclesDataPatterns on VehiclesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehiclesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehiclesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehiclesData value)  $default,){
final _that = this;
switch (_that) {
case _VehiclesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehiclesData value)?  $default,){
final _that = this;
switch (_that) {
case _VehiclesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  List<Vehicle> data, @JsonKey(name: 'first_page_url')  String firstPageUrl,  int? from, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'last_page_url')  String lastPageUrl, @JsonKey(name: 'next_page_url')  String? nextPageUrl,  String path, @JsonKey(name: 'per_page')  int perPage, @JsonKey(name: 'prev_page_url')  String? prevPageUrl,  int? to,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehiclesData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  List<Vehicle> data, @JsonKey(name: 'first_page_url')  String firstPageUrl,  int? from, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'last_page_url')  String lastPageUrl, @JsonKey(name: 'next_page_url')  String? nextPageUrl,  String path, @JsonKey(name: 'per_page')  int perPage, @JsonKey(name: 'prev_page_url')  String? prevPageUrl,  int? to,  int total)  $default,) {final _that = this;
switch (_that) {
case _VehiclesData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage,  List<Vehicle> data, @JsonKey(name: 'first_page_url')  String firstPageUrl,  int? from, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'last_page_url')  String lastPageUrl, @JsonKey(name: 'next_page_url')  String? nextPageUrl,  String path, @JsonKey(name: 'per_page')  int perPage, @JsonKey(name: 'prev_page_url')  String? prevPageUrl,  int? to,  int total)?  $default,) {final _that = this;
switch (_that) {
case _VehiclesData() when $default != null:
return $default(_that.currentPage,_that.data,_that.firstPageUrl,_that.from,_that.lastPage,_that.lastPageUrl,_that.nextPageUrl,_that.path,_that.perPage,_that.prevPageUrl,_that.to,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehiclesData implements VehiclesData {
  const _VehiclesData({@JsonKey(name: 'current_page') required this.currentPage, required final  List<Vehicle> data, @JsonKey(name: 'first_page_url') required this.firstPageUrl, this.from, @JsonKey(name: 'last_page') required this.lastPage, @JsonKey(name: 'last_page_url') required this.lastPageUrl, @JsonKey(name: 'next_page_url') this.nextPageUrl, required this.path, @JsonKey(name: 'per_page') required this.perPage, @JsonKey(name: 'prev_page_url') this.prevPageUrl, this.to, required this.total}): _data = data;
  factory _VehiclesData.fromJson(Map<String, dynamic> json) => _$VehiclesDataFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<Vehicle> _data;
@override List<Vehicle> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'first_page_url') final  String firstPageUrl;
@override final  int? from;
@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'last_page_url') final  String lastPageUrl;
@override@JsonKey(name: 'next_page_url') final  String? nextPageUrl;
@override final  String path;
@override@JsonKey(name: 'per_page') final  int perPage;
@override@JsonKey(name: 'prev_page_url') final  String? prevPageUrl;
@override final  int? to;
@override final  int total;

/// Create a copy of VehiclesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehiclesDataCopyWith<_VehiclesData> get copyWith => __$VehiclesDataCopyWithImpl<_VehiclesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehiclesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehiclesData&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.firstPageUrl, firstPageUrl) || other.firstPageUrl == firstPageUrl)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.lastPageUrl, lastPageUrl) || other.lastPageUrl == lastPageUrl)&&(identical(other.nextPageUrl, nextPageUrl) || other.nextPageUrl == nextPageUrl)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.prevPageUrl, prevPageUrl) || other.prevPageUrl == prevPageUrl)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_data),firstPageUrl,from,lastPage,lastPageUrl,nextPageUrl,path,perPage,prevPageUrl,to,total);

@override
String toString() {
  return 'VehiclesData(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class _$VehiclesDataCopyWith<$Res> implements $VehiclesDataCopyWith<$Res> {
  factory _$VehiclesDataCopyWith(_VehiclesData value, $Res Function(_VehiclesData) _then) = __$VehiclesDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, List<Vehicle> data,@JsonKey(name: 'first_page_url') String firstPageUrl, int? from,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'last_page_url') String lastPageUrl,@JsonKey(name: 'next_page_url') String? nextPageUrl, String path,@JsonKey(name: 'per_page') int perPage,@JsonKey(name: 'prev_page_url') String? prevPageUrl, int? to, int total
});




}
/// @nodoc
class __$VehiclesDataCopyWithImpl<$Res>
    implements _$VehiclesDataCopyWith<$Res> {
  __$VehiclesDataCopyWithImpl(this._self, this._then);

  final _VehiclesData _self;
  final $Res Function(_VehiclesData) _then;

/// Create a copy of VehiclesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? data = null,Object? firstPageUrl = null,Object? from = freezed,Object? lastPage = null,Object? lastPageUrl = null,Object? nextPageUrl = freezed,Object? path = null,Object? perPage = null,Object? prevPageUrl = freezed,Object? to = freezed,Object? total = null,}) {
  return _then(_VehiclesData(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Vehicle>,firstPageUrl: null == firstPageUrl ? _self.firstPageUrl : firstPageUrl // ignore: cast_nullable_to_non_nullable
as String,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int?,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,lastPageUrl: null == lastPageUrl ? _self.lastPageUrl : lastPageUrl // ignore: cast_nullable_to_non_nullable
as String,nextPageUrl: freezed == nextPageUrl ? _self.nextPageUrl : nextPageUrl // ignore: cast_nullable_to_non_nullable
as String?,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,prevPageUrl: freezed == prevPageUrl ? _self.prevPageUrl : prevPageUrl // ignore: cast_nullable_to_non_nullable
as String?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
