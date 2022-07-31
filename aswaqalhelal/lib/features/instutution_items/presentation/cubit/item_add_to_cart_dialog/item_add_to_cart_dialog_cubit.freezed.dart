// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_add_to_cart_dialog_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemAddToCartDialogState {
  Unit? get selectedUnit => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  bool get cartSubmitted => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemAddToCartDialogStateCopyWith<ItemAddToCartDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemAddToCartDialogStateCopyWith<$Res> {
  factory $ItemAddToCartDialogStateCopyWith(ItemAddToCartDialogState value,
          $Res Function(ItemAddToCartDialogState) then) =
      _$ItemAddToCartDialogStateCopyWithImpl<$Res>;
  $Res call(
      {Unit? selectedUnit,
      double totalPrice,
      bool cartSubmitted,
      int quantity});
}

/// @nodoc
class _$ItemAddToCartDialogStateCopyWithImpl<$Res>
    implements $ItemAddToCartDialogStateCopyWith<$Res> {
  _$ItemAddToCartDialogStateCopyWithImpl(this._value, this._then);

  final ItemAddToCartDialogState _value;
  // ignore: unused_field
  final $Res Function(ItemAddToCartDialogState) _then;

  @override
  $Res call({
    Object? selectedUnit = freezed,
    Object? totalPrice = freezed,
    Object? cartSubmitted = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      selectedUnit: selectedUnit == freezed
          ? _value.selectedUnit
          : selectedUnit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      cartSubmitted: cartSubmitted == freezed
          ? _value.cartSubmitted
          : cartSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemAddToCartDialogStateCopyWith<$Res>
    implements $ItemAddToCartDialogStateCopyWith<$Res> {
  factory _$$_ItemAddToCartDialogStateCopyWith(
          _$_ItemAddToCartDialogState value,
          $Res Function(_$_ItemAddToCartDialogState) then) =
      __$$_ItemAddToCartDialogStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Unit? selectedUnit,
      double totalPrice,
      bool cartSubmitted,
      int quantity});
}

/// @nodoc
class __$$_ItemAddToCartDialogStateCopyWithImpl<$Res>
    extends _$ItemAddToCartDialogStateCopyWithImpl<$Res>
    implements _$$_ItemAddToCartDialogStateCopyWith<$Res> {
  __$$_ItemAddToCartDialogStateCopyWithImpl(_$_ItemAddToCartDialogState _value,
      $Res Function(_$_ItemAddToCartDialogState) _then)
      : super(_value, (v) => _then(v as _$_ItemAddToCartDialogState));

  @override
  _$_ItemAddToCartDialogState get _value =>
      super._value as _$_ItemAddToCartDialogState;

  @override
  $Res call({
    Object? selectedUnit = freezed,
    Object? totalPrice = freezed,
    Object? cartSubmitted = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_ItemAddToCartDialogState(
      selectedUnit: selectedUnit == freezed
          ? _value.selectedUnit
          : selectedUnit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      cartSubmitted: cartSubmitted == freezed
          ? _value.cartSubmitted
          : cartSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ItemAddToCartDialogState implements _ItemAddToCartDialogState {
  _$_ItemAddToCartDialogState(
      {this.selectedUnit,
      this.totalPrice = 0,
      this.cartSubmitted = false,
      this.quantity = 0});

  @override
  final Unit? selectedUnit;
  @override
  @JsonKey()
  final double totalPrice;
  @override
  @JsonKey()
  final bool cartSubmitted;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'ItemAddToCartDialogState(selectedUnit: $selectedUnit, totalPrice: $totalPrice, cartSubmitted: $cartSubmitted, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemAddToCartDialogState &&
            const DeepCollectionEquality()
                .equals(other.selectedUnit, selectedUnit) &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice) &&
            const DeepCollectionEquality()
                .equals(other.cartSubmitted, cartSubmitted) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedUnit),
      const DeepCollectionEquality().hash(totalPrice),
      const DeepCollectionEquality().hash(cartSubmitted),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_ItemAddToCartDialogStateCopyWith<_$_ItemAddToCartDialogState>
      get copyWith => __$$_ItemAddToCartDialogStateCopyWithImpl<
          _$_ItemAddToCartDialogState>(this, _$identity);
}

abstract class _ItemAddToCartDialogState implements ItemAddToCartDialogState {
  factory _ItemAddToCartDialogState(
      {final Unit? selectedUnit,
      final double totalPrice,
      final bool cartSubmitted,
      final int quantity}) = _$_ItemAddToCartDialogState;

  @override
  Unit? get selectedUnit;
  @override
  double get totalPrice;
  @override
  bool get cartSubmitted;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_ItemAddToCartDialogStateCopyWith<_$_ItemAddToCartDialogState>
      get copyWith => throw _privateConstructorUsedError;
}
