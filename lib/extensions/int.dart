import 'double.dart';

extension EInt on int {
  String toFixedLength([final int length = 2]) {
    final currentLength = toString().length;
    if (currentLength >= length) {
      return toString();
    } else {
      final zeros = StringBuffer();
      for (int i = 0; i < length - currentLength; i++) {
        zeros.write('0');
      }
      return '$zeros$this';
    }
  }

  String toFormattedNumber() {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String mathFunc(final Match match) => '${match[1]},';
    return toString().replaceAllMapped(reg, mathFunc);
  }

  double toBaseSize() => toDouble().toBaseSize();
}
