// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArticleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Article> articles) success,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Article> articles)? success,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Article> articles)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticleInitial value) initial,
    required TResult Function(ArticleLoading value) loading,
    required TResult Function(ArticleSuccess value) success,
    required TResult Function(ArticleError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticleInitial value)? initial,
    TResult? Function(ArticleLoading value)? loading,
    TResult? Function(ArticleSuccess value)? success,
    TResult? Function(ArticleError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticleInitial value)? initial,
    TResult Function(ArticleLoading value)? loading,
    TResult Function(ArticleSuccess value)? success,
    TResult Function(ArticleError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleStateCopyWith<$Res> {
  factory $ArticleStateCopyWith(
          ArticleState value, $Res Function(ArticleState) then) =
      _$ArticleStateCopyWithImpl<$Res, ArticleState>;
}

/// @nodoc
class _$ArticleStateCopyWithImpl<$Res, $Val extends ArticleState>
    implements $ArticleStateCopyWith<$Res> {
  _$ArticleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ArticleInitialImplCopyWith<$Res> {
  factory _$$ArticleInitialImplCopyWith(_$ArticleInitialImpl value,
          $Res Function(_$ArticleInitialImpl) then) =
      __$$ArticleInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ArticleInitialImplCopyWithImpl<$Res>
    extends _$ArticleStateCopyWithImpl<$Res, _$ArticleInitialImpl>
    implements _$$ArticleInitialImplCopyWith<$Res> {
  __$$ArticleInitialImplCopyWithImpl(
      _$ArticleInitialImpl _value, $Res Function(_$ArticleInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ArticleInitialImpl implements ArticleInitial {
  const _$ArticleInitialImpl();

  @override
  String toString() {
    return 'ArticleState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ArticleInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Article> articles) success,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Article> articles)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Article> articles)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticleInitial value) initial,
    required TResult Function(ArticleLoading value) loading,
    required TResult Function(ArticleSuccess value) success,
    required TResult Function(ArticleError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticleInitial value)? initial,
    TResult? Function(ArticleLoading value)? loading,
    TResult? Function(ArticleSuccess value)? success,
    TResult? Function(ArticleError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticleInitial value)? initial,
    TResult Function(ArticleLoading value)? loading,
    TResult Function(ArticleSuccess value)? success,
    TResult Function(ArticleError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ArticleInitial implements ArticleState {
  const factory ArticleInitial() = _$ArticleInitialImpl;
}

/// @nodoc
abstract class _$$ArticleLoadingImplCopyWith<$Res> {
  factory _$$ArticleLoadingImplCopyWith(_$ArticleLoadingImpl value,
          $Res Function(_$ArticleLoadingImpl) then) =
      __$$ArticleLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ArticleLoadingImplCopyWithImpl<$Res>
    extends _$ArticleStateCopyWithImpl<$Res, _$ArticleLoadingImpl>
    implements _$$ArticleLoadingImplCopyWith<$Res> {
  __$$ArticleLoadingImplCopyWithImpl(
      _$ArticleLoadingImpl _value, $Res Function(_$ArticleLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ArticleLoadingImpl implements ArticleLoading {
  const _$ArticleLoadingImpl();

  @override
  String toString() {
    return 'ArticleState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ArticleLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Article> articles) success,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Article> articles)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Article> articles)? success,
    TResult Function(Failure failure)? error,
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
    required TResult Function(ArticleInitial value) initial,
    required TResult Function(ArticleLoading value) loading,
    required TResult Function(ArticleSuccess value) success,
    required TResult Function(ArticleError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticleInitial value)? initial,
    TResult? Function(ArticleLoading value)? loading,
    TResult? Function(ArticleSuccess value)? success,
    TResult? Function(ArticleError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticleInitial value)? initial,
    TResult Function(ArticleLoading value)? loading,
    TResult Function(ArticleSuccess value)? success,
    TResult Function(ArticleError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ArticleLoading implements ArticleState {
  const factory ArticleLoading() = _$ArticleLoadingImpl;
}

/// @nodoc
abstract class _$$ArticleSuccessImplCopyWith<$Res> {
  factory _$$ArticleSuccessImplCopyWith(_$ArticleSuccessImpl value,
          $Res Function(_$ArticleSuccessImpl) then) =
      __$$ArticleSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Article> articles});
}

/// @nodoc
class __$$ArticleSuccessImplCopyWithImpl<$Res>
    extends _$ArticleStateCopyWithImpl<$Res, _$ArticleSuccessImpl>
    implements _$$ArticleSuccessImplCopyWith<$Res> {
  __$$ArticleSuccessImplCopyWithImpl(
      _$ArticleSuccessImpl _value, $Res Function(_$ArticleSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_$ArticleSuccessImpl(
      null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc

class _$ArticleSuccessImpl implements ArticleSuccess {
  const _$ArticleSuccessImpl(final List<Article> articles)
      : _articles = articles;

  final List<Article> _articles;
  @override
  List<Article> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'ArticleState.success(articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleSuccessImpl &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleSuccessImplCopyWith<_$ArticleSuccessImpl> get copyWith =>
      __$$ArticleSuccessImplCopyWithImpl<_$ArticleSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Article> articles) success,
    required TResult Function(Failure failure) error,
  }) {
    return success(articles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Article> articles)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return success?.call(articles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Article> articles)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(articles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticleInitial value) initial,
    required TResult Function(ArticleLoading value) loading,
    required TResult Function(ArticleSuccess value) success,
    required TResult Function(ArticleError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticleInitial value)? initial,
    TResult? Function(ArticleLoading value)? loading,
    TResult? Function(ArticleSuccess value)? success,
    TResult? Function(ArticleError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticleInitial value)? initial,
    TResult Function(ArticleLoading value)? loading,
    TResult Function(ArticleSuccess value)? success,
    TResult Function(ArticleError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ArticleSuccess implements ArticleState {
  const factory ArticleSuccess(final List<Article> articles) =
      _$ArticleSuccessImpl;

  List<Article> get articles;
  @JsonKey(ignore: true)
  _$$ArticleSuccessImplCopyWith<_$ArticleSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ArticleErrorImplCopyWith<$Res> {
  factory _$$ArticleErrorImplCopyWith(
          _$ArticleErrorImpl value, $Res Function(_$ArticleErrorImpl) then) =
      __$$ArticleErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ArticleErrorImplCopyWithImpl<$Res>
    extends _$ArticleStateCopyWithImpl<$Res, _$ArticleErrorImpl>
    implements _$$ArticleErrorImplCopyWith<$Res> {
  __$$ArticleErrorImplCopyWithImpl(
      _$ArticleErrorImpl _value, $Res Function(_$ArticleErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ArticleErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ArticleErrorImpl implements ArticleError {
  const _$ArticleErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ArticleState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleErrorImplCopyWith<_$ArticleErrorImpl> get copyWith =>
      __$$ArticleErrorImplCopyWithImpl<_$ArticleErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Article> articles) success,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Article> articles)? success,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Article> articles)? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticleInitial value) initial,
    required TResult Function(ArticleLoading value) loading,
    required TResult Function(ArticleSuccess value) success,
    required TResult Function(ArticleError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticleInitial value)? initial,
    TResult? Function(ArticleLoading value)? loading,
    TResult? Function(ArticleSuccess value)? success,
    TResult? Function(ArticleError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticleInitial value)? initial,
    TResult Function(ArticleLoading value)? loading,
    TResult Function(ArticleSuccess value)? success,
    TResult Function(ArticleError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ArticleError implements ArticleState {
  const factory ArticleError(final Failure failure) = _$ArticleErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ArticleErrorImplCopyWith<_$ArticleErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
