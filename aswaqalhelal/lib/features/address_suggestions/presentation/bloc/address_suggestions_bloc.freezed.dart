// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address_suggestions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddressSuggestionsEvent<T, SP, AP> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T refAddress) initEdit,
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function(bool enabled) unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T refAddress)? initEdit,
    TResult? Function(String searchText, SP params)? searchRefAddress,
    TResult? Function(T params)? selectRefAddress,
    TResult? Function(bool enabled)? unSelectRefAddress,
    TResult? Function(AP params)? addRefAddress,
    TResult? Function()? disabel,
    TResult? Function()? enabel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T refAddress)? initEdit,
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function(bool enabled)? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitEdit<T, SP, AP> value) initEdit,
    required TResult Function(SearchRefAddress<T, SP, AP> value)
        searchRefAddress,
    required TResult Function(SelectRefAddress<T, SP, AP> value)
        selectRefAddress,
    required TResult Function(UnSelectRefAddress<T, SP, AP> value)
        unSelectRefAddress,
    required TResult Function(AddRefAddress<T, SP, AP> value) addRefAddress,
    required TResult Function(DisableAddressSuggestions<T, SP, AP> value)
        disabel,
    required TResult Function(EnableAddressSuggestions<T, SP, AP> value) enabel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult? Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult? Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult? Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult? Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult? Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult? Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressSuggestionsEventCopyWith<T, SP, AP, $Res> {
  factory $AddressSuggestionsEventCopyWith(
          AddressSuggestionsEvent<T, SP, AP> value,
          $Res Function(AddressSuggestionsEvent<T, SP, AP>) then) =
      _$AddressSuggestionsEventCopyWithImpl<T, SP, AP, $Res,
          AddressSuggestionsEvent<T, SP, AP>>;
}

/// @nodoc
class _$AddressSuggestionsEventCopyWithImpl<T, SP, AP, $Res,
        $Val extends AddressSuggestionsEvent<T, SP, AP>>
    implements $AddressSuggestionsEventCopyWith<T, SP, AP, $Res> {
  _$AddressSuggestionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitEditCopyWith<T, SP, AP, $Res> {
  factory _$$InitEditCopyWith(_$InitEdit<T, SP, AP> value,
          $Res Function(_$InitEdit<T, SP, AP>) then) =
      __$$InitEditCopyWithImpl<T, SP, AP, $Res>;
  @useResult
  $Res call({T refAddress});
}

/// @nodoc
class __$$InitEditCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestionsEventCopyWithImpl<T, SP, AP, $Res,
        _$InitEdit<T, SP, AP>> implements _$$InitEditCopyWith<T, SP, AP, $Res> {
  __$$InitEditCopyWithImpl(
      _$InitEdit<T, SP, AP> _value, $Res Function(_$InitEdit<T, SP, AP>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refAddress = null,
  }) {
    return _then(_$InitEdit<T, SP, AP>(
      null == refAddress
          ? _value.refAddress
          : refAddress // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InitEdit<T, SP, AP> implements InitEdit<T, SP, AP> {
  const _$InitEdit(this.refAddress);

  @override
  final T refAddress;

  @override
  String toString() {
    return 'AddressSuggestionsEvent<$T, $SP, $AP>.initEdit(refAddress: $refAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitEdit<T, SP, AP> &&
            const DeepCollectionEquality()
                .equals(other.refAddress, refAddress));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(refAddress));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitEditCopyWith<T, SP, AP, _$InitEdit<T, SP, AP>> get copyWith =>
      __$$InitEditCopyWithImpl<T, SP, AP, _$InitEdit<T, SP, AP>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T refAddress) initEdit,
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function(bool enabled) unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return initEdit(refAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T refAddress)? initEdit,
    TResult? Function(String searchText, SP params)? searchRefAddress,
    TResult? Function(T params)? selectRefAddress,
    TResult? Function(bool enabled)? unSelectRefAddress,
    TResult? Function(AP params)? addRefAddress,
    TResult? Function()? disabel,
    TResult? Function()? enabel,
  }) {
    return initEdit?.call(refAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T refAddress)? initEdit,
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function(bool enabled)? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
    required TResult orElse(),
  }) {
    if (initEdit != null) {
      return initEdit(refAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitEdit<T, SP, AP> value) initEdit,
    required TResult Function(SearchRefAddress<T, SP, AP> value)
        searchRefAddress,
    required TResult Function(SelectRefAddress<T, SP, AP> value)
        selectRefAddress,
    required TResult Function(UnSelectRefAddress<T, SP, AP> value)
        unSelectRefAddress,
    required TResult Function(AddRefAddress<T, SP, AP> value) addRefAddress,
    required TResult Function(DisableAddressSuggestions<T, SP, AP> value)
        disabel,
    required TResult Function(EnableAddressSuggestions<T, SP, AP> value) enabel,
  }) {
    return initEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult? Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult? Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult? Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult? Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult? Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult? Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return initEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
    required TResult orElse(),
  }) {
    if (initEdit != null) {
      return initEdit(this);
    }
    return orElse();
  }
}

abstract class InitEdit<T, SP, AP>
    implements AddressSuggestionsEvent<T, SP, AP> {
  const factory InitEdit(final T refAddress) = _$InitEdit<T, SP, AP>;

  T get refAddress;
  @JsonKey(ignore: true)
  _$$InitEditCopyWith<T, SP, AP, _$InitEdit<T, SP, AP>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchRefAddressCopyWith<T, SP, AP, $Res> {
  factory _$$SearchRefAddressCopyWith(_$SearchRefAddress<T, SP, AP> value,
          $Res Function(_$SearchRefAddress<T, SP, AP>) then) =
      __$$SearchRefAddressCopyWithImpl<T, SP, AP, $Res>;
  @useResult
  $Res call({String searchText, SP params});
}

/// @nodoc
class __$$SearchRefAddressCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestionsEventCopyWithImpl<T, SP, AP, $Res,
        _$SearchRefAddress<T, SP, AP>>
    implements _$$SearchRefAddressCopyWith<T, SP, AP, $Res> {
  __$$SearchRefAddressCopyWithImpl(_$SearchRefAddress<T, SP, AP> _value,
      $Res Function(_$SearchRefAddress<T, SP, AP>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? params = null,
  }) {
    return _then(_$SearchRefAddress<T, SP, AP>(
      null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as SP,
    ));
  }
}

/// @nodoc

class _$SearchRefAddress<T, SP, AP> implements SearchRefAddress<T, SP, AP> {
  const _$SearchRefAddress(this.searchText, this.params);

  @override
  final String searchText;
  @override
  final SP params;

  @override
  String toString() {
    return 'AddressSuggestionsEvent<$T, $SP, $AP>.searchRefAddress(searchText: $searchText, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRefAddress<T, SP, AP> &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, searchText, const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRefAddressCopyWith<T, SP, AP, _$SearchRefAddress<T, SP, AP>>
      get copyWith => __$$SearchRefAddressCopyWithImpl<T, SP, AP,
          _$SearchRefAddress<T, SP, AP>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T refAddress) initEdit,
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function(bool enabled) unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return searchRefAddress(searchText, params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T refAddress)? initEdit,
    TResult? Function(String searchText, SP params)? searchRefAddress,
    TResult? Function(T params)? selectRefAddress,
    TResult? Function(bool enabled)? unSelectRefAddress,
    TResult? Function(AP params)? addRefAddress,
    TResult? Function()? disabel,
    TResult? Function()? enabel,
  }) {
    return searchRefAddress?.call(searchText, params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T refAddress)? initEdit,
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function(bool enabled)? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
    required TResult orElse(),
  }) {
    if (searchRefAddress != null) {
      return searchRefAddress(searchText, params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitEdit<T, SP, AP> value) initEdit,
    required TResult Function(SearchRefAddress<T, SP, AP> value)
        searchRefAddress,
    required TResult Function(SelectRefAddress<T, SP, AP> value)
        selectRefAddress,
    required TResult Function(UnSelectRefAddress<T, SP, AP> value)
        unSelectRefAddress,
    required TResult Function(AddRefAddress<T, SP, AP> value) addRefAddress,
    required TResult Function(DisableAddressSuggestions<T, SP, AP> value)
        disabel,
    required TResult Function(EnableAddressSuggestions<T, SP, AP> value) enabel,
  }) {
    return searchRefAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult? Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult? Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult? Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult? Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult? Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult? Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return searchRefAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
    required TResult orElse(),
  }) {
    if (searchRefAddress != null) {
      return searchRefAddress(this);
    }
    return orElse();
  }
}

abstract class SearchRefAddress<T, SP, AP>
    implements AddressSuggestionsEvent<T, SP, AP> {
  const factory SearchRefAddress(final String searchText, final SP params) =
      _$SearchRefAddress<T, SP, AP>;

  String get searchText;
  SP get params;
  @JsonKey(ignore: true)
  _$$SearchRefAddressCopyWith<T, SP, AP, _$SearchRefAddress<T, SP, AP>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectRefAddressCopyWith<T, SP, AP, $Res> {
  factory _$$SelectRefAddressCopyWith(_$SelectRefAddress<T, SP, AP> value,
          $Res Function(_$SelectRefAddress<T, SP, AP>) then) =
      __$$SelectRefAddressCopyWithImpl<T, SP, AP, $Res>;
  @useResult
  $Res call({T params});
}

/// @nodoc
class __$$SelectRefAddressCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestionsEventCopyWithImpl<T, SP, AP, $Res,
        _$SelectRefAddress<T, SP, AP>>
    implements _$$SelectRefAddressCopyWith<T, SP, AP, $Res> {
  __$$SelectRefAddressCopyWithImpl(_$SelectRefAddress<T, SP, AP> _value,
      $Res Function(_$SelectRefAddress<T, SP, AP>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$SelectRefAddress<T, SP, AP>(
      null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SelectRefAddress<T, SP, AP> implements SelectRefAddress<T, SP, AP> {
  const _$SelectRefAddress(this.params);

  @override
  final T params;

  @override
  String toString() {
    return 'AddressSuggestionsEvent<$T, $SP, $AP>.selectRefAddress(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectRefAddress<T, SP, AP> &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectRefAddressCopyWith<T, SP, AP, _$SelectRefAddress<T, SP, AP>>
      get copyWith => __$$SelectRefAddressCopyWithImpl<T, SP, AP,
          _$SelectRefAddress<T, SP, AP>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T refAddress) initEdit,
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function(bool enabled) unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return selectRefAddress(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T refAddress)? initEdit,
    TResult? Function(String searchText, SP params)? searchRefAddress,
    TResult? Function(T params)? selectRefAddress,
    TResult? Function(bool enabled)? unSelectRefAddress,
    TResult? Function(AP params)? addRefAddress,
    TResult? Function()? disabel,
    TResult? Function()? enabel,
  }) {
    return selectRefAddress?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T refAddress)? initEdit,
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function(bool enabled)? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
    required TResult orElse(),
  }) {
    if (selectRefAddress != null) {
      return selectRefAddress(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitEdit<T, SP, AP> value) initEdit,
    required TResult Function(SearchRefAddress<T, SP, AP> value)
        searchRefAddress,
    required TResult Function(SelectRefAddress<T, SP, AP> value)
        selectRefAddress,
    required TResult Function(UnSelectRefAddress<T, SP, AP> value)
        unSelectRefAddress,
    required TResult Function(AddRefAddress<T, SP, AP> value) addRefAddress,
    required TResult Function(DisableAddressSuggestions<T, SP, AP> value)
        disabel,
    required TResult Function(EnableAddressSuggestions<T, SP, AP> value) enabel,
  }) {
    return selectRefAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult? Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult? Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult? Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult? Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult? Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult? Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return selectRefAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
    required TResult orElse(),
  }) {
    if (selectRefAddress != null) {
      return selectRefAddress(this);
    }
    return orElse();
  }
}

abstract class SelectRefAddress<T, SP, AP>
    implements AddressSuggestionsEvent<T, SP, AP> {
  const factory SelectRefAddress(final T params) =
      _$SelectRefAddress<T, SP, AP>;

  T get params;
  @JsonKey(ignore: true)
  _$$SelectRefAddressCopyWith<T, SP, AP, _$SelectRefAddress<T, SP, AP>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnSelectRefAddressCopyWith<T, SP, AP, $Res> {
  factory _$$UnSelectRefAddressCopyWith(_$UnSelectRefAddress<T, SP, AP> value,
          $Res Function(_$UnSelectRefAddress<T, SP, AP>) then) =
      __$$UnSelectRefAddressCopyWithImpl<T, SP, AP, $Res>;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class __$$UnSelectRefAddressCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestionsEventCopyWithImpl<T, SP, AP, $Res,
        _$UnSelectRefAddress<T, SP, AP>>
    implements _$$UnSelectRefAddressCopyWith<T, SP, AP, $Res> {
  __$$UnSelectRefAddressCopyWithImpl(_$UnSelectRefAddress<T, SP, AP> _value,
      $Res Function(_$UnSelectRefAddress<T, SP, AP>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(_$UnSelectRefAddress<T, SP, AP>(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UnSelectRefAddress<T, SP, AP> implements UnSelectRefAddress<T, SP, AP> {
  const _$UnSelectRefAddress({this.enabled = true});

  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'AddressSuggestionsEvent<$T, $SP, $AP>.unSelectRefAddress(enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnSelectRefAddress<T, SP, AP> &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnSelectRefAddressCopyWith<T, SP, AP, _$UnSelectRefAddress<T, SP, AP>>
      get copyWith => __$$UnSelectRefAddressCopyWithImpl<T, SP, AP,
          _$UnSelectRefAddress<T, SP, AP>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T refAddress) initEdit,
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function(bool enabled) unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return unSelectRefAddress(enabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T refAddress)? initEdit,
    TResult? Function(String searchText, SP params)? searchRefAddress,
    TResult? Function(T params)? selectRefAddress,
    TResult? Function(bool enabled)? unSelectRefAddress,
    TResult? Function(AP params)? addRefAddress,
    TResult? Function()? disabel,
    TResult? Function()? enabel,
  }) {
    return unSelectRefAddress?.call(enabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T refAddress)? initEdit,
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function(bool enabled)? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
    required TResult orElse(),
  }) {
    if (unSelectRefAddress != null) {
      return unSelectRefAddress(enabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitEdit<T, SP, AP> value) initEdit,
    required TResult Function(SearchRefAddress<T, SP, AP> value)
        searchRefAddress,
    required TResult Function(SelectRefAddress<T, SP, AP> value)
        selectRefAddress,
    required TResult Function(UnSelectRefAddress<T, SP, AP> value)
        unSelectRefAddress,
    required TResult Function(AddRefAddress<T, SP, AP> value) addRefAddress,
    required TResult Function(DisableAddressSuggestions<T, SP, AP> value)
        disabel,
    required TResult Function(EnableAddressSuggestions<T, SP, AP> value) enabel,
  }) {
    return unSelectRefAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult? Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult? Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult? Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult? Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult? Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult? Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return unSelectRefAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
    required TResult orElse(),
  }) {
    if (unSelectRefAddress != null) {
      return unSelectRefAddress(this);
    }
    return orElse();
  }
}

abstract class UnSelectRefAddress<T, SP, AP>
    implements AddressSuggestionsEvent<T, SP, AP> {
  const factory UnSelectRefAddress({final bool enabled}) =
      _$UnSelectRefAddress<T, SP, AP>;

  bool get enabled;
  @JsonKey(ignore: true)
  _$$UnSelectRefAddressCopyWith<T, SP, AP, _$UnSelectRefAddress<T, SP, AP>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddRefAddressCopyWith<T, SP, AP, $Res> {
  factory _$$AddRefAddressCopyWith(_$AddRefAddress<T, SP, AP> value,
          $Res Function(_$AddRefAddress<T, SP, AP>) then) =
      __$$AddRefAddressCopyWithImpl<T, SP, AP, $Res>;
  @useResult
  $Res call({AP params});
}

/// @nodoc
class __$$AddRefAddressCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestionsEventCopyWithImpl<T, SP, AP, $Res,
        _$AddRefAddress<T, SP, AP>>
    implements _$$AddRefAddressCopyWith<T, SP, AP, $Res> {
  __$$AddRefAddressCopyWithImpl(_$AddRefAddress<T, SP, AP> _value,
      $Res Function(_$AddRefAddress<T, SP, AP>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$AddRefAddress<T, SP, AP>(
      null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as AP,
    ));
  }
}

/// @nodoc

class _$AddRefAddress<T, SP, AP> implements AddRefAddress<T, SP, AP> {
  const _$AddRefAddress(this.params);

  @override
  final AP params;

  @override
  String toString() {
    return 'AddressSuggestionsEvent<$T, $SP, $AP>.addRefAddress(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddRefAddress<T, SP, AP> &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddRefAddressCopyWith<T, SP, AP, _$AddRefAddress<T, SP, AP>>
      get copyWith =>
          __$$AddRefAddressCopyWithImpl<T, SP, AP, _$AddRefAddress<T, SP, AP>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T refAddress) initEdit,
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function(bool enabled) unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return addRefAddress(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T refAddress)? initEdit,
    TResult? Function(String searchText, SP params)? searchRefAddress,
    TResult? Function(T params)? selectRefAddress,
    TResult? Function(bool enabled)? unSelectRefAddress,
    TResult? Function(AP params)? addRefAddress,
    TResult? Function()? disabel,
    TResult? Function()? enabel,
  }) {
    return addRefAddress?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T refAddress)? initEdit,
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function(bool enabled)? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
    required TResult orElse(),
  }) {
    if (addRefAddress != null) {
      return addRefAddress(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitEdit<T, SP, AP> value) initEdit,
    required TResult Function(SearchRefAddress<T, SP, AP> value)
        searchRefAddress,
    required TResult Function(SelectRefAddress<T, SP, AP> value)
        selectRefAddress,
    required TResult Function(UnSelectRefAddress<T, SP, AP> value)
        unSelectRefAddress,
    required TResult Function(AddRefAddress<T, SP, AP> value) addRefAddress,
    required TResult Function(DisableAddressSuggestions<T, SP, AP> value)
        disabel,
    required TResult Function(EnableAddressSuggestions<T, SP, AP> value) enabel,
  }) {
    return addRefAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult? Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult? Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult? Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult? Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult? Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult? Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return addRefAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
    required TResult orElse(),
  }) {
    if (addRefAddress != null) {
      return addRefAddress(this);
    }
    return orElse();
  }
}

abstract class AddRefAddress<T, SP, AP>
    implements AddressSuggestionsEvent<T, SP, AP> {
  const factory AddRefAddress(final AP params) = _$AddRefAddress<T, SP, AP>;

  AP get params;
  @JsonKey(ignore: true)
  _$$AddRefAddressCopyWith<T, SP, AP, _$AddRefAddress<T, SP, AP>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisableAddressSuggestionsCopyWith<T, SP, AP, $Res> {
  factory _$$DisableAddressSuggestionsCopyWith(
          _$DisableAddressSuggestions<T, SP, AP> value,
          $Res Function(_$DisableAddressSuggestions<T, SP, AP>) then) =
      __$$DisableAddressSuggestionsCopyWithImpl<T, SP, AP, $Res>;
}

/// @nodoc
class __$$DisableAddressSuggestionsCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestionsEventCopyWithImpl<T, SP, AP, $Res,
        _$DisableAddressSuggestions<T, SP, AP>>
    implements _$$DisableAddressSuggestionsCopyWith<T, SP, AP, $Res> {
  __$$DisableAddressSuggestionsCopyWithImpl(
      _$DisableAddressSuggestions<T, SP, AP> _value,
      $Res Function(_$DisableAddressSuggestions<T, SP, AP>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DisableAddressSuggestions<T, SP, AP>
    implements DisableAddressSuggestions<T, SP, AP> {
  const _$DisableAddressSuggestions();

  @override
  String toString() {
    return 'AddressSuggestionsEvent<$T, $SP, $AP>.disabel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisableAddressSuggestions<T, SP, AP>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T refAddress) initEdit,
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function(bool enabled) unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return disabel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T refAddress)? initEdit,
    TResult? Function(String searchText, SP params)? searchRefAddress,
    TResult? Function(T params)? selectRefAddress,
    TResult? Function(bool enabled)? unSelectRefAddress,
    TResult? Function(AP params)? addRefAddress,
    TResult? Function()? disabel,
    TResult? Function()? enabel,
  }) {
    return disabel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T refAddress)? initEdit,
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function(bool enabled)? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
    required TResult orElse(),
  }) {
    if (disabel != null) {
      return disabel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitEdit<T, SP, AP> value) initEdit,
    required TResult Function(SearchRefAddress<T, SP, AP> value)
        searchRefAddress,
    required TResult Function(SelectRefAddress<T, SP, AP> value)
        selectRefAddress,
    required TResult Function(UnSelectRefAddress<T, SP, AP> value)
        unSelectRefAddress,
    required TResult Function(AddRefAddress<T, SP, AP> value) addRefAddress,
    required TResult Function(DisableAddressSuggestions<T, SP, AP> value)
        disabel,
    required TResult Function(EnableAddressSuggestions<T, SP, AP> value) enabel,
  }) {
    return disabel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult? Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult? Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult? Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult? Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult? Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult? Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return disabel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
    required TResult orElse(),
  }) {
    if (disabel != null) {
      return disabel(this);
    }
    return orElse();
  }
}

abstract class DisableAddressSuggestions<T, SP, AP>
    implements AddressSuggestionsEvent<T, SP, AP> {
  const factory DisableAddressSuggestions() =
      _$DisableAddressSuggestions<T, SP, AP>;
}

/// @nodoc
abstract class _$$EnableAddressSuggestionsCopyWith<T, SP, AP, $Res> {
  factory _$$EnableAddressSuggestionsCopyWith(
          _$EnableAddressSuggestions<T, SP, AP> value,
          $Res Function(_$EnableAddressSuggestions<T, SP, AP>) then) =
      __$$EnableAddressSuggestionsCopyWithImpl<T, SP, AP, $Res>;
}

/// @nodoc
class __$$EnableAddressSuggestionsCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestionsEventCopyWithImpl<T, SP, AP, $Res,
        _$EnableAddressSuggestions<T, SP, AP>>
    implements _$$EnableAddressSuggestionsCopyWith<T, SP, AP, $Res> {
  __$$EnableAddressSuggestionsCopyWithImpl(
      _$EnableAddressSuggestions<T, SP, AP> _value,
      $Res Function(_$EnableAddressSuggestions<T, SP, AP>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EnableAddressSuggestions<T, SP, AP>
    implements EnableAddressSuggestions<T, SP, AP> {
  const _$EnableAddressSuggestions();

  @override
  String toString() {
    return 'AddressSuggestionsEvent<$T, $SP, $AP>.enabel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnableAddressSuggestions<T, SP, AP>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T refAddress) initEdit,
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function(bool enabled) unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return enabel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T refAddress)? initEdit,
    TResult? Function(String searchText, SP params)? searchRefAddress,
    TResult? Function(T params)? selectRefAddress,
    TResult? Function(bool enabled)? unSelectRefAddress,
    TResult? Function(AP params)? addRefAddress,
    TResult? Function()? disabel,
    TResult? Function()? enabel,
  }) {
    return enabel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T refAddress)? initEdit,
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function(bool enabled)? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
    required TResult orElse(),
  }) {
    if (enabel != null) {
      return enabel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitEdit<T, SP, AP> value) initEdit,
    required TResult Function(SearchRefAddress<T, SP, AP> value)
        searchRefAddress,
    required TResult Function(SelectRefAddress<T, SP, AP> value)
        selectRefAddress,
    required TResult Function(UnSelectRefAddress<T, SP, AP> value)
        unSelectRefAddress,
    required TResult Function(AddRefAddress<T, SP, AP> value) addRefAddress,
    required TResult Function(DisableAddressSuggestions<T, SP, AP> value)
        disabel,
    required TResult Function(EnableAddressSuggestions<T, SP, AP> value) enabel,
  }) {
    return enabel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult? Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult? Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult? Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult? Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult? Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult? Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return enabel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitEdit<T, SP, AP> value)? initEdit,
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
    required TResult orElse(),
  }) {
    if (enabel != null) {
      return enabel(this);
    }
    return orElse();
  }
}

abstract class EnableAddressSuggestions<T, SP, AP>
    implements AddressSuggestionsEvent<T, SP, AP> {
  const factory EnableAddressSuggestions() =
      _$EnableAddressSuggestions<T, SP, AP>;
}
