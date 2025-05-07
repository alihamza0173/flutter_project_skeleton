import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const AppText(
    this.data, {
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(final BuildContext context) {
    if (kIsWeb) {
      return SelectableText(
        data,
        style: (style ?? const TextStyle()).copyWith(
          overflow: overflow,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    } else {
      return Text(
        data,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      );
    }
  }

  static Widget rich(
    final TextSpan textSpan, {
    final TextStyle? style,
    final TextAlign? textAlign,
    final TextOverflow? overflow,
    final int? maxLines,
  }) {
    if (kIsWeb) {
      return SelectableText.rich(
        textSpan,
        style: (style ?? const TextStyle()).copyWith(
          overflow: overflow,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    } else {
      return Text.rich(
        textSpan,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      );
    }
  }
}
