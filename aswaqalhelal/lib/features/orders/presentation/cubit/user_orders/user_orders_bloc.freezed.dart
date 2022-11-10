// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_orders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserOrdersState {
  List<Order> get orders => throw _privateConstructorUsedError;
  RequestState get ordersState => throw _privateConstructorUsedError;
  RequestState get updateState => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserOrdersStateCopyWith<UserOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOrdersStateCopyWith<$Res> {
  factory $UserOrdersStateCopyWith(
          UserOrdersState value, $Res Function(UserOrdersState) then) =
      _$UserOrdersStateCopyWithImpl<$Res, UserOrdersState>;
  @useResult
  $Res call(
      {List<Order> orders,
      RequestState ordersState,
      RequestState updateState,
      String errorMessage});
}

/// @nodoc
class _$UserOrdersStateCopyWithImpl<$Res, $Val extends UserOrdersState>
    implements $UserOrdersStateCopyWith<$Res> {
  _$UserOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? ordersState = null,
    Object? updateState = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      ordersState: null == ordersState
          ? _value.ordersState
          : ordersState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      updateState: null == updateState
          ? _value.updateState
          : updateState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserOrdersStateCopyWith<$Res>
    implements $UserOrdersStateCopyWith<$Res> {
  factory _$$_UserOrdersStateCopyWith(
          _$_UserOrdersState value, $Res Function(_$_UserOrdersState) then) =
      __$$_UserOrdersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Order> orders,
      RequestState ordersState,
      RequestState updateState,
      String errorMessage});
}

/// @nodoc
class __$$_UserOrdersStateCopyWithImpl<$Res>
    extends _$UserOrdersStateCopyWithImpl<$Res, _$_UserOrdersState>
    implements _$$_UserOrdersStateCopyWith<$Res> {
  __$$_UserOrdersStateCopyWithImpl(
      _$_UserOrdersState _value, $Res Function(_$_UserOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? ordersState = null,
    Object? updateState = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_UserOrdersState(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      ordersState: null == ordersState
          ? _value.ordersState
          : ordersState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      updateState: null == updateState
          ? _value.updateState
          : updateState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserOrdersState implements _UserOrdersState {
  const _$_UserOrdersState(
      {final List<Order> orders = const [],
      this.ordersState = RequestState.initial,
      this.updateState = RequestState.initial,
      this.errorMessage = ''})
      : _orders = orders;

  final List<Order> _orders;
  @override
  @JsonKey()
  List<Order> get orders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey()
  final RequestState ordersState;
  @override
  @JsonKey()
  final RequestState updateState;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'UserOrdersState(orders: $orders, ordersState: $ordersState, updateState: $updateState, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserOrdersState &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.ordersState, ordersState) ||
                other.ordersState == ordersState) &&
            (identical(other.updateState, updateState) ||
                other.updateState == updateState) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orders),
      ordersState,
      updateState,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserOrdersStateCopyWith<_$_UserOrdersState> get copyWith =>
      __$$_UserOrdersStateCopyWithImpl<_$_UserOrdersState>(this, _$identity);
}

abstract class _UserOrdersState implements UserOrdersState {
  const factory _UserOrdersState(
      {final List<Order> orders,
      final RequestState ordersState,
      final RequestState updateState,
      final String errorMessage}) = _$_UserOrdersState;

  @override
  List<Order> get orders;
  @override
  RequestState get ordersState;
  @override
  RequestState get updateState;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_UserOrdersStateCopyWith<_$_UserOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
