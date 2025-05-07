import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:wc_dart_framework/wc_dart_framework.dart';

import '../../others/constants.dart';
import '../serializers.dart';

part 'meta_data.g.dart';

final _logger = Logger('meta_data.dart');

abstract class ApiMetaData implements Built<ApiMetaData, ApiMetaDataBuilder> {
  factory ApiMetaData([final void Function(ApiMetaDataBuilder) updates]) =
      _$ApiMetaData;

  ApiMetaData._();

  @BuiltValueHook(initializeBuilder: true)
  static void _initialize(final ApiMetaDataBuilder b) =>
      b
        ..status = -1
        ..key = '';

  Object? get status;

  String get message;

  String get key;

  static ApiMetaData fromDynamic(final dynamic json) {
    return serializers.deserializeWith(ApiMetaData.serializer, json)!;
  }

  static ApiMetaData fromMessage(final String message) {
    return ApiMetaData((final b) => b.message = message);
  }

  static Serializer<ApiMetaData> get serializer => _$apiMetaDataSerializer;

  @override
  String toString() {
    return message;
  }

  static ApiMetaData fromException(final dynamic exception) {
    if (exception is DioException) {
      final response = exception.response;
      _logger.severe('exception response: $response');
      if (exception.type == DioExceptionType.unknown &&
          exception.error is! SocketException) {
        // do nothing
      } else if (response == null) {
        return ApiMetaData.fromMessage(ERROR_CONNECTION_FAILURE);
      } else if (response.data is Map && response.data['metaData'] != null) {
        try {
          return ApiMetaData.fromDynamic(response.data['metaData']);
        } catch (_) {
          return ApiMetaData.fromMessage(
            'Error Code: ${response.statusCode ?? -1}',
          );
        }
      } else if (response.data is String) {
        return ApiMetaData.fromMessage(
          'Server Error: ${response.statusCode ?? -1}',
        );
      }
    }
    return ApiMetaData.fromMessage(exception.toString());
  }
}
