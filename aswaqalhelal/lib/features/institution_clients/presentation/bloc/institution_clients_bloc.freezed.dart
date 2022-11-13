// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'institution_clients_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InstitutionClientsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionClientsEventCopyWith<$Res> {
  factory $InstitutionClientsEventCopyWith(InstitutionClientsEvent value,
          $Res Function(InstitutionClientsEvent) then) =
      _$InstitutionClientsEventCopyWithImpl<$Res, InstitutionClientsEvent>;
}

/// @nodoc
class _$InstitutionClientsEventCopyWithImpl<$Res,
        $Val extends InstitutionClientsEvent>
    implements $InstitutionClientsEventCopyWith<$Res> {
  _$InstitutionClientsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PhoneNumberChangedCopyWith<$Res> {
  factory _$$PhoneNumberChangedCopyWith(_$PhoneNumberChanged value,
          $Res Function(_$PhoneNumberChanged) then) =
      __$$PhoneNumberChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$PhoneNumberChangedCopyWithImpl<$Res>
    extends _$InstitutionClientsEventCopyWithImpl<$Res, _$PhoneNumberChanged>
    implements _$$PhoneNumberChangedCopyWith<$Res> {
  __$$PhoneNumberChangedCopyWithImpl(
      _$PhoneNumberChanged _value, $Res Function(_$PhoneNumberChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$PhoneNumberChanged(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberChanged implements PhoneNumberChanged {
  const _$PhoneNumberChanged({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'InstitutionClientsEvent.phoneNumberChanged(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberChanged &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberChangedCopyWith<_$PhoneNumberChanged> get copyWith =>
      __$$PhoneNumberChangedCopyWithImpl<_$PhoneNumberChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
  }) {
    return phoneNumberChanged(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
  }) {
    return phoneNumberChanged?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    required TResult orElse(),
  }) {
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
  }) {
    return phoneNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
  }) {
    return phoneNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    required TResult orElse(),
  }) {
    if (phoneNumberChanged != null) {
      return phoneNumberChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberChanged implements InstitutionClientsEvent {
  const factory PhoneNumberChanged({required final String phoneNumber}) =
      _$PhoneNumberChanged;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$PhoneNumberChangedCopyWith<_$PhoneNumberChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewPhoneNumberClickedCopyWith<$Res> {
  factory _$$NewPhoneNumberClickedCopyWith(_$NewPhoneNumberClicked value,
          $Res Function(_$NewPhoneNumberClicked) then) =
      __$$NewPhoneNumberClickedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewPhoneNumberClickedCopyWithImpl<$Res>
    extends _$InstitutionClientsEventCopyWithImpl<$Res, _$NewPhoneNumberClicked>
    implements _$$NewPhoneNumberClickedCopyWith<$Res> {
  __$$NewPhoneNumberClickedCopyWithImpl(_$NewPhoneNumberClicked _value,
      $Res Function(_$NewPhoneNumberClicked) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewPhoneNumberClicked implements NewPhoneNumberClicked {
  const _$NewPhoneNumberClicked();

  @override
  String toString() {
    return 'InstitutionClientsEvent.newPhoneNumberClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewPhoneNumberClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
  }) {
    return newPhoneNumberClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
  }) {
    return newPhoneNumberClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    required TResult orElse(),
  }) {
    if (newPhoneNumberClicked != null) {
      return newPhoneNumberClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
  }) {
    return newPhoneNumberClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
  }) {
    return newPhoneNumberClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    required TResult orElse(),
  }) {
    if (newPhoneNumberClicked != null) {
      return newPhoneNumberClicked(this);
    }
    return orElse();
  }
}

abstract class NewPhoneNumberClicked implements InstitutionClientsEvent {
  const factory NewPhoneNumberClicked() = _$NewPhoneNumberClicked;
}

/// @nodoc
abstract class _$$UserProfileSelectedCopyWith<$Res> {
  factory _$$UserProfileSelectedCopyWith(_$UserProfileSelected value,
          $Res Function(_$UserProfileSelected) then) =
      __$$UserProfileSelectedCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfile userProfile});
}

/// @nodoc
class __$$UserProfileSelectedCopyWithImpl<$Res>
    extends _$InstitutionClientsEventCopyWithImpl<$Res, _$UserProfileSelected>
    implements _$$UserProfileSelectedCopyWith<$Res> {
  __$$UserProfileSelectedCopyWithImpl(
      _$UserProfileSelected _value, $Res Function(_$UserProfileSelected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
  }) {
    return _then(_$UserProfileSelected(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ));
  }
}

/// @nodoc

class _$UserProfileSelected implements UserProfileSelected {
  const _$UserProfileSelected({required this.userProfile});

  @override
  final UserProfile userProfile;

  @override
  String toString() {
    return 'InstitutionClientsEvent.userSelected(userProfile: $userProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileSelected &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileSelectedCopyWith<_$UserProfileSelected> get copyWith =>
      __$$UserProfileSelectedCopyWithImpl<_$UserProfileSelected>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
  }) {
    return userSelected(userProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
  }) {
    return userSelected?.call(userProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    required TResult orElse(),
  }) {
    if (userSelected != null) {
      return userSelected(userProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
  }) {
    return userSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
  }) {
    return userSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    required TResult orElse(),
  }) {
    if (userSelected != null) {
      return userSelected(this);
    }
    return orElse();
  }
}

abstract class UserProfileSelected implements InstitutionClientsEvent {
  const factory UserProfileSelected({required final UserProfile userProfile}) =
      _$UserProfileSelected;

  UserProfile get userProfile;
  @JsonKey(ignore: true)
  _$$UserProfileSelectedCopyWith<_$UserProfileSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveSelectionButtonClickedCopyWith<$Res> {
  factory _$$RemoveSelectionButtonClickedCopyWith(
          _$RemoveSelectionButtonClicked value,
          $Res Function(_$RemoveSelectionButtonClicked) then) =
      __$$RemoveSelectionButtonClickedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveSelectionButtonClickedCopyWithImpl<$Res>
    extends _$InstitutionClientsEventCopyWithImpl<$Res,
        _$RemoveSelectionButtonClicked>
    implements _$$RemoveSelectionButtonClickedCopyWith<$Res> {
  __$$RemoveSelectionButtonClickedCopyWithImpl(
      _$RemoveSelectionButtonClicked _value,
      $Res Function(_$RemoveSelectionButtonClicked) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveSelectionButtonClicked implements RemoveSelectionButtonClicked {
  const _$RemoveSelectionButtonClicked();

  @override
  String toString() {
    return 'InstitutionClientsEvent.removeSelectionButtonClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveSelectionButtonClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber) phoneNumberChanged,
    required TResult Function() newPhoneNumberClicked,
    required TResult Function(UserProfile userProfile) userSelected,
    required TResult Function() removeSelectionButtonClicked,
  }) {
    return removeSelectionButtonClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber)? phoneNumberChanged,
    TResult? Function()? newPhoneNumberClicked,
    TResult? Function(UserProfile userProfile)? userSelected,
    TResult? Function()? removeSelectionButtonClicked,
  }) {
    return removeSelectionButtonClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber)? phoneNumberChanged,
    TResult Function()? newPhoneNumberClicked,
    TResult Function(UserProfile userProfile)? userSelected,
    TResult Function()? removeSelectionButtonClicked,
    required TResult orElse(),
  }) {
    if (removeSelectionButtonClicked != null) {
      return removeSelectionButtonClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneNumberChanged value) phoneNumberChanged,
    required TResult Function(NewPhoneNumberClicked value)
        newPhoneNumberClicked,
    required TResult Function(UserProfileSelected value) userSelected,
    required TResult Function(RemoveSelectionButtonClicked value)
        removeSelectionButtonClicked,
  }) {
    return removeSelectionButtonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult? Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult? Function(UserProfileSelected value)? userSelected,
    TResult? Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
  }) {
    return removeSelectionButtonClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneNumberChanged value)? phoneNumberChanged,
    TResult Function(NewPhoneNumberClicked value)? newPhoneNumberClicked,
    TResult Function(UserProfileSelected value)? userSelected,
    TResult Function(RemoveSelectionButtonClicked value)?
        removeSelectionButtonClicked,
    required TResult orElse(),
  }) {
    if (removeSelectionButtonClicked != null) {
      return removeSelectionButtonClicked(this);
    }
    return orElse();
  }
}

abstract class RemoveSelectionButtonClicked implements InstitutionClientsEvent {
  const factory RemoveSelectionButtonClicked() = _$RemoveSelectionButtonClicked;
}

/// @nodoc
mixin _$InstitutionClientsState {
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  bool get isAddingClientWithoutUserProfile =>
      throw _privateConstructorUsedError;
  Iterable<UserProfile> get userSuggestions =>
      throw _privateConstructorUsedError;
  AutoSuggestionState get suggestionState => throw _privateConstructorUsedError;
  RequiredObject<UserProfile> get userProfile =>
      throw _privateConstructorUsedError;
  InstitutionClientsStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstitutionClientsStateCopyWith<InstitutionClientsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionClientsStateCopyWith<$Res> {
  factory $InstitutionClientsStateCopyWith(InstitutionClientsState value,
          $Res Function(InstitutionClientsState) then) =
      _$InstitutionClientsStateCopyWithImpl<$Res, InstitutionClientsState>;
  @useResult
  $Res call(
      {PhoneNumber phoneNumber,
      bool isAddingClientWithoutUserProfile,
      Iterable<UserProfile> userSuggestions,
      AutoSuggestionState suggestionState,
      RequiredObject<UserProfile> userProfile,
      InstitutionClientsStatus status});
}

/// @nodoc
class _$InstitutionClientsStateCopyWithImpl<$Res,
        $Val extends InstitutionClientsState>
    implements $InstitutionClientsStateCopyWith<$Res> {
  _$InstitutionClientsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? isAddingClientWithoutUserProfile = null,
    Object? userSuggestions = null,
    Object? suggestionState = null,
    Object? userProfile = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      isAddingClientWithoutUserProfile: null == isAddingClientWithoutUserProfile
          ? _value.isAddingClientWithoutUserProfile
          : isAddingClientWithoutUserProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      userSuggestions: null == userSuggestions
          ? _value.userSuggestions
          : userSuggestions // ignore: cast_nullable_to_non_nullable
              as Iterable<UserProfile>,
      suggestionState: null == suggestionState
          ? _value.suggestionState
          : suggestionState // ignore: cast_nullable_to_non_nullable
              as AutoSuggestionState,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as RequiredObject<UserProfile>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InstitutionClientsStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InstitutionClientsStateCopyWith<$Res>
    implements $InstitutionClientsStateCopyWith<$Res> {
  factory _$$_InstitutionClientsStateCopyWith(_$_InstitutionClientsState value,
          $Res Function(_$_InstitutionClientsState) then) =
      __$$_InstitutionClientsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PhoneNumber phoneNumber,
      bool isAddingClientWithoutUserProfile,
      Iterable<UserProfile> userSuggestions,
      AutoSuggestionState suggestionState,
      RequiredObject<UserProfile> userProfile,
      InstitutionClientsStatus status});
}

/// @nodoc
class __$$_InstitutionClientsStateCopyWithImpl<$Res>
    extends _$InstitutionClientsStateCopyWithImpl<$Res,
        _$_InstitutionClientsState>
    implements _$$_InstitutionClientsStateCopyWith<$Res> {
  __$$_InstitutionClientsStateCopyWithImpl(_$_InstitutionClientsState _value,
      $Res Function(_$_InstitutionClientsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? isAddingClientWithoutUserProfile = null,
    Object? userSuggestions = null,
    Object? suggestionState = null,
    Object? userProfile = null,
    Object? status = null,
  }) {
    return _then(_$_InstitutionClientsState(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      isAddingClientWithoutUserProfile: null == isAddingClientWithoutUserProfile
          ? _value.isAddingClientWithoutUserProfile
          : isAddingClientWithoutUserProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      userSuggestions: null == userSuggestions
          ? _value.userSuggestions
          : userSuggestions // ignore: cast_nullable_to_non_nullable
              as Iterable<UserProfile>,
      suggestionState: null == suggestionState
          ? _value.suggestionState
          : suggestionState // ignore: cast_nullable_to_non_nullable
              as AutoSuggestionState,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as RequiredObject<UserProfile>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InstitutionClientsStatus,
    ));
  }
}

/// @nodoc

class _$_InstitutionClientsState implements _InstitutionClientsState {
  const _$_InstitutionClientsState(
      {this.phoneNumber = const PhoneNumber.pure(),
      this.isAddingClientWithoutUserProfile = false,
      this.userSuggestions = const Iterable.empty(),
      this.suggestionState = AutoSuggestionState.emptyText,
      this.userProfile = const RequiredObject<UserProfile>.pure(),
      this.status = InstitutionClientsStatus.initial});

  @override
  @JsonKey()
  final PhoneNumber phoneNumber;
  @override
  @JsonKey()
  final bool isAddingClientWithoutUserProfile;
  @override
  @JsonKey()
  final Iterable<UserProfile> userSuggestions;
  @override
  @JsonKey()
  final AutoSuggestionState suggestionState;
  @override
  @JsonKey()
  final RequiredObject<UserProfile> userProfile;
  @override
  @JsonKey()
  final InstitutionClientsStatus status;

  @override
  String toString() {
    return 'InstitutionClientsState(phoneNumber: $phoneNumber, isAddingClientWithoutUserProfile: $isAddingClientWithoutUserProfile, userSuggestions: $userSuggestions, suggestionState: $suggestionState, userProfile: $userProfile, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InstitutionClientsState &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isAddingClientWithoutUserProfile,
                    isAddingClientWithoutUserProfile) ||
                other.isAddingClientWithoutUserProfile ==
                    isAddingClientWithoutUserProfile) &&
            const DeepCollectionEquality()
                .equals(other.userSuggestions, userSuggestions) &&
            (identical(other.suggestionState, suggestionState) ||
                other.suggestionState == suggestionState) &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      phoneNumber,
      isAddingClientWithoutUserProfile,
      const DeepCollectionEquality().hash(userSuggestions),
      suggestionState,
      userProfile,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InstitutionClientsStateCopyWith<_$_InstitutionClientsState>
      get copyWith =>
          __$$_InstitutionClientsStateCopyWithImpl<_$_InstitutionClientsState>(
              this, _$identity);
}

abstract class _InstitutionClientsState implements InstitutionClientsState {
  const factory _InstitutionClientsState(
      {final PhoneNumber phoneNumber,
      final bool isAddingClientWithoutUserProfile,
      final Iterable<UserProfile> userSuggestions,
      final AutoSuggestionState suggestionState,
      final RequiredObject<UserProfile> userProfile,
      final InstitutionClientsStatus status}) = _$_InstitutionClientsState;

  @override
  PhoneNumber get phoneNumber;
  @override
  bool get isAddingClientWithoutUserProfile;
  @override
  Iterable<UserProfile> get userSuggestions;
  @override
  AutoSuggestionState get suggestionState;
  @override
  RequiredObject<UserProfile> get userProfile;
  @override
  InstitutionClientsStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_InstitutionClientsStateCopyWith<_$_InstitutionClientsState>
      get copyWith => throw _privateConstructorUsedError;
}
