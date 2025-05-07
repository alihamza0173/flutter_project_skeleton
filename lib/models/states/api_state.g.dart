// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiState<T> extends ApiState<T> {
  @override
  final T? data;
  @override
  final bool isApiInProgress;
  @override
  final ApiMetaData? error;
  @override
  final String? message;
  @override
  final double? progress;
  @override
  final bool isApiPaginationEnabled;
  @override
  final int totalCount;

  factory _$ApiState([void Function(ApiStateBuilder<T>)? updates]) =>
      (new ApiStateBuilder<T>()..update(updates))._build();

  _$ApiState._(
      {this.data,
      required this.isApiInProgress,
      this.error,
      this.message,
      this.progress,
      required this.isApiPaginationEnabled,
      required this.totalCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isApiInProgress, r'ApiState', 'isApiInProgress');
    BuiltValueNullFieldError.checkNotNull(
        isApiPaginationEnabled, r'ApiState', 'isApiPaginationEnabled');
    BuiltValueNullFieldError.checkNotNull(
        totalCount, r'ApiState', 'totalCount');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'ApiState', 'T');
    }
  }

  @override
  ApiState<T> rebuild(void Function(ApiStateBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiStateBuilder<T> toBuilder() => new ApiStateBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiState &&
        data == other.data &&
        isApiInProgress == other.isApiInProgress &&
        error == other.error &&
        message == other.message &&
        progress == other.progress &&
        isApiPaginationEnabled == other.isApiPaginationEnabled &&
        totalCount == other.totalCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, isApiInProgress.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, progress.hashCode);
    _$hash = $jc(_$hash, isApiPaginationEnabled.hashCode);
    _$hash = $jc(_$hash, totalCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiState')
          ..add('data', data)
          ..add('isApiInProgress', isApiInProgress)
          ..add('error', error)
          ..add('message', message)
          ..add('progress', progress)
          ..add('isApiPaginationEnabled', isApiPaginationEnabled)
          ..add('totalCount', totalCount))
        .toString();
  }
}

class ApiStateBuilder<T> implements Builder<ApiState<T>, ApiStateBuilder<T>> {
  _$ApiState<T>? _$v;

  T? _data;
  T? get data => _$this._data;
  set data(T? data) => _$this._data = data;

  bool? _isApiInProgress;
  bool? get isApiInProgress => _$this._isApiInProgress;
  set isApiInProgress(bool? isApiInProgress) =>
      _$this._isApiInProgress = isApiInProgress;

  ApiMetaDataBuilder? _error;
  ApiMetaDataBuilder get error => _$this._error ??= new ApiMetaDataBuilder();
  set error(ApiMetaDataBuilder? error) => _$this._error = error;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  double? _progress;
  double? get progress => _$this._progress;
  set progress(double? progress) => _$this._progress = progress;

  bool? _isApiPaginationEnabled;
  bool? get isApiPaginationEnabled => _$this._isApiPaginationEnabled;
  set isApiPaginationEnabled(bool? isApiPaginationEnabled) =>
      _$this._isApiPaginationEnabled = isApiPaginationEnabled;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  ApiStateBuilder() {
    ApiState._initialize(this);
  }

  ApiStateBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _isApiInProgress = $v.isApiInProgress;
      _error = $v.error?.toBuilder();
      _message = $v.message;
      _progress = $v.progress;
      _isApiPaginationEnabled = $v.isApiPaginationEnabled;
      _totalCount = $v.totalCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiState<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiState<T>;
  }

  @override
  void update(void Function(ApiStateBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiState<T> build() => _build();

  _$ApiState<T> _build() {
    ApiState._finalize(this);
    _$ApiState<T> _$result;
    try {
      _$result = _$v ??
          new _$ApiState<T>._(
            data: data,
            isApiInProgress: BuiltValueNullFieldError.checkNotNull(
                isApiInProgress, r'ApiState', 'isApiInProgress'),
            error: _error?.build(),
            message: message,
            progress: progress,
            isApiPaginationEnabled: BuiltValueNullFieldError.checkNotNull(
                isApiPaginationEnabled, r'ApiState', 'isApiPaginationEnabled'),
            totalCount: BuiltValueNullFieldError.checkNotNull(
                totalCount, r'ApiState', 'totalCount'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
