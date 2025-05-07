import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:wc_dart_framework/wc_dart_framework.dart';

import '../models/data/meta_data.dart';
import '../models/responses/pagination.dart';
import '../models/states/api_state.dart';
import 'cubit.dart';
import 'dio.dart';

class CubitUtils {
  const CubitUtils._();

  static Future<bool> makePaginatedApiCall<V extends Built<V, B>,
      B extends Builder<V, B>, BLData>({
    required final BVCubit<V, B> cubit,
    required final ApiState<BuiltList<BLData>> Function() apiState,
    required final void Function(B b, ApiState<BuiltList<BLData>> apiState)
        updateApiState,
    required final Future<Pagination<BLData>> Function(int offset) callApi,
    final bool forceOffsetZero = false,
    final bool makeDataNullAtStart = false,
    final String? successMessage,
    final FutureOr<void> Function(Object error)? onError,
    final FutureOr<void> Function()? onSuccess,
  }) {
    return _changeApiState<V, B, BuiltList<BLData>>(
      cubit: cubit,
      apiState: apiState,
      updateApiState: updateApiState,
      getLatestApiState: () async {
        final int offset = forceOffsetZero ? 0 : apiState().data?.length ?? 0;
        final pagination = await callApi(offset);
        final as = apiState();
        return as.rebuild(
          (final b) {
            if (offset == 0) {
              b.data = pagination.results;
            } else {
              final bData = ListBuilder<BLData>();
              final currentData = as.data;
              if (currentData != null) {
                bData.addAll(currentData);
              }
              bData.addAll(pagination.results);
              final newData = bData.build();
              b.data = newData;
            }
            b.totalCount = pagination.count;
            b.isApiPaginationEnabled = b.data!.length < pagination.count;
          },
        );
      },
      makeDataNullAtStart: makeDataNullAtStart,
      onError: onError,
      onSuccess: onSuccess,
      successMessage: successMessage,
    );
  }

  static Future<bool> makeApiCall<V extends Built<V, B>,
      B extends Builder<V, B>, ApiStateData>({
    required final BVCubit<V, B> cubit,
    required final ApiState<ApiStateData> Function() apiState,
    required final void Function(B b, ApiState<ApiStateData> apiState)
        updateApiState,
    required final Future<ApiStateData> Function() callApi,
    final bool makeDataNullAtStart = false,
    final String? successMessage,
    final FutureOr<void> Function(Object error)? onError,
    final FutureOr<void> Function()? onSuccess,
  }) {
    return _changeApiState<V, B, ApiStateData>(
      cubit: cubit,
      apiState: apiState,
      updateApiState: updateApiState,
      getLatestApiState: () async {
        final data = await callApi();
        return apiState().rebuild((final b) => b.data = data);
      },
      makeDataNullAtStart: makeDataNullAtStart,
      successMessage: successMessage,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  static Future<bool> _changeApiState<V extends Built<V, B>,
      B extends Builder<V, B>, ApiStateData>({
    required final BVCubit<V, B> cubit,
    required final ApiState<ApiStateData> Function() apiState,
    required final void Function(B b, ApiState<ApiStateData> apiState)
        updateApiState,
    required final Future<ApiState<ApiStateData>> Function() getLatestApiState,
    required final bool makeDataNullAtStart,
    required final String? successMessage,
    required final FutureOr<void> Function(Object error)? onError,
    required final FutureOr<void> Function()? onSuccess,
  }) async {
    await Future.delayed(Duration.zero);
    var latestApiState = apiState().rebuild(
      (final bApiState) {
        bApiState
          ..isApiInProgress = true
          ..error = null
          ..message = null;
        if (makeDataNullAtStart) {
          bApiState.data = null;
        }
      },
    );
    cubit.emit(
      cubit.state.rebuild(
        (final b) => updateApiState(
          b,
          latestApiState,
        ),
      ),
    );
    var isSuccess = false;
    try {
      latestApiState = await getLatestApiState();
      latestApiState = latestApiState.rebuild(
        (final b) => b..message = successMessage,
      );
      isSuccess = true;
    } catch (e) {
      if (!(e is DioException && e.type == DioExceptionType.cancel)) {
        latestApiState = latestApiState.rebuild(
          (final b) => b.error.replace(ApiMetaData.fromException(e)),
        );
        await onError?.call(e);
      }
    }
    cubit.emit(
      cubit.state.rebuild(
        (final b) {
          updateApiState(
            b,
            latestApiState.rebuild(
              (final bApiState) => bApiState.isApiInProgress = false,
            ),
          );
        },
      ),
    );
    if (isSuccess) {
      onSuccess?.call();
    }
    return isSuccess;
  }

  static V dehydrate<V extends Built<V, B>, B extends Builder<V, B>, Data>({
    required final V state,
    required final String key,
    required final Logger logger,
    required final Map<String, dynamic> json,
    required final Data Function(dynamic) fromDynamic,
    required final void Function(B b, Data data) updateData,
  }) {
    if (json[key] == null) {
      return state;
    }
    try {
      final data = fromDynamic(json[key]);
      return state.rebuild(
        (final b) => updateData(b, data),
      );
    } catch (e) {
      logger.severe('dehydrate: $e');
      return state;
    }
  }
}
