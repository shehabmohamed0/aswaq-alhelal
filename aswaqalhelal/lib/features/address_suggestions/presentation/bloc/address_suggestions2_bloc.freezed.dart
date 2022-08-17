// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address_suggestions2_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddressSuggestions2Event<T, SP, AP> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function() unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
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
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
abstract class $AddressSuggestions2EventCopyWith<T, SP, AP, $Res> {
  factory $AddressSuggestions2EventCopyWith(
          AddressSuggestions2Event<T, SP, AP> value,
          $Res Function(AddressSuggestions2Event<T, SP, AP>) then) =
      _$AddressSuggestions2EventCopyWithImpl<T, SP, AP, $Res>;
}

/// @nodoc
class _$AddressSuggestions2EventCopyWithImpl<T, SP, AP, $Res>
    implements $AddressSuggestions2EventCopyWith<T, SP, AP, $Res> {
  _$AddressSuggestions2EventCopyWithImpl(this._value, this._then);

  final AddressSuggestions2Event<T, SP, AP> _value;
  // ignore: unused_field
  final $Res Function(AddressSuggestions2Event<T, SP, AP>) _then;
}

/// @nodoc
abstract class _$$SearchRefAddressCopyWith<T, SP, AP, $Res> {
  factory _$$SearchRefAddressCopyWith(_$SearchRefAddress<T, SP, AP> value,
          $Res Function(_$SearchRefAddress<T, SP, AP>) then) =
      __$$SearchRefAddressCopyWithImpl<T, SP, AP, $Res>;
  $Res call({String searchText, SP params});
}

/// @nodoc
class __$$SearchRefAddressCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestions2EventCopyWithImpl<T, SP, AP, $Res>
    implements _$$SearchRefAddressCopyWith<T, SP, AP, $Res> {
  __$$SearchRefAddressCopyWithImpl(_$SearchRefAddress<T, SP, AP> _value,
      $Res Function(_$SearchRefAddress<T, SP, AP>) _then)
      : super(_value, (v) => _then(v as _$SearchRefAddress<T, SP, AP>));

  @override
  _$SearchRefAddress<T, SP, AP> get _value =>
      super._value as _$SearchRefAddress<T, SP, AP>;

  @override
  $Res call({
    Object? searchText = freezed,
    Object? params = freezed,
  }) {
    return _then(_$SearchRefAddress<T, SP, AP>(
      searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      params == freezed
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
    return 'AddressSuggestions2Event<$T, $SP, $AP>.searchRefAddress(searchText: $searchText, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRefAddress<T, SP, AP> &&
            const DeepCollectionEquality()
                .equals(other.searchText, searchText) &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(searchText),
      const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  _$$SearchRefAddressCopyWith<T, SP, AP, _$SearchRefAddress<T, SP, AP>>
      get copyWith => __$$SearchRefAddressCopyWithImpl<T, SP, AP,
          _$SearchRefAddress<T, SP, AP>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function() unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return searchRefAddress(searchText, params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
  }) {
    return searchRefAddress?.call(searchText, params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
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
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return searchRefAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
    implements AddressSuggestions2Event<T, SP, AP> {
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
  $Res call({T params});
}

/// @nodoc
class __$$SelectRefAddressCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestions2EventCopyWithImpl<T, SP, AP, $Res>
    implements _$$SelectRefAddressCopyWith<T, SP, AP, $Res> {
  __$$SelectRefAddressCopyWithImpl(_$SelectRefAddress<T, SP, AP> _value,
      $Res Function(_$SelectRefAddress<T, SP, AP>) _then)
      : super(_value, (v) => _then(v as _$SelectRefAddress<T, SP, AP>));

  @override
  _$SelectRefAddress<T, SP, AP> get _value =>
      super._value as _$SelectRefAddress<T, SP, AP>;

  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_$SelectRefAddress<T, SP, AP>(
      params == freezed
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
    return 'AddressSuggestions2Event<$T, $SP, $AP>.selectRefAddress(params: $params)';
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
  _$$SelectRefAddressCopyWith<T, SP, AP, _$SelectRefAddress<T, SP, AP>>
      get copyWith => __$$SelectRefAddressCopyWithImpl<T, SP, AP,
          _$SelectRefAddress<T, SP, AP>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function() unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return selectRefAddress(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
  }) {
    return selectRefAddress?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
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
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return selectRefAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
    implements AddressSuggestions2Event<T, SP, AP> {
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
}

/// @nodoc
class __$$UnSelectRefAddressCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestions2EventCopyWithImpl<T, SP, AP, $Res>
    implements _$$UnSelectRefAddressCopyWith<T, SP, AP, $Res> {
  __$$UnSelectRefAddressCopyWithImpl(_$UnSelectRefAddress<T, SP, AP> _value,
      $Res Function(_$UnSelectRefAddress<T, SP, AP>) _then)
      : super(_value, (v) => _then(v as _$UnSelectRefAddress<T, SP, AP>));

  @override
  _$UnSelectRefAddress<T, SP, AP> get _value =>
      super._value as _$UnSelectRefAddress<T, SP, AP>;
}

/// @nodoc

class _$UnSelectRefAddress<T, SP, AP> implements UnSelectRefAddress<T, SP, AP> {
  const _$UnSelectRefAddress();

  @override
  String toString() {
    return 'AddressSuggestions2Event<$T, $SP, $AP>.unSelectRefAddress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnSelectRefAddress<T, SP, AP>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function() unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return unSelectRefAddress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
  }) {
    return unSelectRefAddress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
    required TResult orElse(),
  }) {
    if (unSelectRefAddress != null) {
      return unSelectRefAddress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
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
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return unSelectRefAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
    implements AddressSuggestions2Event<T, SP, AP> {
  const factory UnSelectRefAddress() = _$UnSelectRefAddress<T, SP, AP>;
}

/// @nodoc
abstract class _$$AddRefAddressCopyWith<T, SP, AP, $Res> {
  factory _$$AddRefAddressCopyWith(_$AddRefAddress<T, SP, AP> value,
          $Res Function(_$AddRefAddress<T, SP, AP>) then) =
      __$$AddRefAddressCopyWithImpl<T, SP, AP, $Res>;
  $Res call({AP params});
}

/// @nodoc
class __$$AddRefAddressCopyWithImpl<T, SP, AP, $Res>
    extends _$AddressSuggestions2EventCopyWithImpl<T, SP, AP, $Res>
    implements _$$AddRefAddressCopyWith<T, SP, AP, $Res> {
  __$$AddRefAddressCopyWithImpl(_$AddRefAddress<T, SP, AP> _value,
      $Res Function(_$AddRefAddress<T, SP, AP>) _then)
      : super(_value, (v) => _then(v as _$AddRefAddress<T, SP, AP>));

  @override
  _$AddRefAddress<T, SP, AP> get _value =>
      super._value as _$AddRefAddress<T, SP, AP>;

  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_$AddRefAddress<T, SP, AP>(
      params == freezed
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
    return 'AddressSuggestions2Event<$T, $SP, $AP>.addRefAddress(params: $params)';
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
  _$$AddRefAddressCopyWith<T, SP, AP, _$AddRefAddress<T, SP, AP>>
      get copyWith =>
          __$$AddRefAddressCopyWithImpl<T, SP, AP, _$AddRefAddress<T, SP, AP>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function() unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return addRefAddress(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
  }) {
    return addRefAddress?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
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
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return addRefAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
    implements AddressSuggestions2Event<T, SP, AP> {
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
    extends _$AddressSuggestions2EventCopyWithImpl<T, SP, AP, $Res>
    implements _$$DisableAddressSuggestionsCopyWith<T, SP, AP, $Res> {
  __$$DisableAddressSuggestionsCopyWithImpl(
      _$DisableAddressSuggestions<T, SP, AP> _value,
      $Res Function(_$DisableAddressSuggestions<T, SP, AP>) _then)
      : super(
            _value, (v) => _then(v as _$DisableAddressSuggestions<T, SP, AP>));

  @override
  _$DisableAddressSuggestions<T, SP, AP> get _value =>
      super._value as _$DisableAddressSuggestions<T, SP, AP>;
}

/// @nodoc

class _$DisableAddressSuggestions<T, SP, AP>
    implements DisableAddressSuggestions<T, SP, AP> {
  const _$DisableAddressSuggestions();

  @override
  String toString() {
    return 'AddressSuggestions2Event<$T, $SP, $AP>.disabel()';
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
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function() unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return disabel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
  }) {
    return disabel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
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
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return disabel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
    implements AddressSuggestions2Event<T, SP, AP> {
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
    extends _$AddressSuggestions2EventCopyWithImpl<T, SP, AP, $Res>
    implements _$$EnableAddressSuggestionsCopyWith<T, SP, AP, $Res> {
  __$$EnableAddressSuggestionsCopyWithImpl(
      _$EnableAddressSuggestions<T, SP, AP> _value,
      $Res Function(_$EnableAddressSuggestions<T, SP, AP>) _then)
      : super(_value, (v) => _then(v as _$EnableAddressSuggestions<T, SP, AP>));

  @override
  _$EnableAddressSuggestions<T, SP, AP> get _value =>
      super._value as _$EnableAddressSuggestions<T, SP, AP>;
}

/// @nodoc

class _$EnableAddressSuggestions<T, SP, AP>
    implements EnableAddressSuggestions<T, SP, AP> {
  const _$EnableAddressSuggestions();

  @override
  String toString() {
    return 'AddressSuggestions2Event<$T, $SP, $AP>.enabel()';
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
    required TResult Function(String searchText, SP params) searchRefAddress,
    required TResult Function(T params) selectRefAddress,
    required TResult Function() unSelectRefAddress,
    required TResult Function(AP params) addRefAddress,
    required TResult Function() disabel,
    required TResult Function() enabel,
  }) {
    return enabel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
    TResult Function(AP params)? addRefAddress,
    TResult Function()? disabel,
    TResult Function()? enabel,
  }) {
    return enabel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText, SP params)? searchRefAddress,
    TResult Function(T params)? selectRefAddress,
    TResult Function()? unSelectRefAddress,
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
    TResult Function(SearchRefAddress<T, SP, AP> value)? searchRefAddress,
    TResult Function(SelectRefAddress<T, SP, AP> value)? selectRefAddress,
    TResult Function(UnSelectRefAddress<T, SP, AP> value)? unSelectRefAddress,
    TResult Function(AddRefAddress<T, SP, AP> value)? addRefAddress,
    TResult Function(DisableAddressSuggestions<T, SP, AP> value)? disabel,
    TResult Function(EnableAddressSuggestions<T, SP, AP> value)? enabel,
  }) {
    return enabel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
    implements AddressSuggestions2Event<T, SP, AP> {
  const factory EnableAddressSuggestions() =
      _$EnableAddressSuggestions<T, SP, AP>;
}

/// @nodoc
mixin _$AddressSuggestions2State<T extends RefAddress> {
  String get addressSearch => throw _privateConstructorUsedError;
  List<T> get suggestions => throw _privateConstructorUsedError;
  AutoSuggestionState get suggestionState => throw _privateConstructorUsedError;
  Option<T> get addressOrNull => throw _privateConstructorUsedError;
  AddressSuggestionsStatus get status => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressSuggestions2StateCopyWith<T, AddressSuggestions2State<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressSuggestions2StateCopyWith<T extends RefAddress, $Res> {
  factory $AddressSuggestions2StateCopyWith(AddressSuggestions2State<T> value,
          $Res Function(AddressSuggestions2State<T>) then) =
      _$AddressSuggestions2StateCopyWithImpl<T, $Res>;
  $Res call(
      {String addressSearch,
      List<T> suggestions,
      AutoSuggestionState suggestionState,
      Option<T> addressOrNull,
      AddressSuggestionsStatus status,
      bool enabled,
      String? errorMessage});
}

/// @nodoc
class _$AddressSuggestions2StateCopyWithImpl<T extends RefAddress, $Res>
    implements $AddressSuggestions2StateCopyWith<T, $Res> {
  _$AddressSuggestions2StateCopyWithImpl(this._value, this._then);

  final AddressSuggestions2State<T> _value;
  // ignore: unused_field
  final $Res Function(AddressSuggestions2State<T>) _then;

  @override
  $Res call({
    Object? addressSearch = freezed,
    Object? suggestions = freezed,
    Object? suggestionState = freezed,
    Object? addressOrNull = freezed,
    Object? status = freezed,
    Object? enabled = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      addressSearch: addressSearch == freezed
          ? _value.addressSearch
          : addressSearch // ignore: cast_nullable_to_non_nullable
              as String,
      suggestions: suggestions == freezed
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<T>,
      suggestionState: suggestionState == freezed
          ? _value.suggestionState
          : suggestionState // ignore: cast_nullable_to_non_nullable
              as AutoSuggestionState,
      addressOrNull: addressOrNull == freezed
          ? _value.addressOrNull
          : addressOrNull // ignore: cast_nullable_to_non_nullable
              as Option<T>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AddressSuggestionsStatus,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddressSuggestionsStateCopyWith<T extends RefAddress, $Res>
    implements $AddressSuggestions2StateCopyWith<T, $Res> {
  factory _$$_AddressSuggestionsStateCopyWith(
          _$_AddressSuggestionsState<T> value,
          $Res Function(_$_AddressSuggestionsState<T>) then) =
      __$$_AddressSuggestionsStateCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {String addressSearch,
      List<T> suggestions,
      AutoSuggestionState suggestionState,
      Option<T> addressOrNull,
      AddressSuggestionsStatus status,
      bool enabled,
      String? errorMessage});
}

/// @nodoc
class __$$_AddressSuggestionsStateCopyWithImpl<T extends RefAddress, $Res>
    extends _$AddressSuggestions2StateCopyWithImpl<T, $Res>
    implements _$$_AddressSuggestionsStateCopyWith<T, $Res> {
  __$$_AddressSuggestionsStateCopyWithImpl(_$_AddressSuggestionsState<T> _value,
      $Res Function(_$_AddressSuggestionsState<T>) _then)
      : super(_value, (v) => _then(v as _$_AddressSuggestionsState<T>));

  @override
  _$_AddressSuggestionsState<T> get _value =>
      super._value as _$_AddressSuggestionsState<T>;

  @override
  $Res call({
    Object? addressSearch = freezed,
    Object? suggestions = freezed,
    Object? suggestionState = freezed,
    Object? addressOrNull = freezed,
    Object? status = freezed,
    Object? enabled = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AddressSuggestionsState<T>(
      addressSearch: addressSearch == freezed
          ? _value.addressSearch
          : addressSearch // ignore: cast_nullable_to_non_nullable
              as String,
      suggestions: suggestions == freezed
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<T>,
      suggestionState: suggestionState == freezed
          ? _value.suggestionState
          : suggestionState // ignore: cast_nullable_to_non_nullable
              as AutoSuggestionState,
      addressOrNull: addressOrNull == freezed
          ? _value.addressOrNull
          : addressOrNull // ignore: cast_nullable_to_non_nullable
              as Option<T>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AddressSuggestionsStatus,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AddressSuggestionsState<T extends RefAddress>
    implements _AddressSuggestionsState<T> {
  const _$_AddressSuggestionsState(
      {this.addressSearch = '',
      final List<T> suggestions = const [],
      this.suggestionState = AutoSuggestionState.emptyText,
      this.addressOrNull = const None(),
      this.status = AddressSuggestionsStatus.initial,
      this.enabled = false,
      this.errorMessage})
      : _suggestions = suggestions;

  @override
  @JsonKey()
  final String addressSearch;
  final List<T> _suggestions;
  @override
  @JsonKey()
  List<T> get suggestions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  @JsonKey()
  final AutoSuggestionState suggestionState;
  @override
  @JsonKey()
  final Option<T> addressOrNull;
  @override
  @JsonKey()
  final AddressSuggestionsStatus status;
  @override
  @JsonKey()
  final bool enabled;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AddressSuggestions2State<$T>(addressSearch: $addressSearch, suggestions: $suggestions, suggestionState: $suggestionState, addressOrNull: $addressOrNull, status: $status, enabled: $enabled, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressSuggestionsState<T> &&
            const DeepCollectionEquality()
                .equals(other.addressSearch, addressSearch) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            const DeepCollectionEquality()
                .equals(other.suggestionState, suggestionState) &&
            const DeepCollectionEquality()
                .equals(other.addressOrNull, addressOrNull) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.enabled, enabled) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(addressSearch),
      const DeepCollectionEquality().hash(_suggestions),
      const DeepCollectionEquality().hash(suggestionState),
      const DeepCollectionEquality().hash(addressOrNull),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(enabled),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_AddressSuggestionsStateCopyWith<T, _$_AddressSuggestionsState<T>>
      get copyWith => __$$_AddressSuggestionsStateCopyWithImpl<T,
          _$_AddressSuggestionsState<T>>(this, _$identity);
}

abstract class _AddressSuggestionsState<T extends RefAddress>
    implements AddressSuggestions2State<T> {
  const factory _AddressSuggestionsState(
      {final String addressSearch,
      final List<T> suggestions,
      final AutoSuggestionState suggestionState,
      final Option<T> addressOrNull,
      final AddressSuggestionsStatus status,
      final bool enabled,
      final String? errorMessage}) = _$_AddressSuggestionsState<T>;

  @override
  String get addressSearch;
  @override
  List<T> get suggestions;
  @override
  AutoSuggestionState get suggestionState;
  @override
  Option<T> get addressOrNull;
  @override
  AddressSuggestionsStatus get status;
  @override
  bool get enabled;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AddressSuggestionsStateCopyWith<T, _$_AddressSuggestionsState<T>>
      get copyWith => throw _privateConstructorUsedError;
}
