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
      _$ItemAddToCartDialogStateCopyWithImpl<$Res, ItemAddToCartDialogState>;
  @useResult
  $Res call(
      {Unit? selectedUnit,
      double totalPrice,
      bool cartSubmitted,
      int quantity});
}

/// @nodoc
class _$ItemAddToCartDialogStateCopyWithImpl<$Res,
        $Val extends ItemAddToCartDialogState>
    implements $ItemAddToCartDialogStateCopyWith<$Res> {
  _$ItemAddToCartDialogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUnit = freezed,
    Object? totalPrice = null,
    Object? cartSubmitted = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      selectedUnit: freezed == selectedUnit
          ? _value.selectedUnit
          : selectedUnit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      cartSubmitted: null == cartSubmitted
          ? _value.cartSubmitted
          : cartSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
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
  @useResult
  $Res call(
      {Unit? selectedUnit,
      double totalPrice,
      bool cartSubmitted,
      int quantity});
}

/// @nodoc
class __$$_ItemAddToCartDialogStateCopyWithImpl<$Res>
    extends _$ItemAddToCartDialogStateCopyWithImpl<$Res,
        _$_ItemAddToCartDialogState>
    implements _$$_ItemAddToCartDialogStateCopyWith<$Res> {
  __$$_ItemAddToCartDialogStateCopyWithImpl(_$_ItemAddToCartDialogState _value,
      $Res Function(_$_ItemAddToCartDialogState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUnit = freezed,
    Object? totalPrice = null,
    Object? cartSubmitted = null,
    Object? quantity = null,
  }) {
    return _then(_$_ItemAddToCartDialogState(
      selectedUnit: freezed == selectedUnit
          ? _value.selectedUnit
          : selectedUnit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      cartSubmitted: null == cartSubmitted
          ? _value.cartSubmitted
          : cartSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
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
            (identical(other.selectedUnit, selectedUnit) ||
                other.selectedUnit == selectedUnit) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.cartSubmitted, cartSubmitted) ||
                other.cartSubmitted == cartSubmitted) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedUnit, totalPrice, cartSubmitted, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
