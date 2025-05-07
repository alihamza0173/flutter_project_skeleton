import 'package:built_collection/built_collection.dart';

extension XIterable<E> on Iterable<E> {
  Iterable<E> subset(final int maxCount) {
    if (length > maxCount) {
      return toList().sublist(0, maxCount);
    }
    return this;
  }

  Iterable<E> between(final E element) {
    final list = <E>[];
    for (int i = 0; i < length; i++) {
      list.add(elementAt(i));
      if (i < length - 1) {
        list.add(element);
      }
    }
    return list;
  }
}

extension XListString on List<String> {
  List<String> trim() {
    removeWhere(
      (final element) => element.trim().isEmpty,
    );
    return this;
  }
}

extension XBuiltList<E> on BuiltList<E> {
  BuiltList<E> subset(final int maxCount) {
    if (length > maxCount) {
      return sublist(0, maxCount);
    }
    return this;
  }
}

extension XListBuilder<E> on ListBuilder<E> {
  void removeRangeToEnd(final int start) {
    if (start < length) {
      removeRange(start, length);
    }
  }
}
