// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'institution_cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InstitutionCartState {
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstitutionCartStateCopyWith<InstitutionCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionCartStateCopyWith<$Res> {
  factory $InstitutionCartStateCopyWith(InstitutionCartState value,
          $Res Function(InstitutionCartState) then) =
      _$InstitutionCartStateCopyWithImpl<$Res>;
  $Res call({List<CartItem> cartItems, double totalPrice});
}

/// @nodoc
class _$InstitutionCartStateCopyWithImpl<$Res>
    implements $InstitutionCartStateCopyWith<$Res> {
  _$InstitutionCartStateCopyWithImpl(this._value, this._then);

  final InstitutionCartState _value;
  // ignore: unused_field
  final $Res Function(InstitutionCartState) _then;

  @override
  $Res call({
    Object? cartItems = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_value.copyWith(
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_InstitutionCartStateCopyWith<$Res>
    implements $InstitutionCartStateCopyWith<$Res> {
  factory _$$_InstitutionCartStateCopyWith(_$_InstitutionCartState value,
          $Res Function(_$_InstitutionCartState) then) =
      __$$_InstitutionCartStateCopyWithImpl<$Res>;
  @override
  $Res call({List<CartItem> cartItems, double totalPrice});
}

/// @nodoc
class __$$_InstitutionCartStateCopyWithImpl<$Res>
    extends _$InstitutionCartStateCopyWithImpl<$Res>
    implements _$$_InstitutionCartStateCopyWith<$Res> {
  __$$_InstitutionCartStateCopyWithImpl(_$_InstitutionCartState _value,
      $Res Function(_$_InstitutionCartState) _then)
      : super(_value, (v) => _then(v as _$_InstitutionCartState));

  @override
  _$_InstitutionCartState get _value => super._value as _$_InstitutionCartState;

  @override
  $Res call({
    Object? cartItems = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_$_InstitutionCartState(
      cartItems: cartItems == freezed
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_InstitutionCartState implements _InstitutionCartState {
  _$_InstitutionCartState(
      {final List<CartItem> cartItems = const [], this.totalPrice = 0})
      : _cartItems = cartItems;

  final List<CartItem> _cartItems;
  @override
  @JsonKey()
  List<CartItem> get cartItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  @JsonKey()
  final double totalPrice;

  @override
  String toString() {
    return 'InstitutionCartState(cartItems: $cartItems, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InstitutionCartState &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItems),
      const DeepCollectionEquality().hash(totalPrice));

  @JsonKey(ignore: true)
  @override
  _$$_InstitutionCartStateCopyWith<_$_InstitutionCartState> get copyWith =>
      __$$_InstitutionCartStateCopyWithImpl<_$_InstitutionCartState>(
          this, _$identity);
}

abstract class _InstitutionCartState implements InstitutionCartState {
  factory _InstitutionCartState(
      {final List<CartItem> cartItems,
      final double totalPrice}) = _$_InstitutionCartState;

  @override
  List<CartItem> get cartItems;
  @override
  double get totalPrice;
  @override
  @JsonKey(ignore: true)
  _$$_InstitutionCartStateCopyWith<_$_InstitutionCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
