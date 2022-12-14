// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pulls_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetPullsListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PullModel> transactions) success,
    required TResult Function(String? error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PullModel> transactions)? success,
    TResult? Function(String? error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PullModel> transactions)? success,
    TResult Function(String? error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingGetPullsListState value) loading,
    required TResult Function(SuccessGetPullsListState value) success,
    required TResult Function(FailedGetPullsListState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingGetPullsListState value)? loading,
    TResult? Function(SuccessGetPullsListState value)? success,
    TResult? Function(FailedGetPullsListState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingGetPullsListState value)? loading,
    TResult Function(SuccessGetPullsListState value)? success,
    TResult Function(FailedGetPullsListState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPullsListStateCopyWith<$Res> {
  factory $GetPullsListStateCopyWith(
          GetPullsListState value, $Res Function(GetPullsListState) then) =
      _$GetPullsListStateCopyWithImpl<$Res, GetPullsListState>;
}

/// @nodoc
class _$GetPullsListStateCopyWithImpl<$Res, $Val extends GetPullsListState>
    implements $GetPullsListStateCopyWith<$Res> {
  _$GetPullsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingGetPullsListStateCopyWith<$Res> {
  factory _$$LoadingGetPullsListStateCopyWith(_$LoadingGetPullsListState value,
          $Res Function(_$LoadingGetPullsListState) then) =
      __$$LoadingGetPullsListStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingGetPullsListStateCopyWithImpl<$Res>
    extends _$GetPullsListStateCopyWithImpl<$Res, _$LoadingGetPullsListState>
    implements _$$LoadingGetPullsListStateCopyWith<$Res> {
  __$$LoadingGetPullsListStateCopyWithImpl(_$LoadingGetPullsListState _value,
      $Res Function(_$LoadingGetPullsListState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingGetPullsListState implements LoadingGetPullsListState {
  const _$LoadingGetPullsListState();

  @override
  String toString() {
    return 'GetPullsListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingGetPullsListState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PullModel> transactions) success,
    required TResult Function(String? error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PullModel> transactions)? success,
    TResult? Function(String? error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PullModel> transactions)? success,
    TResult Function(String? error)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingGetPullsListState value) loading,
    required TResult Function(SuccessGetPullsListState value) success,
    required TResult Function(FailedGetPullsListState value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingGetPullsListState value)? loading,
    TResult? Function(SuccessGetPullsListState value)? success,
    TResult? Function(FailedGetPullsListState value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingGetPullsListState value)? loading,
    TResult Function(SuccessGetPullsListState value)? success,
    TResult Function(FailedGetPullsListState value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingGetPullsListState implements GetPullsListState {
  const factory LoadingGetPullsListState() = _$LoadingGetPullsListState;
}

/// @nodoc
abstract class _$$SuccessGetPullsListStateCopyWith<$Res> {
  factory _$$SuccessGetPullsListStateCopyWith(_$SuccessGetPullsListState value,
          $Res Function(_$SuccessGetPullsListState) then) =
      __$$SuccessGetPullsListStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PullModel> transactions});
}

/// @nodoc
class __$$SuccessGetPullsListStateCopyWithImpl<$Res>
    extends _$GetPullsListStateCopyWithImpl<$Res, _$SuccessGetPullsListState>
    implements _$$SuccessGetPullsListStateCopyWith<$Res> {
  __$$SuccessGetPullsListStateCopyWithImpl(_$SuccessGetPullsListState _value,
      $Res Function(_$SuccessGetPullsListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$SuccessGetPullsListState(
      null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<PullModel>,
    ));
  }
}

/// @nodoc

class _$SuccessGetPullsListState implements SuccessGetPullsListState {
  const _$SuccessGetPullsListState(final List<PullModel> transactions)
      : _transactions = transactions;

  final List<PullModel> _transactions;
  @override
  List<PullModel> get transactions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'GetPullsListState.success(transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetPullsListState &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetPullsListStateCopyWith<_$SuccessGetPullsListState>
      get copyWith =>
          __$$SuccessGetPullsListStateCopyWithImpl<_$SuccessGetPullsListState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PullModel> transactions) success,
    required TResult Function(String? error) failed,
  }) {
    return success(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PullModel> transactions)? success,
    TResult? Function(String? error)? failed,
  }) {
    return success?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PullModel> transactions)? success,
    TResult Function(String? error)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingGetPullsListState value) loading,
    required TResult Function(SuccessGetPullsListState value) success,
    required TResult Function(FailedGetPullsListState value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingGetPullsListState value)? loading,
    TResult? Function(SuccessGetPullsListState value)? success,
    TResult? Function(FailedGetPullsListState value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingGetPullsListState value)? loading,
    TResult Function(SuccessGetPullsListState value)? success,
    TResult Function(FailedGetPullsListState value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessGetPullsListState implements GetPullsListState {
  const factory SuccessGetPullsListState(final List<PullModel> transactions) =
      _$SuccessGetPullsListState;

  List<PullModel> get transactions;
  @JsonKey(ignore: true)
  _$$SuccessGetPullsListStateCopyWith<_$SuccessGetPullsListState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedGetPullsListStateCopyWith<$Res> {
  factory _$$FailedGetPullsListStateCopyWith(_$FailedGetPullsListState value,
          $Res Function(_$FailedGetPullsListState) then) =
      __$$FailedGetPullsListStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$FailedGetPullsListStateCopyWithImpl<$Res>
    extends _$GetPullsListStateCopyWithImpl<$Res, _$FailedGetPullsListState>
    implements _$$FailedGetPullsListStateCopyWith<$Res> {
  __$$FailedGetPullsListStateCopyWithImpl(_$FailedGetPullsListState _value,
      $Res Function(_$FailedGetPullsListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$FailedGetPullsListState(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FailedGetPullsListState implements FailedGetPullsListState {
  const _$FailedGetPullsListState(this.error);

  @override
  final String? error;

  @override
  String toString() {
    return 'GetPullsListState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedGetPullsListState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedGetPullsListStateCopyWith<_$FailedGetPullsListState> get copyWith =>
      __$$FailedGetPullsListStateCopyWithImpl<_$FailedGetPullsListState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PullModel> transactions) success,
    required TResult Function(String? error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PullModel> transactions)? success,
    TResult? Function(String? error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PullModel> transactions)? success,
    TResult Function(String? error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingGetPullsListState value) loading,
    required TResult Function(SuccessGetPullsListState value) success,
    required TResult Function(FailedGetPullsListState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingGetPullsListState value)? loading,
    TResult? Function(SuccessGetPullsListState value)? success,
    TResult? Function(FailedGetPullsListState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingGetPullsListState value)? loading,
    TResult Function(SuccessGetPullsListState value)? success,
    TResult Function(FailedGetPullsListState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailedGetPullsListState implements GetPullsListState {
  const factory FailedGetPullsListState(final String? error) =
      _$FailedGetPullsListState;

  String? get error;
  @JsonKey(ignore: true)
  _$$FailedGetPullsListStateCopyWith<_$FailedGetPullsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeletePullsListItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingDeletePullsListItemState value) loading,
    required TResult Function(SuccessDeletePullsListItemState value) success,
    required TResult Function(FailedDeletePullsListItemState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDeletePullsListItemState value)? loading,
    TResult? Function(SuccessDeletePullsListItemState value)? success,
    TResult? Function(FailedDeletePullsListItemState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDeletePullsListItemState value)? loading,
    TResult Function(SuccessDeletePullsListItemState value)? success,
    TResult Function(FailedDeletePullsListItemState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletePullsListItemStateCopyWith<$Res> {
  factory $DeletePullsListItemStateCopyWith(DeletePullsListItemState value,
          $Res Function(DeletePullsListItemState) then) =
      _$DeletePullsListItemStateCopyWithImpl<$Res, DeletePullsListItemState>;
}

/// @nodoc
class _$DeletePullsListItemStateCopyWithImpl<$Res,
        $Val extends DeletePullsListItemState>
    implements $DeletePullsListItemStateCopyWith<$Res> {
  _$DeletePullsListItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingDeletePullsListItemStateCopyWith<$Res> {
  factory _$$LoadingDeletePullsListItemStateCopyWith(
          _$LoadingDeletePullsListItemState value,
          $Res Function(_$LoadingDeletePullsListItemState) then) =
      __$$LoadingDeletePullsListItemStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingDeletePullsListItemStateCopyWithImpl<$Res>
    extends _$DeletePullsListItemStateCopyWithImpl<$Res,
        _$LoadingDeletePullsListItemState>
    implements _$$LoadingDeletePullsListItemStateCopyWith<$Res> {
  __$$LoadingDeletePullsListItemStateCopyWithImpl(
      _$LoadingDeletePullsListItemState _value,
      $Res Function(_$LoadingDeletePullsListItemState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingDeletePullsListItemState
    implements LoadingDeletePullsListItemState {
  const _$LoadingDeletePullsListItemState();

  @override
  String toString() {
    return 'DeletePullsListItemState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingDeletePullsListItemState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingDeletePullsListItemState value) loading,
    required TResult Function(SuccessDeletePullsListItemState value) success,
    required TResult Function(FailedDeletePullsListItemState value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDeletePullsListItemState value)? loading,
    TResult? Function(SuccessDeletePullsListItemState value)? success,
    TResult? Function(FailedDeletePullsListItemState value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDeletePullsListItemState value)? loading,
    TResult Function(SuccessDeletePullsListItemState value)? success,
    TResult Function(FailedDeletePullsListItemState value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingDeletePullsListItemState
    implements DeletePullsListItemState {
  const factory LoadingDeletePullsListItemState() =
      _$LoadingDeletePullsListItemState;
}

/// @nodoc
abstract class _$$SuccessDeletePullsListItemStateCopyWith<$Res> {
  factory _$$SuccessDeletePullsListItemStateCopyWith(
          _$SuccessDeletePullsListItemState value,
          $Res Function(_$SuccessDeletePullsListItemState) then) =
      __$$SuccessDeletePullsListItemStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessDeletePullsListItemStateCopyWithImpl<$Res>
    extends _$DeletePullsListItemStateCopyWithImpl<$Res,
        _$SuccessDeletePullsListItemState>
    implements _$$SuccessDeletePullsListItemStateCopyWith<$Res> {
  __$$SuccessDeletePullsListItemStateCopyWithImpl(
      _$SuccessDeletePullsListItemState _value,
      $Res Function(_$SuccessDeletePullsListItemState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessDeletePullsListItemState
    implements SuccessDeletePullsListItemState {
  const _$SuccessDeletePullsListItemState();

  @override
  String toString() {
    return 'DeletePullsListItemState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessDeletePullsListItemState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) failed,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? failed,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingDeletePullsListItemState value) loading,
    required TResult Function(SuccessDeletePullsListItemState value) success,
    required TResult Function(FailedDeletePullsListItemState value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDeletePullsListItemState value)? loading,
    TResult? Function(SuccessDeletePullsListItemState value)? success,
    TResult? Function(FailedDeletePullsListItemState value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDeletePullsListItemState value)? loading,
    TResult Function(SuccessDeletePullsListItemState value)? success,
    TResult Function(FailedDeletePullsListItemState value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessDeletePullsListItemState
    implements DeletePullsListItemState {
  const factory SuccessDeletePullsListItemState() =
      _$SuccessDeletePullsListItemState;
}

/// @nodoc
abstract class _$$FailedDeletePullsListItemStateCopyWith<$Res> {
  factory _$$FailedDeletePullsListItemStateCopyWith(
          _$FailedDeletePullsListItemState value,
          $Res Function(_$FailedDeletePullsListItemState) then) =
      __$$FailedDeletePullsListItemStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$FailedDeletePullsListItemStateCopyWithImpl<$Res>
    extends _$DeletePullsListItemStateCopyWithImpl<$Res,
        _$FailedDeletePullsListItemState>
    implements _$$FailedDeletePullsListItemStateCopyWith<$Res> {
  __$$FailedDeletePullsListItemStateCopyWithImpl(
      _$FailedDeletePullsListItemState _value,
      $Res Function(_$FailedDeletePullsListItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$FailedDeletePullsListItemState(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FailedDeletePullsListItemState
    implements FailedDeletePullsListItemState {
  const _$FailedDeletePullsListItemState(this.error);

  @override
  final String? error;

  @override
  String toString() {
    return 'DeletePullsListItemState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedDeletePullsListItemState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedDeletePullsListItemStateCopyWith<_$FailedDeletePullsListItemState>
      get copyWith => __$$FailedDeletePullsListItemStateCopyWithImpl<
          _$FailedDeletePullsListItemState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingDeletePullsListItemState value) loading,
    required TResult Function(SuccessDeletePullsListItemState value) success,
    required TResult Function(FailedDeletePullsListItemState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingDeletePullsListItemState value)? loading,
    TResult? Function(SuccessDeletePullsListItemState value)? success,
    TResult? Function(FailedDeletePullsListItemState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingDeletePullsListItemState value)? loading,
    TResult Function(SuccessDeletePullsListItemState value)? success,
    TResult Function(FailedDeletePullsListItemState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailedDeletePullsListItemState
    implements DeletePullsListItemState {
  const factory FailedDeletePullsListItemState(final String? error) =
      _$FailedDeletePullsListItemState;

  String? get error;
  @JsonKey(ignore: true)
  _$$FailedDeletePullsListItemStateCopyWith<_$FailedDeletePullsListItemState>
      get copyWith => throw _privateConstructorUsedError;
}
