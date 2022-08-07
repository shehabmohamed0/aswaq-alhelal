// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'items_widget_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemsWidgetState {
  List<InstitutionItem> get items => throw _privateConstructorUsedError;
  List<InstitutionItem> get searchItems => throw _privateConstructorUsedError;
  SortType get sortType => throw _privateConstructorUsedError;
  SortDirection get sortDirection => throw _privateConstructorUsedError;
  DisplayItems get displayItem => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  String get searchValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemsWidgetStateCopyWith<ItemsWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsWidgetStateCopyWith<$Res> {
  factory $ItemsWidgetStateCopyWith(
          ItemsWidgetState value, $Res Function(ItemsWidgetState) then) =
      _$ItemsWidgetStateCopyWithImpl<$Res>;
  $Res call(
      {List<InstitutionItem> items,
      List<InstitutionItem> searchItems,
      SortType sortType,
      SortDirection sortDirection,
      DisplayItems displayItem,
      bool isSearching,
      String searchValue});
}

/// @nodoc
class _$ItemsWidgetStateCopyWithImpl<$Res>
    implements $ItemsWidgetStateCopyWith<$Res> {
  _$ItemsWidgetStateCopyWithImpl(this._value, this._then);

  final ItemsWidgetState _value;
  // ignore: unused_field
  final $Res Function(ItemsWidgetState) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? searchItems = freezed,
    Object? sortType = freezed,
    Object? sortDirection = freezed,
    Object? displayItem = freezed,
    Object? isSearching = freezed,
    Object? searchValue = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InstitutionItem>,
      searchItems: searchItems == freezed
          ? _value.searchItems
          : searchItems // ignore: cast_nullable_to_non_nullable
              as List<InstitutionItem>,
      sortType: sortType == freezed
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortType,
      sortDirection: sortDirection == freezed
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as SortDirection,
      displayItem: displayItem == freezed
          ? _value.displayItem
          : displayItem // ignore: cast_nullable_to_non_nullable
              as DisplayItems,
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchValue: searchValue == freezed
          ? _value.searchValue
          : searchValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemsWidgetStateCopyWith<$Res>
    implements $ItemsWidgetStateCopyWith<$Res> {
  factory _$$_ItemsWidgetStateCopyWith(
          _$_ItemsWidgetState value, $Res Function(_$_ItemsWidgetState) then) =
      __$$_ItemsWidgetStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<InstitutionItem> items,
      List<InstitutionItem> searchItems,
      SortType sortType,
      SortDirection sortDirection,
      DisplayItems displayItem,
      bool isSearching,
      String searchValue});
}

/// @nodoc
class __$$_ItemsWidgetStateCopyWithImpl<$Res>
    extends _$ItemsWidgetStateCopyWithImpl<$Res>
    implements _$$_ItemsWidgetStateCopyWith<$Res> {
  __$$_ItemsWidgetStateCopyWithImpl(
      _$_ItemsWidgetState _value, $Res Function(_$_ItemsWidgetState) _then)
      : super(_value, (v) => _then(v as _$_ItemsWidgetState));

  @override
  _$_ItemsWidgetState get _value => super._value as _$_ItemsWidgetState;

  @override
  $Res call({
    Object? items = freezed,
    Object? searchItems = freezed,
    Object? sortType = freezed,
    Object? sortDirection = freezed,
    Object? displayItem = freezed,
    Object? isSearching = freezed,
    Object? searchValue = freezed,
  }) {
    return _then(_$_ItemsWidgetState(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InstitutionItem>,
      searchItems: searchItems == freezed
          ? _value._searchItems
          : searchItems // ignore: cast_nullable_to_non_nullable
              as List<InstitutionItem>,
      sortType: sortType == freezed
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortType,
      sortDirection: sortDirection == freezed
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as SortDirection,
      displayItem: displayItem == freezed
          ? _value.displayItem
          : displayItem // ignore: cast_nullable_to_non_nullable
              as DisplayItems,
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchValue: searchValue == freezed
          ? _value.searchValue
          : searchValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ItemsWidgetState implements _ItemsWidgetState {
  const _$_ItemsWidgetState(
      {final List<InstitutionItem> items = const [],
      final List<InstitutionItem> searchItems = const [],
      this.sortType = SortType.creationTime,
      this.sortDirection = SortDirection.descending,
      this.displayItem = DisplayItems.gridView,
      this.isSearching = false,
      this.searchValue = ''})
      : _items = items,
        _searchItems = searchItems;

  final List<InstitutionItem> _items;
  @override
  @JsonKey()
  List<InstitutionItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<InstitutionItem> _searchItems;
  @override
  @JsonKey()
  List<InstitutionItem> get searchItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchItems);
  }

  @override
  @JsonKey()
  final SortType sortType;
  @override
  @JsonKey()
  final SortDirection sortDirection;
  @override
  @JsonKey()
  final DisplayItems displayItem;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final String searchValue;

  @override
  String toString() {
    return 'ItemsWidgetState(items: $items, searchItems: $searchItems, sortType: $sortType, sortDirection: $sortDirection, displayItem: $displayItem, isSearching: $isSearching, searchValue: $searchValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemsWidgetState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._searchItems, _searchItems) &&
            const DeepCollectionEquality().equals(other.sortType, sortType) &&
            const DeepCollectionEquality()
                .equals(other.sortDirection, sortDirection) &&
            const DeepCollectionEquality()
                .equals(other.displayItem, displayItem) &&
            const DeepCollectionEquality()
                .equals(other.isSearching, isSearching) &&
            const DeepCollectionEquality()
                .equals(other.searchValue, searchValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_searchItems),
      const DeepCollectionEquality().hash(sortType),
      const DeepCollectionEquality().hash(sortDirection),
      const DeepCollectionEquality().hash(displayItem),
      const DeepCollectionEquality().hash(isSearching),
      const DeepCollectionEquality().hash(searchValue));

  @JsonKey(ignore: true)
  @override
  _$$_ItemsWidgetStateCopyWith<_$_ItemsWidgetState> get copyWith =>
      __$$_ItemsWidgetStateCopyWithImpl<_$_ItemsWidgetState>(this, _$identity);
}

abstract class _ItemsWidgetState implements ItemsWidgetState {
  const factory _ItemsWidgetState(
      {final List<InstitutionItem> items,
      final List<InstitutionItem> searchItems,
      final SortType sortType,
      final SortDirection sortDirection,
      final DisplayItems displayItem,
      final bool isSearching,
      final String searchValue}) = _$_ItemsWidgetState;

  @override
  List<InstitutionItem> get items;
  @override
  List<InstitutionItem> get searchItems;
  @override
  SortType get sortType;
  @override
  SortDirection get sortDirection;
  @override
  DisplayItems get displayItem;
  @override
  bool get isSearching;
  @override
  String get searchValue;
  @override
  @JsonKey(ignore: true)
  _$$_ItemsWidgetStateCopyWith<_$_ItemsWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}
