// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'institution_orders_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InstitutionOrdersState {
  List<Order> get pendingOrders => throw _privateConstructorUsedError;
  dynamic get pendingOrdersState => throw _privateConstructorUsedError;
  List<Order> get shippingOrders => throw _privateConstructorUsedError;
  dynamic get shippingOrdersState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstitutionOrdersStateCopyWith<InstitutionOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionOrdersStateCopyWith<$Res> {
  factory $InstitutionOrdersStateCopyWith(InstitutionOrdersState value,
          $Res Function(InstitutionOrdersState) then) =
      _$InstitutionOrdersStateCopyWithImpl<$Res>;
  $Res call(
      {List<Order> pendingOrders,
      dynamic pendingOrdersState,
      List<Order> shippingOrders,
      dynamic shippingOrdersState});
}

/// @nodoc
class _$InstitutionOrdersStateCopyWithImpl<$Res>
    implements $InstitutionOrdersStateCopyWith<$Res> {
  _$InstitutionOrdersStateCopyWithImpl(this._value, this._then);

  final InstitutionOrdersState _value;
  // ignore: unused_field
  final $Res Function(InstitutionOrdersState) _then;

  @override
  $Res call({
    Object? pendingOrders = freezed,
    Object? pendingOrdersState = freezed,
    Object? shippingOrders = freezed,
    Object? shippingOrdersState = freezed,
  }) {
    return _then(_value.copyWith(
      pendingOrders: pendingOrders == freezed
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      pendingOrdersState: pendingOrdersState == freezed
          ? _value.pendingOrdersState
          : pendingOrdersState // ignore: cast_nullable_to_non_nullable
              as dynamic,
      shippingOrders: shippingOrders == freezed
          ? _value.shippingOrders
          : shippingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      shippingOrdersState: shippingOrdersState == freezed
          ? _value.shippingOrdersState
          : shippingOrdersState // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_InstitutionOrdersStateCopyWith<$Res>
    implements $InstitutionOrdersStateCopyWith<$Res> {
  factory _$$_InstitutionOrdersStateCopyWith(_$_InstitutionOrdersState value,
          $Res Function(_$_InstitutionOrdersState) then) =
      __$$_InstitutionOrdersStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Order> pendingOrders,
      dynamic pendingOrdersState,
      List<Order> shippingOrders,
      dynamic shippingOrdersState});
}

/// @nodoc
class __$$_InstitutionOrdersStateCopyWithImpl<$Res>
    extends _$InstitutionOrdersStateCopyWithImpl<$Res>
    implements _$$_InstitutionOrdersStateCopyWith<$Res> {
  __$$_InstitutionOrdersStateCopyWithImpl(_$_InstitutionOrdersState _value,
      $Res Function(_$_InstitutionOrdersState) _then)
      : super(_value, (v) => _then(v as _$_InstitutionOrdersState));

  @override
  _$_InstitutionOrdersState get _value =>
      super._value as _$_InstitutionOrdersState;

  @override
  $Res call({
    Object? pendingOrders = freezed,
    Object? pendingOrdersState = freezed,
    Object? shippingOrders = freezed,
    Object? shippingOrdersState = freezed,
  }) {
    return _then(_$_InstitutionOrdersState(
      pendingOrders: pendingOrders == freezed
          ? _value._pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      pendingOrdersState: pendingOrdersState == freezed
          ? _value.pendingOrdersState
          : pendingOrdersState,
      shippingOrders: shippingOrders == freezed
          ? _value._shippingOrders
          : shippingOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      shippingOrdersState: shippingOrdersState == freezed
          ? _value.shippingOrdersState
          : shippingOrdersState,
    ));
  }
}

/// @nodoc

class _$_InstitutionOrdersState implements _InstitutionOrdersState {
  const _$_InstitutionOrdersState(
      {final List<Order> pendingOrders = const [],
      this.pendingOrdersState = RequestState.initial,
      final List<Order> shippingOrders = const [],
      this.shippingOrdersState = RequestState.initial})
      : _pendingOrders = pendingOrders,
        _shippingOrders = shippingOrders;

  final List<Order> _pendingOrders;
  @override
  @JsonKey()
  List<Order> get pendingOrders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingOrders);
  }

  @override
  @JsonKey()
  final dynamic pendingOrdersState;
  final List<Order> _shippingOrders;
  @override
  @JsonKey()
  List<Order> get shippingOrders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shippingOrders);
  }

  @override
  @JsonKey()
  final dynamic shippingOrdersState;

  @override
  String toString() {
    return 'InstitutionOrdersState(pendingOrders: $pendingOrders, pendingOrdersState: $pendingOrdersState, shippingOrders: $shippingOrders, shippingOrdersState: $shippingOrdersState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InstitutionOrdersState &&
            const DeepCollectionEquality()
                .equals(other._pendingOrders, _pendingOrders) &&
            const DeepCollectionEquality()
                .equals(other.pendingOrdersState, pendingOrdersState) &&
            const DeepCollectionEquality()
                .equals(other._shippingOrders, _shippingOrders) &&
            const DeepCollectionEquality()
                .equals(other.shippingOrdersState, shippingOrdersState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pendingOrders),
      const DeepCollectionEquality().hash(pendingOrdersState),
      const DeepCollectionEquality().hash(_shippingOrders),
      const DeepCollectionEquality().hash(shippingOrdersState));

  @JsonKey(ignore: true)
  @override
  _$$_InstitutionOrdersStateCopyWith<_$_InstitutionOrdersState> get copyWith =>
      __$$_InstitutionOrdersStateCopyWithImpl<_$_InstitutionOrdersState>(
          this, _$identity);
}

abstract class _InstitutionOrdersState implements InstitutionOrdersState {
  const factory _InstitutionOrdersState(
      {final List<Order> pendingOrders,
      final dynamic pendingOrdersState,
      final List<Order> shippingOrders,
      final dynamic shippingOrdersState}) = _$_InstitutionOrdersState;

  @override
  List<Order> get pendingOrders;
  @override
  dynamic get pendingOrdersState;
  @override
  List<Order> get shippingOrders;
  @override
  dynamic get shippingOrdersState;
  @override
  @JsonKey(ignore: true)
  _$$_InstitutionOrdersStateCopyWith<_$_InstitutionOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
