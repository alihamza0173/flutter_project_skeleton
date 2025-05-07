import 'package:dio/dio.dart';
import 'package:wc_dart_framework/wc_dart_framework.dart';

import '../blocs/singleton_bloc.dart';
import '../core/config.dart';

export 'package:dio/dio.dart';

final _logger = Logger('dio.dart');

Dio _createDioInstance() {
  final headers = <String, dynamic>{};
  final options = BaseOptions(
    baseUrl: '${config.apiUrl}/',
    headers: headers,
    connectTimeout: const Duration(milliseconds: 20000),
    receiveTimeout: const Duration(milliseconds: 20000),
  );
  final dio = Dio(options);
  dio.interceptors.add(_CustomInterceptor());
  return dio;
}

class _CustomInterceptor extends Interceptor {
  final ignoreAuthForPaths = <String>[];
  final ignore401ForPaths = <String>['user/auth/login'];

  _CustomInterceptor();

  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    if (!ignoreAuthForPaths.contains(options.path)) {
      final authorization = singletonBloc.profileBloc.state;
      if (authorization != null) {
        options.headers['Authorization'] = 'Bearer $authorization';
      }
    }
    _logger.fine(
      'PATH: ${options.method} ${options.path} ${options.queryParameters}',
    );
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    final DioException err,
    final ErrorInterceptorHandler handler,
  ) async {
    _logger.severe(
      'PATH: ${err.requestOptions.method} ${err.requestOptions.path} || ERROR: ${err.message}',
    );
    if (err.response?.statusCode == 401) {
      if (!ignore401ForPaths.contains(err.requestOptions.path)) {
        singletonBloc.profileBloc.logout();
      }
    }
    super.onError(err, handler);
  }
}

final Dio dio = _createDioInstance();

void cancelDioToken(final CancelToken? token) {
  if (token == null) {
    return;
  }
  if (token.isCancelled) {
    return;
  }
  try {
    token.cancel();
  } catch (e) {
    _logger.severe('cancelDioToken: $e');
  }
}
