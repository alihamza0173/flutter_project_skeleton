import '../data/meta_data.dart';

class ApiResponse {
  final ApiMetaData metaData;
  final dynamic data;

  ApiResponse(final dynamic json)
      : metaData = ApiMetaData.fromDynamic(json['metaData']),
        data = json['data'];
}
