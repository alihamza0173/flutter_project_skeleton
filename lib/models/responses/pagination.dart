import 'package:built_collection/built_collection.dart';

class Pagination<T> {
  final BuiltList<T> results;
  final int count;

  Pagination({
    required final dynamic data,
    required final BuiltList<T> Function(List<dynamic> items) results,
  })  : count = data['metaData']['totalCount'],
        results = results(data['data']);

  Pagination.fromResults(this.results) : count = results.length;
}
