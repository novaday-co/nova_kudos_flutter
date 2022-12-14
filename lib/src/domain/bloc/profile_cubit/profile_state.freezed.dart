// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetProfileRequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Achievement> achievements) success,
    required TResult Function(String? error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Achievement> achievements)? success,
    TResult? Function(String? error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Achievement> achievements)? success,
    TResult Function(String? error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingGetProfileRequestState value) loading,
    required TResult Function(SuccessGetProfileRequestState value) success,
    required TResult Function(FailedGetProfileRequestState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingGetProfileRequestState value)? loading,
    TResult? Function(SuccessGetProfileRequestState value)? success,
    TResult? Function(FailedGetProfileRequestState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingGetProfileRequestState value)? loading,
    TResult Function(SuccessGetProfileRequestState value)? success,
    TResult Function(FailedGetProfileRequestState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProfileRequestStateCopyWith<$Res> {
  factory $GetProfileRequestStateCopyWith(GetProfileRequestState value,
          $Res Function(GetProfileRequestState) then) =
      _$GetProfileRequestStateCopyWithImpl<$Res, GetProfileRequestState>;
}

/// @nodoc
class _$GetProfileRequestStateCopyWithImpl<$Res,
        $Val extends GetProfileRequestState>
    implements $GetProfileRequestStateCopyWith<$Res> {
  _$GetProfileRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingGetProfileRequestStateCopyWith<$Res> {
  factory _$$LoadingGetProfileRequestStateCopyWith(
          _$LoadingGetProfileRequestState value,
          $Res Function(_$LoadingGetProfileRequestState) then) =
      __$$LoadingGetProfileRequestStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingGetProfileRequestStateCopyWithImpl<$Res>
    extends _$GetProfileRequestStateCopyWithImpl<$Res,
        _$LoadingGetProfileRequestState>
    implements _$$LoadingGetProfileRequestStateCopyWith<$Res> {
  __$$LoadingGetProfileRequestStateCopyWithImpl(
      _$LoadingGetProfileRequestState _value,
      $Res Function(_$LoadingGetProfileRequestState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingGetProfileRequestState implements LoadingGetProfileRequestState {
  const _$LoadingGetProfileRequestState();

  @override
  String toString() {
    return 'GetProfileRequestState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingGetProfileRequestState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Achievement> achievements) success,
    required TResult Function(String? error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Achievement> achievements)? success,
    TResult? Function(String? error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Achievement> achievements)? success,
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
    required TResult Function(LoadingGetProfileRequestState value) loading,
    required TResult Function(SuccessGetProfileRequestState value) success,
    required TResult Function(FailedGetProfileRequestState value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingGetProfileRequestState value)? loading,
    TResult? Function(SuccessGetProfileRequestState value)? success,
    TResult? Function(FailedGetProfileRequestState value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingGetProfileRequestState value)? loading,
    TResult Function(SuccessGetProfileRequestState value)? success,
    TResult Function(FailedGetProfileRequestState value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingGetProfileRequestState implements GetProfileRequestState {
  const factory LoadingGetProfileRequestState() =
      _$LoadingGetProfileRequestState;
}

/// @nodoc
abstract class _$$SuccessGetProfileRequestStateCopyWith<$Res> {
  factory _$$SuccessGetProfileRequestStateCopyWith(
          _$SuccessGetProfileRequestState value,
          $Res Function(_$SuccessGetProfileRequestState) then) =
      __$$SuccessGetProfileRequestStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Achievement> achievements});
}

/// @nodoc
class __$$SuccessGetProfileRequestStateCopyWithImpl<$Res>
    extends _$GetProfileRequestStateCopyWithImpl<$Res,
        _$SuccessGetProfileRequestState>
    implements _$$SuccessGetProfileRequestStateCopyWith<$Res> {
  __$$SuccessGetProfileRequestStateCopyWithImpl(
      _$SuccessGetProfileRequestState _value,
      $Res Function(_$SuccessGetProfileRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievements = null,
  }) {
    return _then(_$SuccessGetProfileRequestState(
      null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
    ));
  }
}

/// @nodoc

class _$SuccessGetProfileRequestState implements SuccessGetProfileRequestState {
  const _$SuccessGetProfileRequestState(final List<Achievement> achievements)
      : _achievements = achievements;

  final List<Achievement> _achievements;
  @override
  List<Achievement> get achievements {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  @override
  String toString() {
    return 'GetProfileRequestState.success(achievements: $achievements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetProfileRequestState &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_achievements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetProfileRequestStateCopyWith<_$SuccessGetProfileRequestState>
      get copyWith => __$$SuccessGetProfileRequestStateCopyWithImpl<
          _$SuccessGetProfileRequestState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Achievement> achievements) success,
    required TResult Function(String? error) failed,
  }) {
    return success(achievements);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Achievement> achievements)? success,
    TResult? Function(String? error)? failed,
  }) {
    return success?.call(achievements);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Achievement> achievements)? success,
    TResult Function(String? error)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(achievements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingGetProfileRequestState value) loading,
    required TResult Function(SuccessGetProfileRequestState value) success,
    required TResult Function(FailedGetProfileRequestState value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingGetProfileRequestState value)? loading,
    TResult? Function(SuccessGetProfileRequestState value)? success,
    TResult? Function(FailedGetProfileRequestState value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingGetProfileRequestState value)? loading,
    TResult Function(SuccessGetProfileRequestState value)? success,
    TResult Function(FailedGetProfileRequestState value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessGetProfileRequestState implements GetProfileRequestState {
  const factory SuccessGetProfileRequestState(
      final List<Achievement> achievements) = _$SuccessGetProfileRequestState;

  List<Achievement> get achievements;
  @JsonKey(ignore: true)
  _$$SuccessGetProfileRequestStateCopyWith<_$SuccessGetProfileRequestState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedGetProfileRequestStateCopyWith<$Res> {
  factory _$$FailedGetProfileRequestStateCopyWith(
          _$FailedGetProfileRequestState value,
          $Res Function(_$FailedGetProfileRequestState) then) =
      __$$FailedGetProfileRequestStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$FailedGetProfileRequestStateCopyWithImpl<$Res>
    extends _$GetProfileRequestStateCopyWithImpl<$Res,
        _$FailedGetProfileRequestState>
    implements _$$FailedGetProfileRequestStateCopyWith<$Res> {
  __$$FailedGetProfileRequestStateCopyWithImpl(
      _$FailedGetProfileRequestState _value,
      $Res Function(_$FailedGetProfileRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$FailedGetProfileRequestState(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FailedGetProfileRequestState implements FailedGetProfileRequestState {
  const _$FailedGetProfileRequestState(this.error);

  @override
  final String? error;

  @override
  String toString() {
    return 'GetProfileRequestState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedGetProfileRequestState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedGetProfileRequestStateCopyWith<_$FailedGetProfileRequestState>
      get copyWith => __$$FailedGetProfileRequestStateCopyWithImpl<
          _$FailedGetProfileRequestState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Achievement> achievements) success,
    required TResult Function(String? error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Achievement> achievements)? success,
    TResult? Function(String? error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Achievement> achievements)? success,
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
    required TResult Function(LoadingGetProfileRequestState value) loading,
    required TResult Function(SuccessGetProfileRequestState value) success,
    required TResult Function(FailedGetProfileRequestState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingGetProfileRequestState value)? loading,
    TResult? Function(SuccessGetProfileRequestState value)? success,
    TResult? Function(FailedGetProfileRequestState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingGetProfileRequestState value)? loading,
    TResult Function(SuccessGetProfileRequestState value)? success,
    TResult Function(FailedGetProfileRequestState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailedGetProfileRequestState implements GetProfileRequestState {
  const factory FailedGetProfileRequestState(final String? error) =
      _$FailedGetProfileRequestState;

  String? get error;
  @JsonKey(ignore: true)
  _$$FailedGetProfileRequestStateCopyWith<_$FailedGetProfileRequestState>
      get copyWith => throw _privateConstructorUsedError;
}
