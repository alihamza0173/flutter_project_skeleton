import 'package:flutter/material.dart';

class ColorUtils {
  ColorUtils._();

  static int _getIntFromHex(final String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    return int.parse(buffer.toString(), radix: 16);
  }

  static Color fromHex(final String hex) {
    return Color(_getIntFromHex(hex));
  }
}
