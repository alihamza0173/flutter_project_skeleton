import 'package:built_value/built_value.dart';

import '../data/meta_data.dart';

part 'api_state.g.dart';

abstract class ApiState<T> implements Built<ApiState<T>, ApiStateBuilder<T>> {
  factory ApiState([final void Function(ApiStateBuilder<T>) updates]) =
      _$ApiState<T>;

  ApiState._();

  @BuiltValueHook(initializeBuilder: true)
  static void _initialize<T>(final ApiStateBuilder<T> b) =>
      b
        ..isApiInProgress = false
        ..isApiPaginationEnabled = false;

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize<T>(final ApiStateBuilder<T> b) {
    if (b.totalCount == null || b.totalCount == -1) {
      final data = b.data;
      if (data is Iterable) {
        b.totalCount = data.length;
      } else {
        b.totalCount = -1;
      }
    }
  }

  T? get data;

  bool get isApiInProgress;

  ApiMetaData? get error;

  String? get message;

  double? get progress;

  bool get isApiPaginationEnabled;

  int get totalCount;
}
