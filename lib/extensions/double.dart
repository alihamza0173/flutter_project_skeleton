extension XDouble on double {
  double toDoubleAsFixed(final int fractionDigits) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  String toFormattedNumber([final int? fractionDigits]) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String mathFunc(final Match match) => '${match[1]},';
    final String sDouble;
    if (fractionDigits != null) {
      sDouble = toStringAsFixed(fractionDigits);
    } else {
      sDouble = toString();
    }
    return sDouble.replaceAllMapped(reg, mathFunc);
  }

  String toStringWithoutDecimalIfPossible([final int? fractionDigits]) {
    if (this == toInt().toDouble()) {
      return toInt().toString();
    }
    if (fractionDigits != null) {
      return toStringAsFixed(fractionDigits);
    } else {
      return toString();
    }
  }

  double toBaseSize() {
    const base = 15.0;
    const to = 15.0;
    return to / base * this;
  }
}
